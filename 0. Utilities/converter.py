import glob
from pathlib import Path
from argparse import ArgumentParser

# function to process new lines
def convert_escape(old_line):
    new_line = old_line.replace('\\', '\\\\')
    new_line = new_line.replace('"', '\\"')
    new_line = '"' + new_line
    return new_line

def convert(file_name: Path):
    # start by opening the file
    with open(file_name, mode='r') as file:
        lines_output = []
        indent = 8
        for line in file:
            # format B does not have blank lines, so they can be skipped
            if line.isspace() == False:

                # leading (indent) and trailing spaces can be removed
                working_line = line.strip()

                # begin performing conversion
                if (working_line[0:4] == 'XMLB') and (working_line[-1] == '{'):
                    # this is for the header
                    lines_output.append('{')
                    lines_output.append((' ' * 4) + '"' + working_line[4:-1].strip() + '": {')
                elif working_line == '}':
                    # this deals with lines that are closing brackets. Their indent is less than the previous line
                    indent -= 4
                    # previous line does not need to end in a comma
                    lines_output[-1] = lines_output[-1].strip(',')
                    lines_output.append((' ' * indent) + '},')
                elif working_line[-1] == '{':
                    # this deals with lines with open brackets. They increase the indent
                    working_line = convert_escape(working_line)
                    lines_output.append((' ' * indent) + working_line[:-1].strip() + '": {')
                    indent += 4
                else:
                    working_line = convert_escape(working_line)
                    working_line = working_line.replace(' = ', '": "', 1)
                    if working_line[-1] == ';': working_line = working_line[:-1].strip()
                    lines_output.append((' ' * indent) + working_line + '",')

    # if a full file is being converted, need to add an extra bracket because header is now 2 lines (+ remove previous comma)
    if lines_output[0] == '{':
        lines_output[-1] = lines_output[-1].strip(',')
        lines_output.append('}')

    # once the conversion is done, you can write it all to the new file        
    with open(file_name_out, mode = 'w') as file:
        for line in lines_output:
            file.write(line)
            file.write('\n')

# read optional argument as input, another optional as output
parser = ArgumentParser()
parser.add_argument('input', nargs='?', default='input?', help='input file (supports glob)')
parser.add_argument('output', nargs='?', default='*.json', help='output file (wildcards will be replaced by input file name)')
args = parser.parse_args()
input_files = glob.glob(args.input, recursive=True)

# if no argument given or found, ask for input, else process argument
if not input_files:
    input_files = 'input?'
if input_files == 'input?':
    file_name = input('File to Convert with extension (ex: herostat.txt)> ')
    file_name = Path(file_name)
    file_name_out = file_name.with_suffix('.json')
    convert(file_name)
else:
    for file_name in input_files:
        file_name_out = args.output
        if '*' in file_name_out:
            file_name_out = file_name_out.replace('*', Path(file_name).stem)
        convert(file_name)


with open("permanent.fb.cfg", mode='r') as file:
    fileContent = file.read()
    contentList = fileContent.split("\n")
    
with open("permanent.pkgb.json", mode='w') as file:
    file.write('{\n')
    file.write('    "packagedef": {\n')
    i = 0
    for line in contentList:
        line = line.split()
        fileNameFull = line[0]
        fileNameFull = fileNameFull.split(".")
        fileName = fileNameFull[0]
        fileType = line[2]
        file.write('        "' + fileType + '": {\n')
        file.write('            "filename": "' + fileName + '"\n')
        if i == len(contentList) - 1:
            file.write('        }\n')
        else:
            file.write('        },\n')
        i += 1
    file.write('    }\n')
    file.write('}')
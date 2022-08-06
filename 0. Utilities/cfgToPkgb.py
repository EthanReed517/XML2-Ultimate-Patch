name = input("What is the name of the cfg file without the file extension? ")
nameCfg = name[0:-4] + ".fb.cfg"
nameJson = name[0:-4] + ".pkgb.json"

with open(nameCfg, mode='r') as file:
    fileContent = file.read()
    contentList = fileContent.split("\n")
    
with open(nameJson, mode='w') as file:
    file.write('{\n')
    file.write('    "packagedef": {\n')
    i = 0
    for line in contentList:
        line = line.split()
        fileNameFull = line[0]
        fileNameFull = fileNameFull.split(".")
        fileName = fileNameFull[0]
        fileType = line[2]
        if (fileType=="actoranimdb") or (fileType=="actorskin"):
            fileName = fileName[7:]
        file.write('        "' + fileType + '": {\n')
        file.write('            "filename": "' + fileName + '"\n')
        if i == len(contentList) - 1:
            file.write('        }\n')
        else:
            file.write('        },\n')
        i += 1
    file.write('    }\n')
    file.write('}')
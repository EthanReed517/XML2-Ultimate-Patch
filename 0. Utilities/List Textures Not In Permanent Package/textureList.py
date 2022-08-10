# ####### #
# IMPORTS #
# ####### #
# To check if a file exists
import os
from os import listdir
from os.path import exists, isfile, join


# ######### #
# FUNCTIONS #
# ######### #

def textureRead(textureList,fileName):
    with open(fileName, mode='r') as file:
        for line in file:
            if "texture" in line:
                textureName = line[33:-7] + ".igb"
                textureList.append(textureName)
    return(textureList)

# ############## #
# MAIN EXECUTION #
# ############## #   

script_dir = os.path.abspath( os.path.dirname( __file__ ) ) 
fileList = [f for f in listdir(script_dir) if isfile(join(script_dir, f))]

filesToCheck = []
for file in fileList:
    if file[-4:] == "json":
        filesToCheck.append(file)


textureList = []
for file in filesToCheck:
    textureList = textureRead(textureList,file)
        
textureList = [*set(textureList)]
textureList = sorted(textureList)

with open("textureList.txt", mode='a') as file:
    for item in textureList:
        file.write(item + "\n")
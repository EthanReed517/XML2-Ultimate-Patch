# ####### #
# IMPORTS #
# ####### #
# To check if a file exists
from os.path import exists
# To be able to parse the ini file
import configparser
# to be able to read files in a sub-folder
import os

# ######### #
# FUNCTIONS #
# ######### #

# This function checks the settings in compile.ini
def parseConfig():
    config = configparser.ConfigParser()
    config.read('compile.ini')
    firstLine = config['DEFAULT']['firstLine']
    folderName = config['DEFAULT']['folderName']
    extension = config['DEFAULT']['extension']
    return [firstLine,folderName,extension]

# This function gets the contents of roster.cfg
def rosterList():
    name = "roster.cfg"
    with open(name, mode='r') as file:
        fileContent = file.read()
        charList = fileContent.split("\n")
    return charList
    
def fileBuilder(charList,firstLine,folderName,extension):
    name = "out.engb" + extension
    with open(name, mode='w') as file:
        file.write(firstLine)
        file.write("\n")
    fileDir = os.path.dirname(os.path.realpath('__file__'))
    for names in charList:
        fileName = folderName + "/" + names + extension
        fileNameFull = os.path.join(fileDir,fileName)
        file1 = open(name, 'a+')
        file2 = open(fileNameFull, 'r')
        file1.write(file2.read())
        file1.write("\n")
        file1.close()
        file2.close()
    with open(name, mode='a+') as file:
        file.write("}")
    
    
    
    
# ############## #
# MAIN EXECUTION #
# ############## #
[line1,folder,fileExtension] = parseConfig()
chars = rosterList()
fileBuilder(chars,line1,folder,fileExtension)
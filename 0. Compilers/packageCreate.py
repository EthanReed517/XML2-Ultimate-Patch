# ####### #
# IMPORTS #
# ####### #
# To check if a file exists
from os.path import exists
# To be able to parse the ini file
import configparser

# ######### #
# FUNCTIONS #
# ######### #

# This function checks the settings in compile.ini
def parseConfig():
    config = configparser.ConfigParser()
    config.read('compile.ini')
    name = config['DEFAULT']['firstPackageName']
    numbers = config['DEFAULT']['additionalSkins']
    numbersList = numbers.split(",")
    return [name,numbersList]

# This function gets user input if an ini does not exist
def userInput():
    print("What is the name of the main combat package? Do not include file extensions (ex: cyclops_0101)")
    name = input("Input: ")
    print("What are the additional skin numbers? Enter a list separated by commas.")
    print("(ex: 0102,0103,0104,0105,0106,0107,0108,0109)")
    numbers = input("Input: ")
    numbersList = numbers.split(",")
    return [name,numbersList]

# This function gets the necessary information from the package
def packageInfo(name):
    nameFile = name + ".pkgb.json"
    nameNCFile = name + "_nc.pkgb.json"
    skinNo = name[name.rindex("_")+1:len(name)]
    return [nameFile,nameNCFile,skinNo]

# This function opens the package and returns its contents
def openPackage(name):
    with open(name, mode='r') as file:
        fileContent = file.read()
        contentList = fileContent.split("\n")
        return contentList

# This function takes in the existing package contents.
# It uses this and the skin numbers to write a new package for the new skin.
def packageRenumber(name,oldNo,newNo,contentList):
    newContentList = contentList
    i = 0
    while i < len(newContentList):
        if oldNo in newContentList[i]:
            newContentList[i] = newContentList[i].replace(oldNo, newNo)
        i +=1
    nameOut = name.replace(oldNo,newNo)
    with open(nameOut, mode='w') as file:
        for line in newContentList:
            file.write(line)
            file.write('\n')
    while("\n" in newContentList):
        newContentList.remove("")

# ############## #
# MAIN EXECUTION #
# ############## #

# check if there is an ini file for this character
iniExists = exists('compile.ini')
if iniExists == True:
    # get the contents of the ini file
    [packageName,newNumbersList] = parseConfig()
else:
    # ask for the information
    [packageName,newNumbersList] = userInput()

# Generate the information about the package
[fileName,ncFileName,oldNumber] = packageInfo(packageName)
# Open the package and get its contents
packageContents = openPackage(fileName)
ncPackageContents = openPackage(ncFileName)

# Generate the packages for the additional skins
for newNumber in newNumbersList:
    # For some reason, I have to call the openPackage function every time
    # the loop is run.
    # Otherwise, packageContents gets overwritten with the new package
    # contents even though the variable is never changed
    packageContents = openPackage(fileName)
    packageRenumber(fileName,oldNumber,newNumber,packageContents)
    ncPackageContents = openPackage(ncFileName)
    packageRenumber(ncFileName,oldNumber,newNumber,ncPackageContents)
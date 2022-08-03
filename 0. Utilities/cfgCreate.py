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
    xboxIcons = config['DEFAULT']['xboxIcons2']
    return [name,numbersList,xboxIcons]

# This function gets user input if an ini does not exist
def userInput():
    print("What is the name of the main combat package? Do not include file extensions (ex: cyclops_0101)")
    name = input("Input: ")
    print("What are the additional skin numbers? Enter a list separated by commas.")
    print("(ex: 0102,0103,0104,0105,0106,0107,0108,0109)")
    numbers = input("Input: ")
    numbersList = numbers.split(",")
    print("Do you want to use icons2 files for the Xbox non-combat packages?")
    xboxIcons = input("[Y/N] ")
    return [name,numbersList,xboxIcons]

# This function gets the necessary information from the package
def packageInfo(name):
    nameFile = name + ".fb.cfg"
    nameNCFile = name + "_nc.fb.cfg"
    skinNo = name[name.index("_")+1:len(name)]
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
    i = 0
    newContentList = contentList
    while i < len(newContentList):
        if oldNo in newContentList[i]:
            newContentList[i] = newContentList[i].replace(oldNo, newNo)
        i +=1
    nameOut = name.replace(oldNo,newNo)
    with open(nameOut, mode='w') as file:
        for line in newContentList:
            file.write(line)
            file.write('\n')

# This function creates the Xbox _nc packages that use _icons2 instead of _icons1
def xboxNC(name):
    with open(name, mode='r') as file:
        fileContent = file.read()
        contentList = fileContent.split("\n")
    i = 0
    newContentList = contentList
    while i < len(newContentList):
        if "icons1" in newContentList[i]:
            newContentList[i] = newContentList[i].replace("icons1", "icons2")
        i +=1
    nameOut = name[:-4] + ".xbox"
    with open(nameOut, mode='w') as file:
        for line in newContentList:
            file.write(line)
            file.write('\n')

# ############## #
# MAIN EXECUTION #
# ############## #

# check if there is an ini file for this character
iniExists = exists('compile.ini')
if iniExists == True:
    # get the contents of the ini file
    [packageName,newNumbersList,xboxIcons2] = parseConfig()
else:
    # ask for the information
    [packageName,newNumbersList,xboxIcons2] = userInput()

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

# Xbox: use icons2 in the nc packages
if xboxIcons2 == "yes":
    fullSkinList = [oldNumber] + newNumbersList
    for skin in fullSkinList:
        openName = packageName.replace(oldNumber,skin) + '_nc.fb.cfg'
        xboxNC(openName)

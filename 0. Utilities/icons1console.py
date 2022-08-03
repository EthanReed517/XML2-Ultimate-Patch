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
    packageName = config['DEFAULT']['firstPackageName']
    talentsName = config['DEFAULT']['talentsName']
    return [packageName,talentsName]
    
# This function gets user input if an ini does not exist
def userInput():
    print("What is the name of the main combat package? Do not include file extensions (ex: cyclops_0101)")
    packageName = input("Input: ")
    print("What is the name of the talents file? Do not include file extensions (ex: cyclops)")
    talentsName = input("Input: ")
    return [packageName,talentsName]

# This function opens the talents file, changes icons2 to icons1, and saves it to the file
def iconSwitch(name):
    with open(name, mode='r') as file:
        fileContent = file.read()
        contentList = fileContent.split("\n")
    i = 0
    while i < len(contentList):
        if "icons2" in contentList[i]:
            contentList[i] = contentList[i].replace("icons2", "icons1")
        i +=1
    with open(name, mode='w') as file:
        for line in contentList:
            file.write(line)
            file.write('\n')
            
# This function removes the icons2 line from the cfg files
def icons2Remove(name):
    newContentList = []
    with open(name, mode='r') as file:
        for line in file:
            if not "icons2" in line:
                newContentList.append(line)
    while("" in newContentList):
        newContentList.remove("")
    while("\n" in newContentList):
        newContentList.remove("")
    with open(name, mode='w') as file:
        for line in newContentList:
            file.write(line)
    


# ############## #
# MAIN EXECUTION #
# ############## #

iniExists = exists('compile.ini')
if iniExists == True:
    # get the contents of the ini file
    [packageFileNameOG,talentFileName] = parseConfig()
else:
    # ask for the information
    [packageFileNameOG,talentFileName] = userInput()
    
talentFileName = talentFileName + ".engb.json"
packageFileName = packageFileNameOG + ".fb.cfg"
packageFileNameNC = packageFileNameOG + "_nc.fb.cfg"
    
# Open the talents file and replace its contents
iconSwitch(talentFileName)
icons2Remove(packageFileName)
icons2Remove(packageFileNameNC)
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
    talentsName = config['DEFAULT']['talentsName']
    return talentsName
    
# This function gets user input if an ini does not exist
def userInput():
    print("What is the name of the talents file? Do not include file extensions (ex: cyclops)")
    talentsName = input("Input: ")
    return talentsName

# This function opens the talents file and returns its contents
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


# ############## #
# MAIN EXECUTION #
# ############## #

iniExists = exists('compile.ini')
if iniExists == True:
    # get the contents of the ini file
    talentFileName = parseConfig()
else:
    # ask for the information
    talentFileName = userInput()
    
talentFileName = talentFileName + ".engb.json"
    
# Open the talents file and replace its contents
iconSwitch(talentFileName)
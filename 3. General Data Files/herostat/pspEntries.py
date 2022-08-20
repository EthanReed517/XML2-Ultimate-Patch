# ########### #
# DEFINITIONS #
# ########### #
beast = ["astonishing","aoa","60s","70s","weaponx","future","winter","civilian"]
bishop = ["astonishing","60s","weaponx","future","winter"]
colossus = ["70s"]
cyclops = ["weaponx","civilian"]
deadpool = ["astonishing","70s","civilian"]
iceman = ["70s","weaponx","future","winter"]
juggernaut = ["astonishing","70s","weaponx","future","winter"]
magneto = ["astonishing","60s","70s","weaponx","future","winter","civilian"]
nightcrawler = ["70s","weaponx","winter"]
professorx = ["60s","70s","weaponx","future","winter"]
sabretooth = ["astonishing","aoa","60s","70s","weaponx","future","civilian"]
storm = []
wolverine = ["60s"]

# ######### #
# FUNCTIONS #
# ######### #

# This function opens the entry and returns its contents
def pspEntry(name,exclList):
    newContentList = []
    copy = 1
    with open(name, mode='r') as file:
        for line in file:
            copy = 1
            for item in exclList:
                if item in line:
                    copy = 0
            if copy == 1:
                newContentList.append(line)
    nameOut = name[:-3] + "psp"
    with open(nameOut, mode='w') as file:
        for line in newContentList:
            file.write(line)
            
# ############## #
# MAIN EXECUTION #
# ############## #
name = input("What is the name of the herostat entry? ")
if name == "Beast.txt":
    pspEntry(name,beast)
if name == "Bishop.txt":
    pspEntry(name,bishop)
if name == "Colossus.txt":
    pspEntry(name,colossus)
if name == "Cyclops.txt":
    pspEntry(name,cyclops)
if name == "Deadpool.txt":
    pspEntry(name,deadpool)
if name == "Iceman.txt":
    pspEntry(name,iceman)
if name == "Juggernaut.txt":
    pspEntry(name,juggernaut)
if name == "Magneto.txt":
    pspEntry(name,magneto)
if name == "Nightcrawler.txt":
    pspEntry(name,nightcrawler)
if name == "ProfessorX.txt":
    pspEntry(name,professorx)
if name == "Sabretooth.txt":
    pspEntry(name,sabretooth)
if name == "Storm.txt":
    pspEntry(name,storm)
if name == "Wolverine.txt":
    pspEntry(name,wolverine)
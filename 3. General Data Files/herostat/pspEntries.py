# ########### #
# DEFINITIONS #
# ########### #
beast = ["astonishing","aoa","60s","70s","weaponx","future","winter","civilian"]
bishop = ["astonishing","60s","weaponx","future","winter"]
colossus = ["70s"]
cyclops = ["weaponx","civilian"]
darkphoenix = ["astonishing","aoa","60s","70s","weaponx","future","winter","civilian"]
deadpool = ["astonishing","70s","civilian"]
gambit = ["astonishing","60s","70s","weaponx"]
iceman = ["70s","weaponx","future","winter"]
ironman = ["aoa","60s","civilian"]
juggernaut = ["astonishing","70s","weaponx","future","winter"]
magneto = ["astonishing","60s","70s","weaponx","future","winter","civilian"]
nightcrawler = ["70s","weaponx","winter"]
phoenix = ["astonishing","weaponx","civilian","future"]
professorx = ["60s","70s","weaponx","future","winter"]
psylocke = ["astonishing","aoa","60s","70s","future"]
pyro = ["astonishing","aoa","60s","70s","weaponx","future","winter","civilian"]
rogue = ["60s","70s","weaponx","future","winter"]
sabretooth = ["astonishing","aoa","60s","70s","weaponx","future","civilian"]
scarletWitch = ["astonishing","aoa","70s","future"]
storm = []
sunfire = ["astonishing","70s","weaponx","future","winter","civilian"]
toad = ["astonishing","60s","70s","weaponx","winter"]
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
if name == "DarkPhoenix.txt":
    pspEntry(name,darkphoenix)
if name == "Deadpool.txt":
    pspEntry(name,deadpool)
if name == "Gambit.txt":
    pspEntry(name,gambit)
if name == "Iceman.txt":
    pspEntry(name,iceman)
if name == "IronMan.txt":
    pspEntry(name,ironman)
if name == "Juggernaut.txt":
    pspEntry(name,juggernaut)
if name == "Magneto.txt":
    pspEntry(name,magneto)
if name == "Nightcrawler.txt":
    pspEntry(name,nightcrawler)
if name == "Phoenix.txt":
    pspEntry(name,phoenix)
if name == "ProfessorX.txt":
    pspEntry(name,professorx)
if name == "Psylocke.txt":
    pspEntry(name,psylocke)
if name == "Pyro.txt":
    pspEntry(name,pyro)
if name == "Rogue.txt":
    pspEntry(name,rogue)
if name == "Sabretooth.txt":
    pspEntry(name,sabretooth)
if name == "ScarletWitch.txt":
    pspEntry(name,scarletWitch)
if name == "Storm.txt":
    pspEntry(name,storm)
if name == "Sunfire.txt":
    pspEntry(name,sunfire)
if name == "Toad.txt":
    pspEntry(name,toad)
if name == "Wolverine.txt":
    pspEntry(name,wolverine)
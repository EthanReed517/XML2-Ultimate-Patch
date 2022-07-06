# Choose a mode
# mode 1 = pre-defined
# mode 2 = input
mode = 2

# Pre-Defined stuff
# for future standardization, have these values pulled from a cfg file so that only one script needs to be used
combatPackageName = "cyclops_0101"
otherSkins = "0102,0103,0104,0105,0106,0107,0108,0109"
createNCfromCombat = 0
xboxIcons2 = 0

# inputs
if mode != 1:
    combatPackageName = input('Input the name of the first combat package without the extension (ex: cyclops_0101)> ')
    otherSkins = input('Input the other skin numbers, separated by commas (ex: 0102,0103,0104,0105,0106,0107,0108)> ')
    createNCfromCombat = input('Do you want to create the _nc packages from the combat packages? [Y/N]> ')
    if createNCfromCombat.lower() == 'y':
        createNCfromCombat = 1
    else:
        createNCfromCombat = 0
    xboxIcons2 = input('Do you want to use _icons2 for Xbox? [Y/N]> ')
    if xboxIcons2.lower() == 'y':
        xboxIcons2 = 1
    else:
        xboxIcons2 = 0

# generate names from packages


# print variables for debug
print('combatPackageName =',combatPackageName)
print('otherSkins =',otherSkins)
print('createNCfromCombat =',createNCfromCombat)
print('xboxIcons2 =',xboxIcons2)

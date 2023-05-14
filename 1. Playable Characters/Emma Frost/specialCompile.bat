REM Cyclops works a bit differently because his visor boltons are skin-specific
REM rename all cfg files to something else so that fbbuilder won't go for them. 
ren *.cfg *.txt
REM skin 9001
ren emmafrost_hero_9001.fb.txt emmafrost_hero_9001.fb.cfg
ren emmafrost_hero_9001_nc.fb.txt emmafrost_hero_9001_nc.fb.cfg
call fbbuilder.bat
ren emmafrost_hero_9001.fb.cfg emmafrost_hero_9001.fb.txt
ren emmafrost_hero_9001_nc.fb.cfg emmafrost_hero_9001_nc.fb.txt
ren actors\9010.igb 9010_9001.igb
REM skin 9002
ren emmafrost_hero_9002.fb.txt emmafrost_hero_9002.fb.cfg
ren emmafrost_hero_9002_nc.fb.txt emmafrost_hero_9002_nc.fb.cfg
ren actors\9010_9002.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9002.fb.cfg emmafrost_hero_9002.fb.txt
ren emmafrost_hero_9002_nc.fb.cfg emmafrost_hero_9002_nc.fb.txt
ren actors\9010.igb 9010_9002.igb
REM skin 9003
ren emmafrost_hero_9003.fb.txt emmafrost_hero_9003.fb.cfg
ren emmafrost_hero_9003_nc.fb.txt emmafrost_hero_9003_nc.fb.cfg
ren actors\9010_9003.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9003.fb.cfg emmafrost_hero_9003.fb.txt
ren emmafrost_hero_9003_nc.fb.cfg emmafrost_hero_9003_nc.fb.txt
ren actors\9010.igb 9010_9003.igb
REM skin 9004
ren emmafrost_hero_9004.fb.txt emmafrost_hero_9004.fb.cfg
ren emmafrost_hero_9004_nc.fb.txt emmafrost_hero_9004_nc.fb.cfg
ren actors\9010_9004.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9004.fb.cfg emmafrost_hero_9004.fb.txt
ren emmafrost_hero_9004_nc.fb.cfg emmafrost_hero_9004_nc.fb.txt
ren actors\9010.igb 9010_9004.igb
REM skin 9005
ren emmafrost_hero_9005.fb.txt emmafrost_hero_9005.fb.cfg
ren emmafrost_hero_9005_nc.fb.txt emmafrost_hero_9005_nc.fb.cfg
ren actors\9010_9005.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9005.fb.cfg emmafrost_hero_9005.fb.txt
ren emmafrost_hero_9005_nc.fb.cfg emmafrost_hero_9005_nc.fb.txt
ren actors\9010.igb 9010_9005.igb
REM skin 9006
ren emmafrost_hero_9006.fb.txt emmafrost_hero_9006.fb.cfg
ren emmafrost_hero_9006_nc.fb.txt emmafrost_hero_9006_nc.fb.cfg
ren actors\9010_9006.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9006.fb.cfg emmafrost_hero_9006.fb.txt
ren emmafrost_hero_9006_nc.fb.cfg emmafrost_hero_9006_nc.fb.txt
ren actors\9010.igb 9010_9006.igb
REM skin 9007
ren emmafrost_hero_9007.fb.txt emmafrost_hero_9007.fb.cfg
ren emmafrost_hero_9007_nc.fb.txt emmafrost_hero_9007_nc.fb.cfg
ren actors\9010_9007.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9007.fb.cfg emmafrost_hero_9007.fb.txt
ren emmafrost_hero_9007_nc.fb.cfg emmafrost_hero_9007_nc.fb.txt
ren actors\9010.igb 9010_9007.igb
REM skin 9008
ren emmafrost_hero_9008.fb.txt emmafrost_hero_9008.fb.cfg
ren emmafrost_hero_9008_nc.fb.txt emmafrost_hero_9008_nc.fb.cfg
ren actors\9010_9008.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9008.fb.cfg emmafrost_hero_9008.fb.txt
ren emmafrost_hero_9008_nc.fb.cfg emmafrost_hero_9008_nc.fb.txt
ren actors\9010.igb 9010_9008.igb
REM skin 9009
ren emmafrost_hero_9009.fb.txt emmafrost_hero_9009.fb.cfg
ren emmafrost_hero_9009_nc.fb.txt emmafrost_hero_9009_nc.fb.cfg
ren actors\9010_9009.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9009.fb.cfg emmafrost_hero_9009.fb.txt
ren emmafrost_hero_9009_nc.fb.cfg emmafrost_hero_9009_nc.fb.txt
ren actors\9010.igb 9010_9009.igb
REM NPC packages (and restore original visor bolton name)
ren actors\9010_9001.igb 9010.igb
ren emmafrost_hero_xml.fb.txt emmafrost_hero_xml.fb.cfg
ren frost_9001.fb.txt frost_9001.fb.cfg
ren frost_9001_nc.fb.txt frost_9001_nc.fb.cfg
call fbbuilder.bat
ren *.txt *.cfg
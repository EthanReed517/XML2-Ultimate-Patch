# Generated by BehavEd
# ( "This script plays the intro to Zealot's minions" )
# ( "This takes care of persistence" )
setGameFlag("insect", 1, 1 )
lockControls(0.000 )
setallaiactive("FALSE" )
cameraFade(1.000, 1.000 )
waittimed ( 1.000 )
act("ss_zealot_henchman08", "ss_zealot_henchman08" )
act("ss_zealot_henchman09", "ss_zealot_henchman09" )
act("ss_zealot_henchman10", "ss_zealot_henchman10" )
spawn("light_spot04", "mobile_partylight", "minion_light", " 0.000 0.000 0.000 ", " 0.000 0.000 0.000 " )
cameraToLocationAngles(" 2287.000 2345.000 102.000 ", " 2330.000 2264.000 62.000 ", 0.000 )
waittimed ( 1.000 )
hero_alive = alive("_HERO1_" )
if hero_alive == 1
     copyOriginAndAngles("_HERO1_", "herospot13" )
endif
hero_alive = alive("_HERO2_" )
if hero_alive == 1
     copyOriginAndAngles("_HERO2_", "herospot14" )
endif
hero_alive = alive("_HERO3_" )
if hero_alive == 1
     copyOriginAndAngles("_HERO3_", "herospot15" )
endif
hero_alive = alive("_HERO4_" )
if hero_alive == 1
     copyOriginAndAngles("_HERO4_", "herospot16" )
endif
waittimed ( 0.200 )
cameraFade(0.000, 1.000 )
lockControls(0.100 )
setallaiactive("TRUE" )
startConversation("act1/insect/insect3/1_insect3_0008" )


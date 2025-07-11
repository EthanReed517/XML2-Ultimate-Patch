# Generated by BehavEd
# ( "Zealot intro" )
# ( "********************************************************************************************************" )
# ( "The zealot_intro and zealot_again script are called from two different locations in insect3" )
# ( "Each of the above mentioned scripts will call a convesation" )
# ( "If the player has not met Zealot then the insect30 convesation is called" )
# ( "otherwise the insect32 convesation is called" )
# ( "Both of these conversation call the same script, chose_end_script" )
# ( "The chose_end_script will figure out which script should be called next" )
# ( "********************************************************************************************************" )
setallaiactive("FALSE" )
lockControls(0.000 )
cameraFade(1.000, 1.000 )
waittimed ( 1.000 )
hero_alive = alive("_HERO1_" )
if hero_alive == 1
     copyOriginAndAngles("_HERO1_", "herospot01" )
endif
hero_alive = alive("_HERO2_" )
if hero_alive == 1
     copyOriginAndAngles("_HERO2_", "herospot02" )
endif
hero_alive = alive("_HERO3_" )
if hero_alive == 1
     copyOriginAndAngles("_HERO3_", "herospot03" )
endif
hero_alive = alive("_HERO4_" )
if hero_alive == 1
     copyOriginAndAngles("_HERO4_", "herospot04" )
endif
act("trigger_relay_zealot01", "trigger_relay_zealot01" )
# ( "spawn Zealot" )
act("zealot_intro", "zealot_intro" )
cameraToLocationAngles(" 2537.000 650.000 224.000 ", " 2615.000 670.000 165.000 ", 0.000 )
waittimed ( 0.500 )
copyOriginAndAngles("zealot_intro", "zealot_spot" )
waittimed ( 0.100 )
cameraFade(0.000, 1.000 )
lockControls(0.100 )
zealot_first_visit = getGameFlag("tunnels", 28 )
if zealot_first_visit == 0
     setGameFlag("tunnels", 28, 1 )
     # ( "This is the first time the player has seen Zealot" )
     startConversation("act1/insect/insect3/1_insect3_0030" )
else
     startConversation("act1/insect/insect3/1_insect3_0032" )
endif
# ( "This makes sure the trigger is never callled again" )
setGameFlag("insect", 3, 1 )


# Generated by BehavEd
# ( "comment" )
sound (  "PLAY_SOUND", "char/night_m/p4_power", "", "" )
setAIActive("_OWNER_", "FALSE" )
setNoCollide("_OWNER_", "TRUE" )
setNoClip("_OWNER_", "TRUE" )
playanim (  "EA_ZONE2", "_OWNER_", "NONE", "" )
playanim (  "EA_ZONE3", "px", "NONE", "" )
waittimed ( 2.000 )
act("fx_profx", "fx_profx" )
act("fx_nightcrawler", "fx_nightcrawler" )
sound (  "PLAY_SOUND", "char/night_m/p4_power", "", "" )
waittimed ( 0.500 )
remove ( "px", "px" )
remove ( "nc", "nc" )
startConversation("act0/tutorial/tutorial1/1_introlevel_0020b" )

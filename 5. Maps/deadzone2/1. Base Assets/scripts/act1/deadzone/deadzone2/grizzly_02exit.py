# Generated by BehavEd
# ( "grizzly leaves" )
setGameFlag("deadzone", 17, 1 )
setWaypointPath("grizzly2", "dead", 1 )
waittimed ( 1.250 )
killcon = alive("fuel_cell" )
if killcon == 1
     act("jet_effect", "jet_effect" )
     setInvulnerable("fuel_cell", "FALSE" )
     waittimed ( 0.250 )
     act("jet_effect01", "jet_effect01" )
     act("lightent01", "lightent01" )
     setEnable("fuel_cell", "TRUE" )
     waittimed ( 0.250 )
     act("loop_firewall", "loop_firewall" )
     waittimed ( 0.250 )
     cameraFocusToEntity("camera_look03", 300.000, 25.000, 0.000, 1.000 )
endif
waittimed ( 3.000 )
cameraFade(1.000, 0.500 )
waittimed ( 0.500 )
cameraReset( )
remove ( "grizzly2", "grizzly2" )
setBossPartyLightColor(" 0.000 0.000 0.000 " )
waittimed ( 0.250 )
cameraFade(0.000, 0.500 )
lockControls(0.100 )
heroNoTarget("FALSE" )
enemiesNoTarget("FALSE" )


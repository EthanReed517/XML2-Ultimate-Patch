# Generated by BehavEd
# ( "This script no longer shows the blink quest.  It only completes the Talk to Sabretooth quest" )
once_only = getGameFlag("act1_visit", 14 )
if once_only == 0
     setGameFlag("act1_visit", 14, 1 )
     lockControls(0.000 )
     setallaiactive("FALSE" )
     cameraToLocationAngles(" 1965.000 1383.000 -241.000 ", " 1990.000 1299.000 -290.000 ", 0.000 )
     waittimed ( 0.500 )
     cameraFade(0.000, 1.000 )
     waittimed ( 1.000 )
     # ( "This enable the zone link to deadzone1" )
     setEnable("link_deadzone1", "TRUE" )
     setEnable("gate_door_san_a_sa01", "TRUE" )
     faceEntity("sabretooth", "gate_hind" )
     waittimed ( 1.000 )
     playanim (  "EA_USE_BUTTON", "sabretooth", "NONE", "" )
     setEnable("gate_door_san_a_sa01", "TRUE" )
     waittimed ( 0.500 )
     act("gate_door_san_a_sa01", "gate_door_san_a_sa01" )
     waittimed ( 1.000 )
     # ( "Mark door has opened" )
     setGameFlag("sanctuary", 2, 1 )
     lockControls(0.100 )
     remove ( "trigger_deadzone01", "trigger_deadzone01" )
     remove ( "complete_obj", "complete_obj" )
     setallaiactive("TRUE" )
     cameraReset( )
     createPopupDialogXml("act1/sanctuary/viewed_briefing" )
endif


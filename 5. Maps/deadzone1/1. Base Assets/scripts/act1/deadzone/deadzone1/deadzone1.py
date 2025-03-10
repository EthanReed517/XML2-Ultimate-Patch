# Generated by BehavEd
# ( "comment" )
setRecallActive("FALSE" )
deadzone = getGameFlag("deadzone", 2 )
if deadzone == 0
     cameraFade(1.000, 0.000 )
     lockControls(-1.000 )
     enemiesNoTarget("TRUE" )
     heroNoTarget("TRUE" )
     moveHeroesToEnt("outoftheway" )
     setGameFlag("deadzone", 2, 1 )
     waittimed ( 0.125 )
     act("blinkdrag", "blinkdrag" )
     waittimed ( 0.100 )
     act("draggercrit", "draggercrit" )
     act("critposse3", "critposse3" )
     cameraFocusToEntity("intheway", 350.000, 45.000, 290.000, 0.000 )
     cameraFade(0.000, 1.000 )
     waittimed ( 0.650 )
     cameraFocusToEntity("camfollow", 450.000, 35.000, 265.000, 4.500 )
     sound (  "PLAY_SOUND", "zone_shared/special/blink_drag", "", "" )
     waittimed ( 1.000 )
     sound (  "PLAY_SOUND", "zone_shared/special/blink_drag", "", "" )
     waittimed ( 1.000 )
     sound (  "PLAY_SOUND", "zone_shared/special/blink_drag", "", "" )
     waittimed ( 1.000 )
     sound (  "PLAY_SOUND", "zone_shared/special/blink_drag", "", "" )
     waittimed ( 1.000 )
     sound (  "PLAY_SOUND", "zone_shared/special/blink_drag", "", "" )
     waittimed ( 1.000 )
     cameraFade(1.000, 1.000 )
     waittimed ( 1.000 )
     moveHeroesToEnt("intheway" )
     cameraReset( )
     remove ( "dragger", "dragger" )
     remove ( "critter_posse3", "critter_posse3" )
     remove ( "wp_critposse301", "wp_critposse301" )
     remove ( "critter_posse3", "critter_posse3" )
     remove ( "blink_drag", "blink_drag" )
     cameraFade(0.000, 1.000 )
     waittimed ( 1.000 )
     lockControls(0.100 )
     enemiesNoTarget("FALSE" )
     heroNoTarget("FALSE" )
     startCharConversation("act1/deadzone/deadzone1/1_deadzone1_0010", "magneto", "act1/deadzone/deadzone1/1_deadzone1_0011" )
else
     remove ( "critter_posse3", "critter_posse3" )
     remove ( "wp_critposse301", "wp_critposse301" )
     remove ( "outoftheway", "outoftheway" )
     remove ( "intheway", "intheway" )
     remove ( "blinkdrag", "blinkdrag" )
     remove ( "draggercrit", "draggercrit" )
     remove ( "critposse3", "critposse3" )
     deadzone = getGameFlag("deadzone", 3 )
     if deadzone == 1
          remove ( "crit2_2", "crit2_2" )
          remove ( "crit2_1", "crit2_1" )
          remove ( "critdrag2_cam1", "critdrag2_cam1" )
          remove ( "critdrag2_cam2", "critdrag2_cam2" )
          remove ( "blinkdrag2", "blinkdrag2" )
          remove ( "draggercrit2", "draggercrit2" )
     endif
     deadzone = getGameFlag("deadzone", 4 )
     if deadzone == 1
          remove ( "crit3", "crit3" )
          remove ( "critdrag3_cam1", "critdrag3_cam1" )
          remove ( "critdrag3_cam2", "critdrag3_cam2" )
          remove ( "critdrag3_cam3", "critdrag3_cam3" )
          remove ( "critposse1", "critposse1" )
          remove ( "blinkdrag3", "blinkdrag3" )
          remove ( "draggercrit3", "draggercrit3" )
          remove ( "critposse2", "critposse2" )
     endif
endif
deadzone = getGameFlag("deadzone", 1 )
if deadzone == 1
     setRecallActive("TRUE" )
     remove ( "blink_trigger", "blink_trigger" )
     remove ( "blink_spawner", "blink_spawner" )
endif
objective ( "act1_obj_1",  "EOBJCMD_SHOW" )
deadzone = getGameFlag("deadzone", 6 )
if deadzone == 1
     setRecallActive("TRUE" )
     remove ( "blink_clip", "blink_clip" )
     setEnable("blink_portal_trig1", "TRUE" )
     playanim (  "EA_BORED_LOOP_1", "blink", "LOOP", "" )
     setEnable("blink", "TRUE" )
     deadzone = getZoneReset( )
     if deadzone == 1
          act("blinklight1", "blinklight1" )
     endif
endif
deadzone = getGameFlag("deadzone", 7 )
if deadzone == 1
     remove ( "web_break", "web_break" )
     remove ( "trigger_touch07", "trigger_touch07" )
endif
deadzone = getGameFlag("deadzone", 19 )
if deadzone == 1
     waittimed ( 0.200 )
     playanim (  "EA_ZONE4", "blink", "STOP", "" )
     setAIActive("blink", "FALSE" )
endif
deadzone = getObjective("radardish", "COMPLETE" )
if deadzone == 1
     remove ( "forgewarn", "forgewarn" )
     remove ( "missiles1", "missiles1" )
     remove ( "missiles2", "missiles2" )
     remove ( "missiles3", "missiles3" )
endif
# ( "get rid of camera triggers for blink here, and blink herself, once the objective is completed" )
deadzone = getObjective("act1_obj_1", "COMPLETE" )
if deadzone == 1
     remove ( "blink_trigger", "blink_trigger" )
     remove ( "blink_spawner", "blink_spawner" )
     remove ( "crit3", "crit3" )
     remove ( "crit2_2", "crit2_2" )
     remove ( "crit2_1", "crit2_1" )
     remove ( "blink_clip", "blink_clip" )
     setEnable("blink_portal_trig1", "TRUE" )
     setEnable("blink_portal_trig02", "TRUE" )
     act("blink_portal1", "blink_portal1" )
     act("blink_portal2", "blink_portal2" )
     act("blinklight1", "blinklight1" )
     act("blinklight2", "blinklight2" )
endif
# ( "get rid of forge convo once its been played ONCE" )
deadzone = getGameFlag("deadzone", 15 )
if deadzone == 1
     remove ( "forgewarn", "forgewarn" )
endif


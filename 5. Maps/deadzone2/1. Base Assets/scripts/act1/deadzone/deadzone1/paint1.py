# Generated by BehavEd
# ( "comment" )
sound (  "PLAY_SOUND", "voice/forge/1_deadzone2_007_011", "", "" )
copyOriginAndAngles("paint1", "exp_null1a" )
sound (  "PLAY_SOUND", "zone_shared/special/missle_track", "", "" )
act("paint1", "paint1" )
waittimed ( 2.000 )
sound (  "PLAY_SOUND", "zone_shared/special/missle_land", "", "" )
act("paint1", "paint1" )
copyOriginAndAngles("paint02", "exp_null1a" )
act("paint02", "paint02" )
waittimed ( 0.200 )
copyOriginAndAngles("paint_harm2", "exp_null1" )
copyOriginAndAngles("paint_harm", "exp_null1" )
waittimed ( 1.000 )
copyOriginAndAngles("paint_harm", "harm_null" )
copyOriginAndAngles("paint_harm2", "harm_null" )


# Generated by BehavEd
# ( "comment" )
lockControls(-1.000 )
cameraFocusToEntity("camera_inlet", 300.000, 40.000, 90.000, 3.000 )
waittimed ( 3.250 )
heroalive = alive("_HERO1_" )
if heroalive == 1
     copyOriginAndAngles("_hero1_", "p1spot" )
endif
heroalive = alive("_HERO2_" )
if heroalive == 1
     copyOriginAndAngles("_hero2_", "p2spot" )
endif
heroalive = alive("_HERO3_" )
if heroalive == 1
     copyOriginAndAngles("_hero3_", "p3spot" )
endif
heroalive = alive("_HERO4_" )
if heroalive == 1
     copyOriginAndAngles("_hero4_", "p4spot" )
endif
cameraReset( )
lockControls(0.100 )


# Generated by BehavEd
# ( "If Objective 6 is active and initial meeting with X-Man Leader" )
# ( "1_SANCTUARY1_130_030" )
made_it_to_genosha = getObjective("act1_obj_5", "HIDDEN" )
if made_it_to_genosha == 0
     one_ever_var = getGameFlag("once_ever", 32 )
     if one_ever_var == 0
          setGameFlag("one_ever", 32, 1 )
          allowConversation("TRUE" )
     endif
else
     allowConversation("FALSE" )
endif


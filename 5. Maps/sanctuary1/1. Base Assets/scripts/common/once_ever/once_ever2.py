# Generated by BehavEd
# ( "This start condiction only plays once" )
play_before = getGameFlag("once_ever", 2 )
if play_before == 0
     setGameFlag("once_ever", 2, 1 )
     allowConversation("TRUE" )
else
     allowConversation("FALSE" )
endif


# Generated by Ryan
# Recall use script 
# this entity activates itself initially to play a startup animation, we don't want to recall at that time
activator = getID('_ACTIVATOR_')
me = getID('_OWNER_')
if me != activator
     sound ('PLAY_SOUND','zone_shared/special/blink_use','_OWNER_','')
     waittimed ( 0.1 )
     recallZone()
endif	

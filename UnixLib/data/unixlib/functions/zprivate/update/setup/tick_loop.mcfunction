#Time schedule loop for tick accuracy
execute if score #UnixLib_CommandBlock UnixLib matches 0 store success score #UnixLib_CommandBlock UnixLib run data modify storage unixlib:cmd_block Output set from block 29999983 2 29999983 LastOutput
execute if score #UnixLib_CommandBlock UnixLib matches 1 run function unixlib:zprivate/update/setup/start_schedules

#Wait until the player head is resolved
execute if score #UnixLib_PlayerHead UnixLib matches 0 store success score #UnixLib_PlayerHead UnixLib if data block 29999983 0 29999983 Items[0].tag.SkullOwner.Properties
execute if score #UnixLib_PlayerHead UnixLib matches 1 if score #UnixLib_CommandBlock UnixLib matches 2 run return run function unixlib:zprivate/update/main
schedule function unixlib:zprivate/update/setup/tick_loop 1t
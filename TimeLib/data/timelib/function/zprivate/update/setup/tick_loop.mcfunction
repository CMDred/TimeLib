# Time schedule loop for tick accuracy
execute if score #TimeLib.CommandBlock TimeLib matches 0 store success score #TimeLib.CommandBlock TimeLib run data modify storage timelib:zprivate cmd_block.Output set from block 29999983 2 29999983 LastOutput
execute if score #TimeLib.CommandBlock TimeLib matches 1 run function timelib:zprivate/update/setup/start_schedules

# Wait until the player head is resolved
execute if score #TimeLib.PlayerHead TimeLib matches 0 store success score #TimeLib.PlayerHead TimeLib if data block 29999983 0 29999983 Items[0].components."minecraft:profile".properties
execute if score #TimeLib.PlayerHead TimeLib matches 1 if score #TimeLib.CommandBlock TimeLib matches 2 run return run function timelib:zprivate/update/main
schedule function timelib:zprivate/update/setup/tick_loop 1t

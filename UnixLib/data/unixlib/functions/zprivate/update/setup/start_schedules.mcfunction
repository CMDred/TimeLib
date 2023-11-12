#Start schedules for seconds, minutes, hours and days
fill 29999983 1 29999983 29999983 2 29999983 air
scoreboard players set #UnixLib_CommandBlock UnixLib 2
scoreboard players reset #UnixLib UnixLib_Tick
execute if score #UnixLib_GameruleCheck UnixLib matches 0 run gamerule sendCommandFeedback false
scoreboard players reset #UnixLib_GameruleCheck

data modify storage unixlib:cmd_block Time.Hour set string storage unixlib:cmd_block Output 10 12
data modify storage unixlib:cmd_block Time.Minute set string storage unixlib:cmd_block Output 13 15
data modify storage unixlib:cmd_block Time.Second set string storage unixlib:cmd_block Output 16 18
function unixlib:zprivate/update/setup/start_schedules_2 with storage unixlib:cmd_block Time
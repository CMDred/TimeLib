# Start schedules for seconds, minutes, hours and days
fill 29999983 1 29999983 29999983 2 29999983 minecraft:air
scoreboard players set #TimeLib.CommandBlock TimeLib 2
scoreboard players reset #TimeLib TimeLib.Tick
execute if score #TimeLib.GameruleCheck TimeLib matches 0 run gamerule sendCommandFeedback false
scoreboard players reset #TimeLib.GameruleCheck

data modify storage timelib:zprivate cmd_block.Time.Hour set string storage timelib:zprivate cmd_block.Output 10 12
data modify storage timelib:zprivate cmd_block.Time.Minute set string storage timelib:zprivate cmd_block.Output 13 15
data modify storage timelib:zprivate cmd_block.Time.Second set string storage timelib:zprivate cmd_block.Output 16 18
function timelib:zprivate/update/setup/start_schedules_2 with storage timelib:zprivate cmd_block.Time

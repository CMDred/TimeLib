#Check if daylight savings time has to be applied
data modify storage timelib:zprivate cmd_block.Time.Hour set string block 29999983 1 29999983 LastOutput 10 12
function timelib:zprivate/daylight_savings_time_checks/set_cmd_block_time with storage timelib:zprivate cmd_block.Time
setblock 29999983 1 29999983 minecraft:air

execute if score #TimeLib TimeLib.Hour = #TimeLib.CommandBlock TimeLib.Hour run return 0

#Apply Daylight Savings Time (UnixTime = UnixTimePrev - HourPrev*3600 + Hour*3600)
scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib TimeLib.Hour
scoreboard players operation #TimeLib.Calc TimeLib *= #c3600 Constant
scoreboard players operation #TimeLib TimeLib.UnixTime -= #TimeLib.Calc TimeLib

scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib.CommandBlock TimeLib.Hour
scoreboard players operation #TimeLib.Calc TimeLib *= #c3600 Constant
scoreboard players operation #TimeLib TimeLib.UnixTime += #TimeLib.Calc TimeLib

#Increment or decrement the day, just in case daylight savings time COULD do that
scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib TimeLib.Hour
scoreboard players operation #TimeLib.Calc TimeLib -= #TimeLib.CommandBlock TimeLib.Hour
execute if score #TimeLib.Calc TimeLib matches 12.. run function timelib:zprivate/timer_1d
execute if score #TimeLib.Calc TimeLib matches ..-12 run scoreboard players remove #TimeLib TimeLib.Day 1

#Adjust "timer_1d" schedule
scoreboard players set #TimeLib.NextDayStart TimeLib.Second 1727998
scoreboard players operation #TimeLib.CommandBlock TimeLib.Hour *= #c72000 Constant
execute store result storage timelib:zprivate calc.Result.NextDayStart int 1 run scoreboard players operation #TimeLib.NextDayStart TimeLib.Second -= #TimeLib.CommandBlock TimeLib.Hour
function timelib:zprivate/daylight_savings_time_checks/start_schedules with storage timelib:zprivate calc.Result
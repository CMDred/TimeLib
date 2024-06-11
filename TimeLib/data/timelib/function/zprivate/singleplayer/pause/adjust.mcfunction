#Add the paused ticks to the datetime
scoreboard players operation #TimeLib TimeLib.Tick += @a[limit=1] TimeLib.TotalWorldTime
scoreboard players reset * TimeLib.TotalWorldTime

scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib TimeLib.Tick
scoreboard players operation #TimeLib.Calc TimeLib /= #c20 Constant
scoreboard players operation #TimeLib TimeLib.Second += #TimeLib.Calc TimeLib
scoreboard players operation #TimeLib TimeLib.UnixTime += #TimeLib.Calc TimeLib
scoreboard players operation #TimeLib TimeLib.Tick %= #c20 Constant

scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib TimeLib.Second
scoreboard players operation #TimeLib.Calc TimeLib /= #c60 Constant
scoreboard players operation #TimeLib TimeLib.Minute += #TimeLib.Calc TimeLib
scoreboard players operation #TimeLib TimeLib.Second %= #c60 Constant

scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib TimeLib.Minute
scoreboard players operation #TimeLib.Calc TimeLib /= #c60 Constant
scoreboard players operation #TimeLib TimeLib.Hour += #TimeLib.Calc TimeLib
scoreboard players operation #TimeLib TimeLib.Minute %= #c60 Constant

scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib TimeLib.Hour
scoreboard players operation #TimeLib.Calc TimeLib /= #c24 Constant
scoreboard players operation #TimeLib TimeLib.Day += #TimeLib.Calc TimeLib
scoreboard players operation #TimeLib TimeLib.WeekDay += #TimeLib.Calc TimeLib
scoreboard players operation #TimeLib TimeLib.WeekDay %= #c7 Constant
execute if score #TimeLib TimeLib.WeekDay matches 0 run scoreboard players set #TimeLib TimeLib.WeekDay 7
scoreboard players operation #TimeLib TimeLib.Hour %= #c24 Constant

function timelib:zprivate/singleplayer/pause/start_schedules

execute if score #TimeLib TimeLib.Day matches ..28 run return 0

execute if score #TimeLib TimeLib.Month matches 1 if score #TimeLib TimeLib.Day matches 32 run return run function timelib:zprivate/advance_month
execute if score #TimeLib TimeLib.Month matches 3 if score #TimeLib TimeLib.Day matches 32 run return run function timelib:zprivate/advance_month
execute if score #TimeLib TimeLib.Month matches 4 if score #TimeLib TimeLib.Day matches 31 run return run function timelib:zprivate/advance_month
execute if score #TimeLib TimeLib.Month matches 5 if score #TimeLib TimeLib.Day matches 32 run return run function timelib:zprivate/advance_month
execute if score #TimeLib TimeLib.Month matches 6 if score #TimeLib TimeLib.Day matches 31 run return run function timelib:zprivate/advance_month
execute if score #TimeLib TimeLib.Month matches 7 if score #TimeLib TimeLib.Day matches 32 run return run function timelib:zprivate/advance_month
execute if score #TimeLib TimeLib.Month matches 8 if score #TimeLib TimeLib.Day matches 32 run return run function timelib:zprivate/advance_month
execute if score #TimeLib TimeLib.Month matches 9 if score #TimeLib TimeLib.Day matches 31 run return run function timelib:zprivate/advance_month
execute if score #TimeLib TimeLib.Month matches 10 if score #TimeLib TimeLib.Day matches 32 run return run function timelib:zprivate/advance_month
execute if score #TimeLib TimeLib.Month matches 11 if score #TimeLib TimeLib.Day matches 31 run return run function timelib:zprivate/advance_month
execute if score #TimeLib TimeLib.Month matches 12 if score #TimeLib TimeLib.Day matches 32 run return run function timelib:zprivate/advance_year

#February
execute unless score #TimeLib TimeLib.Month matches 2 run return 0
scoreboard players operation #TimeLib.Check TimeLib = #TimeLib TimeLib.Year
scoreboard players operation #TimeLib.Check TimeLib %= #c4 Constant
execute if score #TimeLib.Check TimeLib matches 0 run return run function timelib:zprivate/advance_month
execute if score #TimeLib TimeLib.Day matches 29 run return 0
scoreboard players set #TimeLib TimeLib.Day 1
scoreboard players set #TimeLib TimeLib.Month 3
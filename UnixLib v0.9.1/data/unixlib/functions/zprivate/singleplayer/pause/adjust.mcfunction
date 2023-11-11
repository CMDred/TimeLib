#Add the paused ticks to the datetime
scoreboard players operation #UnixLib UnixLib_Tick += @a[limit=1] UnixLib_TotalWorldTime
scoreboard players reset * UnixLib_TotalWorldTime

scoreboard players operation #UnixLib_Calc UnixLib = #UnixLib UnixLib_Tick
scoreboard players operation #UnixLib_Calc UnixLib /= #c20 Constant
scoreboard players operation #UnixLib UnixLib_Second += #UnixLib_Calc UnixLib
scoreboard players operation #UnixLib UnixLib_Tick %= #c20 Constant

scoreboard players operation #UnixLib_Calc UnixLib = #UnixLib UnixLib_Second
scoreboard players operation #UnixLib_Calc UnixLib /= #c60 Constant
scoreboard players operation #UnixLib UnixLib_Minute += #UnixLib_Calc UnixLib
scoreboard players operation #UnixLib UnixLib_UnixTime += #UnixLib_Calc UnixLib
scoreboard players operation #UnixLib UnixLib_Second %= #c60 Constant

scoreboard players operation #UnixLib_Calc UnixLib = #UnixLib UnixLib_Minute
scoreboard players operation #UnixLib_Calc UnixLib /= #c60 Constant
scoreboard players operation #UnixLib UnixLib_Hour += #UnixLib_Calc UnixLib
scoreboard players operation #UnixLib UnixLib_Minute %= #c60 Constant

scoreboard players operation #UnixLib_Calc UnixLib = #UnixLib UnixLib_Hour
scoreboard players operation #UnixLib_Calc UnixLib /= #c24 Constant
scoreboard players operation #UnixLib UnixLib_Day += #UnixLib_Calc UnixLib
scoreboard players operation #UnixLib UnixLib_WeekDay += #UnixLib_Calc UnixLib
scoreboard players operation #UnixLib UnixLib_WeekDay %= #c7 Constant
execute if score #UnixLib UnixLib_WeekDay matches 0 run scoreboard players set #UnixLib UnixLib_WeekDay 7
scoreboard players operation #UnixLib UnixLib_Hour %= #c24 Constant

function unixlib:zprivate/singleplayer/pause/start_schedules

execute if score #UnixLib UnixLib_Day matches ..28 run return 0

execute if score #UnixLib UnixLib_Month matches 1 if score #UnixLib UnixLib_Day matches 32 run return run function unixlib:zprivate/advance_month
execute if score #UnixLib UnixLib_Month matches 3 if score #UnixLib UnixLib_Day matches 32 run return run function unixlib:zprivate/advance_month
execute if score #UnixLib UnixLib_Month matches 4 if score #UnixLib UnixLib_Day matches 31 run return run function unixlib:zprivate/advance_month
execute if score #UnixLib UnixLib_Month matches 5 if score #UnixLib UnixLib_Day matches 32 run return run function unixlib:zprivate/advance_month
execute if score #UnixLib UnixLib_Month matches 6 if score #UnixLib UnixLib_Day matches 31 run return run function unixlib:zprivate/advance_month
execute if score #UnixLib UnixLib_Month matches 7 if score #UnixLib UnixLib_Day matches 32 run return run function unixlib:zprivate/advance_month
execute if score #UnixLib UnixLib_Month matches 8 if score #UnixLib UnixLib_Day matches 32 run return run function unixlib:zprivate/advance_month
execute if score #UnixLib UnixLib_Month matches 9 if score #UnixLib UnixLib_Day matches 31 run return run function unixlib:zprivate/advance_month
execute if score #UnixLib UnixLib_Month matches 10 if score #UnixLib UnixLib_Day matches 32 run return run function unixlib:zprivate/advance_month
execute if score #UnixLib UnixLib_Month matches 11 if score #UnixLib UnixLib_Day matches 31 run return run function unixlib:zprivate/advance_month
execute if score #UnixLib UnixLib_Month matches 12 if score #UnixLib UnixLib_Day matches 32 run return run function unixlib:zprivate/advance_year

#February
execute unless score #UnixLib UnixLib_Month matches 2 run return 0
scoreboard players operation #UnixLib_Check UnixLib = #UnixLib UnixLib_Year
scoreboard players operation #UnixLib_Check UnixLib %= #c4 Constant
execute if score #UnixLib_Check UnixLib matches 0 run return run function unixlib:zprivate/advance_month
execute if score #UnixLib UnixLib_Day matches 29 run return 0
scoreboard players set #UnixLib UnixLib_Day 1
scoreboard players set #UnixLib UnixLib_Month 3
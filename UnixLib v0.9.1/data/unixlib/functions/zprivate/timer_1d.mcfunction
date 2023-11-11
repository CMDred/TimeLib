scoreboard players add #UnixLib UnixLib_Day 1
scoreboard players add #UnixLib UnixLib_WeekDay 1
execute if score #UnixLib UnixLib_WeekDay matches 8 run scoreboard players set #UnixLib UnixLib_WeekDay 1
scoreboard players remove #UnixLib UnixLib_Hour 24
schedule function unixlib:zprivate/timer_1d 86400s

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
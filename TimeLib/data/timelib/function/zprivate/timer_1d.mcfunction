scoreboard players add #TimeLib TimeLib.Day 1
scoreboard players add #TimeLib TimeLib.WeekDay 1
execute if score #TimeLib TimeLib.WeekDay matches 8 run scoreboard players set #TimeLib TimeLib.WeekDay 1
scoreboard players remove #TimeLib TimeLib.Hour 24
schedule function timelib:zprivate/timer_1d 86400s

execute if score #TimeLib TimeLib.Day matches ..28 run return run function utility:timelib/zprivate/update/set_day_storage

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

# February
execute unless score #TimeLib TimeLib.Month matches 2 run return 0
scoreboard players operation #TimeLib.Check TimeLib = #TimeLib TimeLib.Year
scoreboard players operation #TimeLib.Check TimeLib %= #c4 Constant
execute if score #TimeLib.Check TimeLib matches 0 run return run function timelib:zprivate/advance_month
execute if score #TimeLib TimeLib.Day matches 29 run return run function utility:timelib/zprivate/update/set_day_storage
scoreboard players set #TimeLib TimeLib.Day 1
scoreboard players set #TimeLib TimeLib.Month 3
function utility:timelib/zprivate/update/set_date_storage

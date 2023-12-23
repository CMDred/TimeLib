#Calculate macros for schedules
$scoreboard players set #TimeLib.CommandBlock TimeLib.Second $(Second)
$scoreboard players set #TimeLib.CommandBlock TimeLib.Minute $(Minute)
$scoreboard players set #TimeLib.CommandBlock TimeLib.Hour $(Hour)

scoreboard players operation #TimeLib.Settings.TimeZoneOffset TimeLib /= #c3600 Constant
scoreboard players operation #TimeLib.CommandBlock TimeLib.Hour += #TimeLib.Settings.TimeZoneOffset TimeLib
scoreboard players operation #TimeLib.CommandBlock TimeLib.Hour %= #c24 Constant
scoreboard players operation #TimeLib.Settings.TimeZoneOffset TimeLib *= #c3600 Constant

scoreboard players set #TimeLib.NextMinuteStart TimeLib.Second 1199
scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib.CommandBlock TimeLib.Second
scoreboard players operation #TimeLib.Calc TimeLib *= #c20 Constant
execute store result storage timelib:zprivate calc.Result.NextMinuteStart short 1 run scoreboard players operation #TimeLib.NextMinuteStart TimeLib.Second -= #TimeLib.Calc TimeLib

scoreboard players set #TimeLib.NextHourStart TimeLib.Second 70800
scoreboard players operation #TimeLib.NextHourStart TimeLib.Second += #TimeLib.NextMinuteStart TimeLib.Second
scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib.CommandBlock TimeLib.Minute
scoreboard players operation #TimeLib.Calc TimeLib *= #c1200 Constant
execute store result storage timelib:zprivate calc.Result.NextHourStart int 1 run scoreboard players operation #TimeLib.NextHourStart TimeLib.Second -= #TimeLib.Calc TimeLib

scoreboard players set #TimeLib.NextDayStart TimeLib.Second 1656000
scoreboard players operation #TimeLib.NextDayStart TimeLib.Second += #TimeLib.NextHourStart TimeLib.Second
scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib.CommandBlock TimeLib.Hour
scoreboard players operation #TimeLib.Calc TimeLib *= #c72000 Constant
execute store result storage timelib:zprivate calc.Result.NextDayStart int 1 run scoreboard players operation #TimeLib.NextDayStart TimeLib.Second -= #TimeLib.Calc TimeLib

function timelib:zprivate/update/setup/start_schedules_3 with storage timelib:zprivate calc.Result
# Called by "start_checks". "start_schedules_2" does the same, but calling this function would be an extra call
$scoreboard players set #TimeLib.CommandBlock TimeLib.Second $(Second)
$scoreboard players set #TimeLib.CommandBlock TimeLib.Minute $(Minute)
$scoreboard players set #TimeLib.CommandBlock TimeLib.Hour $(Hour)

scoreboard players operation #TimeLib.Settings.TimeZoneOffset TimeLib /= #c3600 Constant
scoreboard players operation #TimeLib.CommandBlock TimeLib.Hour += #TimeLib.Settings.TimeZoneOffset TimeLib
scoreboard players operation #TimeLib.CommandBlock TimeLib.Hour %= #c24 Constant
scoreboard players operation #TimeLib.Settings.TimeZoneOffset TimeLib *= #c3600 Constant

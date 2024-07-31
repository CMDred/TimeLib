# Called by "check". This is an extra function because it only has to compare the hour, not the others.
$scoreboard players set #TimeLib.CommandBlock TimeLib.Hour $(Hour)
scoreboard players operation #TimeLib.Settings.TimeZoneOffset TimeLib /= #c3600 Constant
scoreboard players operation #TimeLib.CommandBlock TimeLib.Hour += #TimeLib.Settings.TimeZoneOffset TimeLib
scoreboard players operation #TimeLib.CommandBlock TimeLib.Hour %= #c24 Constant
scoreboard players operation #TimeLib.Settings.TimeZoneOffset TimeLib *= #c3600 Constant

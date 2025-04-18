# Set the daytime
$scoreboard players set #TimeLib TimeLib.Hour $(Hour)
scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib.Settings.TimeZoneOffset TimeLib
scoreboard players operation #TimeLib.Calc TimeLib /= #TimeLib.3600 TimeLib
scoreboard players operation #TimeLib TimeLib.Hour += #TimeLib.Calc TimeLib
scoreboard players operation #TimeLib TimeLib.Hour %= #TimeLib.24 TimeLib

# Convert the hours to seconds
scoreboard players operation #TimeLib.DaytimeInSeconds.Hours TimeLib = #TimeLib TimeLib.Hour
scoreboard players operation #TimeLib.DaytimeInSeconds.Hours TimeLib *= #TimeLib.3600 TimeLib

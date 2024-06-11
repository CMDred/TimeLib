#Settings
execute store result storage timelib:temporary Data.CommandBlockOffset int 0.0002778 run scoreboard players get #TimeLib.Settings.CommandBlockOffset TimeLib
execute store result storage timelib:temporary Data.TimeZoneOffset int 0.0002778 run scoreboard players get #TimeLib.Settings.TimeZoneOffset TimeLib
function timelib:zprivate/settings/tellraw with storage timelib:temporary Data
data remove storage timelib:temporary Data
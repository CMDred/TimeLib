#Settings
execute store result storage timelib:temporary Data.CommandBlockOffset int 1 run scoreboard players get #TimeLib TimeLib.CommandBlockOffset
execute store result storage timelib:temporary Data.TimeZoneOffset int 1 run scoreboard players get #TimeLib TimeLib.TimeZoneOffset
function timelib:zprivate/settings/tellraw with storage timelib:temporary Data
data remove storage timelib:temporary Data
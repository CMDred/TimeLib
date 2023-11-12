#Settings
execute store result storage unixlib:temporary Data.CommandBlockOffset int 1 run scoreboard players get #UnixLib UnixLib_CommandBlockOffset
execute store result storage unixlib:temporary Data.TimeZoneOffset int 1 run scoreboard players get #UnixLib UnixLib_TimeZoneOffset
function unixlib:zprivate/settings/tellraw with storage unixlib:temporary Data
data remove storage unixlib:temporary Data
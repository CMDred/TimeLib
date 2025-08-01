# Version error checking
execute if score #TimeLib.VersionError load.status matches 1 run return run function timelib:zprivate/version_error

# Check if TimeLib is installed
execute unless score #TimeLib load.status matches 1.. run return run function timelib:zprivate/not_installed_error

# Settings
playsound minecraft:ui.loom.select_pattern master @s

execute store result storage timelib:temporary Data.CommandBlockOffset int 0.00027777778 run scoreboard players get #TimeLib.Settings.CommandBlockOffset TimeLib
execute store result storage timelib:temporary Data.TimeZoneOffset int 0.00027777778 run scoreboard players get #TimeLib.Settings.TimeZoneOffset TimeLib

function timelib:zprivate/settings/tellraw with storage timelib:temporary Data
data remove storage timelib:temporary Data

# Set the Command Block Offset & update the unix timestamp
scoreboard players operation #TimeLib.LatestUnixTimestamp TimeLib -= #TimeLib.Settings.CommandBlockOffset TimeLib
scoreboard players operation #TimeLib.LatestUnixTimestamp TimeLib -= #TimeLib.Settings.TimeZoneOffset TimeLib

scoreboard players add #TimeLib.LatestUnixTimestamp.Daytime TimeLib 3600
scoreboard players operation #TimeLib.LatestUnixTimestamp TimeLib += #TimeLib.LatestUnixTimestamp.Daytime TimeLib

$scoreboard players set #TimeLib.Settings.CommandBlockOffset TimeLib $(Hours)
scoreboard players operation #TimeLib.Settings.CommandBlockOffset TimeLib *= #TimeLib.3600 TimeLib
function timelib:zprivate/update_time/get_unix_timestamp/update

function timelib:zprivate/settings/select

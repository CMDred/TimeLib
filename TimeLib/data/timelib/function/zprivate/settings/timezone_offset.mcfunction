# Set the Timezone Offset & update the unix timestamp
# (Important): The timezone offset is already added to the "base" unix timestamp which is responsible for the date, so all I have to do is update the unix timestamp after setting the TimeZoneOffset and manually set the value for 'Hour'.
$scoreboard players set #TimeLib.Temp TimeLib $(Hours)

    # Update the 'Hour' score
    scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib.Settings.TimeZoneOffset TimeLib
    scoreboard players operation #TimeLib.Calc TimeLib /= #TimeLib.3600 TimeLib
    scoreboard players operation #TimeLib TimeLib.Hour -= #TimeLib.Calc TimeLib

    scoreboard players operation #TimeLib TimeLib.Hour += #TimeLib.Temp TimeLib
    scoreboard players operation #TimeLib TimeLib.Hour %= #TimeLib.24 TimeLib

    scoreboard players operation #TimeLib.DaytimeInSeconds.Hours TimeLib = #TimeLib TimeLib.Hour
    scoreboard players operation #TimeLib.DaytimeInSeconds.Hours TimeLib *= #TimeLib.3600 TimeLib

scoreboard players operation #TimeLib.LatestUnixTimestamp TimeLib -= #TimeLib.Settings.CommandBlockOffset TimeLib
scoreboard players operation #TimeLib.LatestUnixTimestamp TimeLib -= #TimeLib.Settings.TimeZoneOffset TimeLib

scoreboard players add #TimeLib.LatestUnixTimestamp.Daytime TimeLib 3600
scoreboard players operation #TimeLib.LatestUnixTimestamp TimeLib += #TimeLib.LatestUnixTimestamp.Daytime TimeLib

scoreboard players operation #TimeLib.Settings.TimeZoneOffset TimeLib = #TimeLib.Temp TimeLib
scoreboard players operation #TimeLib.Settings.TimeZoneOffset TimeLib *= #TimeLib.3600 TimeLib
function timelib:zprivate/update_time/get_unix_timestamp/update

scoreboard players reset #TimeLib.Temp

function timelib:zprivate/settings/select

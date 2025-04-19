# Update the Timezone Offset & the unix timestamp
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

    # Update the 'Hour' storage
    execute if score #TimeLib TimeLib.Hour matches 10.. store result storage timelib:daytime Hour byte 1 run scoreboard players get #TimeLib TimeLib.Hour
    execute if score #TimeLib TimeLib.Hour matches 10.. run data modify storage timelib:daytime Hour set string storage timelib:daytime Hour 0 2
    execute if score #TimeLib TimeLib.Hour matches 9 run data modify storage timelib:daytime Hour set value "09"
    execute if score #TimeLib TimeLib.Hour matches 8 run data modify storage timelib:daytime Hour set value "08"
    execute if score #TimeLib TimeLib.Hour matches 7 run data modify storage timelib:daytime Hour set value "07"
    execute if score #TimeLib TimeLib.Hour matches 6 run data modify storage timelib:daytime Hour set value "06"
    execute if score #TimeLib TimeLib.Hour matches 5 run data modify storage timelib:daytime Hour set value "05"
    execute if score #TimeLib TimeLib.Hour matches 4 run data modify storage timelib:daytime Hour set value "04"
    execute if score #TimeLib TimeLib.Hour matches 3 run data modify storage timelib:daytime Hour set value "03"
    execute if score #TimeLib TimeLib.Hour matches 2 run data modify storage timelib:daytime Hour set value "02"
    execute if score #TimeLib TimeLib.Hour matches 1 run data modify storage timelib:daytime Hour set value "01"
    execute if score #TimeLib TimeLib.Hour matches 0 run data modify storage timelib:daytime Hour set value "00"

    # Update the unix timestamp
    scoreboard players operation #TimeLib.LatestUnixTimestamp TimeLib -= #TimeLib.Settings.CommandBlockOffset TimeLib
    scoreboard players operation #TimeLib.LatestUnixTimestamp TimeLib -= #TimeLib.Settings.TimeZoneOffset TimeLib

    scoreboard players add #TimeLib.LatestUnixTimestamp.Daytime TimeLib 3600
    scoreboard players operation #TimeLib.LatestUnixTimestamp TimeLib += #TimeLib.LatestUnixTimestamp.Daytime TimeLib

    # Set the Timezone Offset
    scoreboard players operation #TimeLib.Temp TimeLib *= #TimeLib.3600 TimeLib
    scoreboard players operation #TimeLib.Settings.TimeZoneOffset TimeLib = #TimeLib.Temp TimeLib
    scoreboard players reset #TimeLib.Temp

function timelib:zprivate/update_time/get_unix_timestamp/update
function timelib:zprivate/settings/select

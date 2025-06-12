# Update the date & time
    # Get the daytime (From the command block's output)
    # (Important): The functions for hours, minutes and seconds are separated to avoid having to parse three commands every seconds because of the macros.
    execute store success score #TimeLib.HourChanged TimeLib run data modify storage timelib:zprivate CommandBlock.Time.Hour set string storage timelib:zprivate CommandBlock.Output 1 3
    execute store success score #TimeLib.MinuteChanged TimeLib run data modify storage timelib:zprivate CommandBlock.Time.Minute set string storage timelib:zprivate CommandBlock.Output 4 6
    execute store success score #TimeLib.SecondChanged TimeLib run data modify storage timelib:zprivate CommandBlock.Time.Second set string storage timelib:zprivate CommandBlock.Output 7 9
    execute if score #TimeLib.HourChanged TimeLib matches 1 run function timelib:zprivate/update_time/get_daytime/hour with storage timelib:zprivate CommandBlock.Time
    execute if score #TimeLib.MinuteChanged TimeLib matches 1 run function timelib:zprivate/update_time/get_daytime/minute with storage timelib:zprivate CommandBlock.Time
    execute if score #TimeLib.SecondChanged TimeLib matches 1 run function timelib:zprivate/update_time/get_daytime/second with storage timelib:zprivate CommandBlock.Time

    # If the command block's daytime is behind the unix timestamp's daytime by at least 1 hour (1 hour because of daylight savings time), increment the date
    # (Important): 1 hour (3600 seconds) is already removed from the unix timestamp's daytime in 'get_unix_timestamp'.
    scoreboard players operation #TimeLib.CommandBlock.Daytime TimeLib = #TimeLib.DaytimeInSeconds.Hours TimeLib
    scoreboard players operation #TimeLib.CommandBlock.Daytime TimeLib += #TimeLib.DaytimeInSeconds.Minutes TimeLib
    scoreboard players operation #TimeLib.CommandBlock.Daytime TimeLib += #TimeLib TimeLib.Second

    execute if score #TimeLib.CommandBlock.Daytime TimeLib < #TimeLib.LatestUnixTimestamp.Daytime TimeLib run function timelib:zprivate/update_time/get_unix_timestamp/adjust

    # Add the command block's daytime to the unix timestamp (timestamp for the start of the day)
    execute store result score #TimeLib.CurrentDayUnixTime TimeLib run scoreboard players operation #TimeLib TimeLib.UnixTime = #TimeLib.LatestUnixTimestamp TimeLib
    scoreboard players operation #TimeLib TimeLib.UnixTime += #TimeLib.CommandBlock.Daytime TimeLib

    # Remove the CommandBlockOffset & TimeZoneOffset from the unix timestamp
    scoreboard players operation #TimeLib TimeLib.UnixTime -= #TimeLib.Settings.CommandBlockOffset TimeLib
    execute store result score #TimeLib.PassedSeconds TimeLib run scoreboard players operation #TimeLib TimeLib.UnixTime -= #TimeLib.Settings.TimeZoneOffset TimeLib

# Get the TPS
# (Important): Divide the ticks since the last daytime change by the unix time difference.
# (Important): The number of ticks since the last daytime change is also adjusted after unpausing the game to ensure a more appropriate result. If I didn't do that and didn't divide by the unix time difference, there would be 2 ticks with the wrong TPS rather than 1.
# (Important): One problem is that the time until the next "update_time" call will be affected by the pausing, and I'm not sure there's a good way to fix this without making assumptions.
scoreboard players operation #TimeLib.PassedSeconds TimeLib -= #TimeLib.Previous TimeLib.UnixTime

execute store result score #TimeLib TimeLib.Tickrate run time query gametime
scoreboard players operation #TimeLib TimeLib.Tickrate -= #TimeLib.PreviousGametime TimeLib
scoreboard players operation #TimeLib TimeLib.Tickrate /= #TimeLib.PassedSeconds TimeLib

execute store result score #TimeLib.PreviousGametime TimeLib run time query gametime
scoreboard players operation #TimeLib.Previous TimeLib.UnixTime = #TimeLib TimeLib.UnixTime

# Run the '#timelib:daytime_changed' event
# (Important): The number of passed seconds can be read in '#TimeLib.PassedSeconds TimeLib'.
function #timelib:daytime_changed
scoreboard players reset #TimeLib.PassedSeconds

# Update the date storages, get the number of days that have passed and run the '#timelib:date_changed' event if the date changed
# (Important): It changed if the previous tick's "Unix Timestamp without daytime" is different from the current.
execute unless score #TimeLib.CurrentDayUnixTime TimeLib = #TimeLib.PreviousDayUnixTime TimeLib run function timelib:zprivate/update_time/set_date_storage
scoreboard players operation #TimeLib.PreviousDayUnixTime TimeLib = #TimeLib.LatestUnixTimestamp TimeLib
scoreboard players reset #TimeLib.PassedDays

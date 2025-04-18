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
    # (Important): 1 hour (3600 seconds) is already removed from the unix timestamp's daytime in 'get_unix_timestamp'
    scoreboard players operation #TimeLib.CommandBlock.Daytime TimeLib = #TimeLib.DaytimeInSeconds.Hours TimeLib
    scoreboard players operation #TimeLib.CommandBlock.Daytime TimeLib += #TimeLib.DaytimeInSeconds.Minutes TimeLib
    scoreboard players operation #TimeLib.CommandBlock.Daytime TimeLib += #TimeLib TimeLib.Second

    execute if score #TimeLib.CommandBlock.Daytime TimeLib < #TimeLib.LatestUnixTimestamp.Daytime TimeLib run function timelib:zprivate/update_time/get_unix_timestamp/adjust

    # Add the command block's daytime to the unix timestamp (timestamp for the start of the day)
    execute store result score #TimeLib.Current TimeLib.UnixTime run scoreboard players operation #TimeLib TimeLib.UnixTime = #TimeLib.LatestUnixTimestamp TimeLib
    scoreboard players operation #TimeLib TimeLib.UnixTime += #TimeLib.CommandBlock.Daytime TimeLib

    # Remove the CommandBlockOffset & TimeZoneOffset from the unix timestamp
    scoreboard players operation #TimeLib TimeLib.UnixTime -= #TimeLib.Settings.CommandBlockOffset TimeLib
    scoreboard players operation #TimeLib TimeLib.UnixTime -= #TimeLib.Settings.TimeZoneOffset TimeLib

# Run the '#timelib:daytime_changed' event
function #timelib:daytime_changed

# Update the date storages and run the '#timelib:date_changed' event if the date changed
# (Important): It changed if the previous tick's "Unix Timestamp without daytime" is different from the current.
execute unless score #TimeLib.Current TimeLib.UnixTime = #TimeLib.Previous TimeLib.UnixTime run function timelib:zprivate/update_time/set_date_storage
scoreboard players operation #TimeLib.Previous TimeLib.UnixTime = #TimeLib.LatestUnixTimestamp TimeLib

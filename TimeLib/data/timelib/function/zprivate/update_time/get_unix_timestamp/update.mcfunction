# Update the date & time
# (Important): If the unix timestamp has changed, the time and daytime will need to refresh as well.
    # Adjust the unix timestamp with the CommandBlockOffset & TimeZoneOffset
    # (Important): This is necessary so I can compare the unix timestamp's daytime with the command block's daytime without having to worry about different timezones.
    scoreboard players operation #TimeLib.LatestUnixTimestamp TimeLib += #TimeLib.Settings.CommandBlockOffset TimeLib
    scoreboard players operation #TimeLib.LatestUnixTimestamp TimeLib += #TimeLib.Settings.TimeZoneOffset TimeLib

    # Convert the unix timestamp to date & time
        # Convert to days (in a 4-year cycle consisting of 1461 days)
        scoreboard players operation #TimeLib TimeLib.Day = #TimeLib.LatestUnixTimestamp TimeLib
        execute store result score #TimeLib.Calc TimeLib store result score #TimeLib TimeLib.WeekDay run scoreboard players operation #TimeLib TimeLib.Day /= #TimeLib.86400 TimeLib
        execute store result storage timelib:zprivate Days.Input int 1 run scoreboard players operation #TimeLib TimeLib.Day %= #TimeLib.1461 TimeLib

        # Get the date for that number of days within the 4-year cycle (1970 - 1973)
        function timelib:zprivate/update_time/get_date with storage timelib:zprivate Days
        execute store result score #TimeLib TimeLib.Year run data get storage timelib:zprivate Days.Out[0]
        execute store result score #TimeLib TimeLib.Month run data get storage timelib:zprivate Days.Out[1]
        execute store result score #TimeLib TimeLib.Day run data get storage timelib:zprivate Days.Out[2]

        # Fix the year
        scoreboard players operation #TimeLib.Calc TimeLib /= #TimeLib.1461 TimeLib
        scoreboard players operation #TimeLib.Calc TimeLib *= #TimeLib.4 TimeLib
        scoreboard players operation #TimeLib TimeLib.Year += #TimeLib.Calc TimeLib
        scoreboard players add #TimeLib TimeLib.Year 1970

        # Get weekday
        scoreboard players add #TimeLib TimeLib.WeekDay 4
        scoreboard players operation #TimeLib TimeLib.WeekDay %= #TimeLib.7 TimeLib
        execute if score #TimeLib TimeLib.WeekDay matches 0 run scoreboard players set #TimeLib TimeLib.WeekDay 7

    # Remove the daytime from the unix timestamp (UTC timezone)
    # (Important): The unix time's daytime is stored for later comparison with the command block's daytime.
    scoreboard players operation #TimeLib.LatestUnixTimestamp.Daytime TimeLib = #TimeLib.LatestUnixTimestamp TimeLib
    scoreboard players operation #TimeLib.LatestUnixTimestamp.Daytime TimeLib %= #TimeLib.86400 TimeLib
    scoreboard players operation #TimeLib.LatestUnixTimestamp TimeLib -= #TimeLib.LatestUnixTimestamp.Daytime TimeLib

    # Remove 1 hour from the unix timestamp's daytime
    # (Important): In 'update_time/main' I check if the command block's daytime is behind the unix timestamp's daytime by at least 1 hour. This is in preparation for that.
    scoreboard players remove #TimeLib.LatestUnixTimestamp.Daytime TimeLib 3600

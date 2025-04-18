# Command block's daytime is behind the unix timestamp's daytime, so add a day to the timestamp and get the date
    # Convert to days (in a 4-year cycle consisting of 1461 days) & add 1 day to the unix timestamp
    execute store result score #TimeLib TimeLib.Day run scoreboard players add #TimeLib.LatestUnixTimestamp TimeLib 86400
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

# Remove 86400 from the unix timestamp's daytime
# (Important): It cannot be set to 0 or anything like that, because that wouldn't be reversible (timezone offset).
scoreboard players remove #TimeLib.LatestUnixTimestamp.Daytime TimeLib 86400

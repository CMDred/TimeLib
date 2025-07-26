##########################################################################
##                              HOW TO USE                              ##
##########################################################################
## 1. Set #TimeLib.Input TimeLib.UnixTime as the input unix timestamp.  ##
## 2. Run this function.                                                ##
## 3. The output scores are found in #TimeLib.Output ...                ##
## 4. The output storage is found in timelib:output ...                 ##
##                                                                      ##
## Note: The output is in the UTC timezone to avoid daylight savings.   ##
##########################################################################

# Version error checking
execute if score #TimeLib.VersionError load.status matches 1 run return run function timelib:zprivate/version_error

# Check if TimeLib is installed
execute unless score #TimeLib load.status matches 1.. run return run function timelib:zprivate/not_installed_error

# Convert the unix timestamp to date & time
execute unless score #TimeLib.Input TimeLib.UnixTime matches 0.. run return fail

    # Convert to days (in a 4-year cycle consisting of 1461 days)
    scoreboard players operation #TimeLib.Output TimeLib.Day = #TimeLib.Input TimeLib.UnixTime
    execute store result score #TimeLib.Calc TimeLib store result score #TimeLib.Output TimeLib.WeekDay run scoreboard players operation #TimeLib.Output TimeLib.Day /= #TimeLib.86400 TimeLib
    execute store result storage timelib:zprivate Days.Input int 1 run scoreboard players operation #TimeLib.Output TimeLib.Day %= #TimeLib.1461 TimeLib

    # Get the date for that number of days within the 4-year cycle (1970 - 1973)
    function timelib:zprivate/update_time/get_date with storage timelib:zprivate Days
    execute store result score #TimeLib.Output TimeLib.Year run data get storage timelib:zprivate Days.Out[0]
    execute store result score #TimeLib.Output TimeLib.Month run data get storage timelib:zprivate Days.Out[1]
    execute store result score #TimeLib.Output TimeLib.Day run data get storage timelib:zprivate Days.Out[2]

    # Fix the year
    scoreboard players operation #TimeLib.Calc TimeLib /= #TimeLib.1461 TimeLib
    scoreboard players operation #TimeLib.Calc TimeLib *= #TimeLib.4 TimeLib
    scoreboard players operation #TimeLib.Output TimeLib.Year += #TimeLib.Calc TimeLib
    scoreboard players add #TimeLib.Output TimeLib.Year 1970

    # Get weekday
    scoreboard players add #TimeLib.Output TimeLib.WeekDay 4
    scoreboard players operation #TimeLib.Output TimeLib.WeekDay %= #TimeLib.7 TimeLib
    execute if score #TimeLib.Output TimeLib.WeekDay matches 0 run scoreboard players set #TimeLib.Output TimeLib.WeekDay 7

    # Get daytime
    scoreboard players operation #TimeLib.Output TimeLib.Second = #TimeLib.Input TimeLib.UnixTime
    execute store result score #TimeLib.Output TimeLib.Hour run scoreboard players operation #TimeLib.Output TimeLib.Second %= #TimeLib.86400 TimeLib
    scoreboard players operation #TimeLib.Output TimeLib.Hour /= #TimeLib.3600 TimeLib
    execute store result score #TimeLib.Output TimeLib.Minute run scoreboard players operation #TimeLib.Output TimeLib.Second %= #TimeLib.3600 TimeLib
    scoreboard players operation #TimeLib.Output TimeLib.Minute /= #TimeLib.60 TimeLib
    scoreboard players operation #TimeLib.Output TimeLib.Second %= #TimeLib.60 TimeLib

# Set output storage (Date & Daytime)
execute store result storage timelib:temp Data.Month int 1 run scoreboard players get #TimeLib.Output TimeLib.Month
execute store result storage timelib:temp Data.Day int 1 run scoreboard players get #TimeLib.Output TimeLib.Day
execute store result storage timelib:temp Data.Hour int 1 run scoreboard players get #TimeLib.Output TimeLib.Hour
execute store result storage timelib:temp Data.Minute int 1 run scoreboard players get #TimeLib.Output TimeLib.Minute
execute store result storage timelib:temp Data.Second int 1 run scoreboard players get #TimeLib.Output TimeLib.Second

function timelib:zprivate/unix_timestamp_to_date/set_output_storage with storage timelib:temp Data
data remove storage timelib:temp Data

execute if score #TimeLib.Output TimeLib.Month matches 10.. run data modify storage timelib:output Month.Numeric set string storage timelib:output Month.Numeric 1 3
execute if score #TimeLib.Output TimeLib.Day matches 10.. run data modify storage timelib:output Day set string storage timelib:output Day 1 3
execute if score #TimeLib.Output TimeLib.Hour matches 10.. run data modify storage timelib:output Hour set string storage timelib:output Hour 1 3
execute if score #TimeLib.Output TimeLib.Minute matches 10.. run data modify storage timelib:output Minute set string storage timelib:output Minute 1 3
execute if score #TimeLib.Output TimeLib.Second matches 10.. run data modify storage timelib:output Second set string storage timelib:output Second 1 3

execute store result storage timelib:output Year short 1 run scoreboard players get #TimeLib.Output TimeLib.Year

execute if score #TimeLib.Output TimeLib.WeekDay matches 1 run data modify storage timelib:output WeekDay.Long set value 'Monday'
execute if score #TimeLib.Output TimeLib.WeekDay matches 2 run data modify storage timelib:output WeekDay.Long set value 'Tuesday'
execute if score #TimeLib.Output TimeLib.WeekDay matches 3 run data modify storage timelib:output WeekDay.Long set value 'Wednesday'
execute if score #TimeLib.Output TimeLib.WeekDay matches 4 run data modify storage timelib:output WeekDay.Long set value 'Thursday'
execute if score #TimeLib.Output TimeLib.WeekDay matches 5 run data modify storage timelib:output WeekDay.Long set value 'Friday'
execute if score #TimeLib.Output TimeLib.WeekDay matches 6 run data modify storage timelib:output WeekDay.Long set value 'Saturday'
execute if score #TimeLib.Output TimeLib.WeekDay matches 7 run data modify storage timelib:output WeekDay.Long set value 'Sunday'
data modify storage timelib:output WeekDay.Short set string storage timelib:output WeekDay.Long 0 3

execute if score #TimeLib.Output TimeLib.Month matches 1 run data modify storage timelib:output Month.Long set value 'January'
execute if score #TimeLib.Output TimeLib.Month matches 2 run data modify storage timelib:output Month.Long set value 'February'
execute if score #TimeLib.Output TimeLib.Month matches 3 run data modify storage timelib:output Month.Long set value 'March'
execute if score #TimeLib.Output TimeLib.Month matches 4 run data modify storage timelib:output Month.Long set value 'April'
execute if score #TimeLib.Output TimeLib.Month matches 5 run data modify storage timelib:output Month.Long set value 'May'
execute if score #TimeLib.Output TimeLib.Month matches 6 run data modify storage timelib:output Month.Long set value 'June'
execute if score #TimeLib.Output TimeLib.Month matches 7 run data modify storage timelib:output Month.Long set value 'July'
execute if score #TimeLib.Output TimeLib.Month matches 8 run data modify storage timelib:output Month.Long set value 'August'
execute if score #TimeLib.Output TimeLib.Month matches 9 run data modify storage timelib:output Month.Long set value 'September'
execute if score #TimeLib.Output TimeLib.Month matches 10 run data modify storage timelib:output Month.Long set value 'October'
execute if score #TimeLib.Output TimeLib.Month matches 11 run data modify storage timelib:output Month.Long set value 'November'
execute if score #TimeLib.Output TimeLib.Month matches 12 run data modify storage timelib:output Month.Long set value 'December'
data modify storage timelib:output Month.Short set string storage timelib:output Month.Long 0 3

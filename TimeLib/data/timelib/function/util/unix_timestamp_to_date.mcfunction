##########################################################################
##                              HOW TO USE                              ##
##########################################################################
## 1. Set #TimeLib.Input TimeLib.UnixTime as the input unix timestamp.  ##
## 2. Run this function.                                                ##
## 3. The output scores are found in #TimeLib.Output ...                ##
## 4. The output storage is found in timelib:output ...                 ##
##                                                                      ##
## Note: The unix timestamp is in the UTC timezone.                     ##
##########################################################################

execute unless score #TimeLib.Input TimeLib.UnixTime matches 0.. run return fail

# Convert the unix timestamp to date & time
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

# Set date storage (Output)
execute if score #TimeLib.Output TimeLib.Day matches 1 run data modify storage timelib:output Day set value '01'
execute if score #TimeLib.Output TimeLib.Day matches 2 run data modify storage timelib:output Day set value '02'
execute if score #TimeLib.Output TimeLib.Day matches 3 run data modify storage timelib:output Day set value '03'
execute if score #TimeLib.Output TimeLib.Day matches 4 run data modify storage timelib:output Day set value '04'
execute if score #TimeLib.Output TimeLib.Day matches 5 run data modify storage timelib:output Day set value '05'
execute if score #TimeLib.Output TimeLib.Day matches 6 run data modify storage timelib:output Day set value '06'
execute if score #TimeLib.Output TimeLib.Day matches 7 run data modify storage timelib:output Day set value '07'
execute if score #TimeLib.Output TimeLib.Day matches 8 run data modify storage timelib:output Day set value '08'
execute if score #TimeLib.Output TimeLib.Day matches 9 run data modify storage timelib:output Day set value '09'
execute if score #TimeLib.Output TimeLib.Day matches 10.. store result storage timelib:output Day byte 1 run scoreboard players get #TimeLib.Output TimeLib.Day
execute if score #TimeLib.Output TimeLib.Day matches 10.. run data modify storage timelib:output Day set string storage timelib:output Day 0 -1

execute if score #TimeLib.Output TimeLib.WeekDay matches 1 run data modify storage timelib:output WeekDay set value 'Monday'
execute if score #TimeLib.Output TimeLib.WeekDay matches 2 run data modify storage timelib:output WeekDay set value 'Tuesday'
execute if score #TimeLib.Output TimeLib.WeekDay matches 3 run data modify storage timelib:output WeekDay set value 'Wednesday'
execute if score #TimeLib.Output TimeLib.WeekDay matches 4 run data modify storage timelib:output WeekDay set value 'Thursday'
execute if score #TimeLib.Output TimeLib.WeekDay matches 5 run data modify storage timelib:output WeekDay set value 'Friday'
execute if score #TimeLib.Output TimeLib.WeekDay matches 6 run data modify storage timelib:output WeekDay set value 'Saturday'
execute if score #TimeLib.Output TimeLib.WeekDay matches 7 run data modify storage timelib:output WeekDay set value 'Sunday'
data modify storage timelib:output WeekDayShort set string storage timelib:output WeekDay 0 3

execute if score #TimeLib.Output TimeLib.Month matches 1 run data modify storage timelib:output Month set value 'January'
execute if score #TimeLib.Output TimeLib.Month matches 2 run data modify storage timelib:output Month set value 'February'
execute if score #TimeLib.Output TimeLib.Month matches 3 run data modify storage timelib:output Month set value 'March'
execute if score #TimeLib.Output TimeLib.Month matches 4 run data modify storage timelib:output Month set value 'April'
execute if score #TimeLib.Output TimeLib.Month matches 5 run data modify storage timelib:output Month set value 'May'
execute if score #TimeLib.Output TimeLib.Month matches 6 run data modify storage timelib:output Month set value 'June'
execute if score #TimeLib.Output TimeLib.Month matches 7 run data modify storage timelib:output Month set value 'July'
execute if score #TimeLib.Output TimeLib.Month matches 8 run data modify storage timelib:output Month set value 'August'
execute if score #TimeLib.Output TimeLib.Month matches 9 run data modify storage timelib:output Month set value 'September'
execute if score #TimeLib.Output TimeLib.Month matches 10 run data modify storage timelib:output Month set value 'October'
execute if score #TimeLib.Output TimeLib.Month matches 11 run data modify storage timelib:output Month set value 'November'
execute if score #TimeLib.Output TimeLib.Month matches 12 run data modify storage timelib:output Month set value 'December'
data modify storage timelib:output MonthShort set string storage timelib:output Month 0 3

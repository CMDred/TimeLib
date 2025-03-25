####################################################################
##                     HOW TO USE                                 ##
####################################################################
## 1. Set #TimeLib.Input TimeLib as the input unix timestamp.     ##
## 2. Run this function.                                          ##
## 3. The output scores are found in #TimeLib.Output ...          ##
## 4. The output storage is found in timelib:output ...           ##
##                                                                ##
## Note: It automatically adjusts for the timezone.               ##
####################################################################

# Add timezone offset
scoreboard players operation #TimeLib.Calc TimeLib.UnixTime = #TimeLib.Input TimeLib

# Get days total
scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib.Calc TimeLib.UnixTime
scoreboard players operation #TimeLib.Calc TimeLib /= #c86400 Constant

# Get days in the current 4-year cycle
scoreboard players operation #TimeLib.Output TimeLib.Day = #TimeLib.Calc TimeLib
execute store result storage timelib:zprivate calc.Days short 1 run scoreboard players operation #TimeLib.Output TimeLib.Day %= #c1461 Constant

# Get weekday
scoreboard players operation #TimeLib.Output TimeLib.WeekDay = #TimeLib.Calc TimeLib
scoreboard players add #TimeLib.Output TimeLib.WeekDay 4
scoreboard players operation #TimeLib.Output TimeLib.WeekDay %= #c7 Constant
execute if score #TimeLib.Output TimeLib.WeekDay matches 0 run scoreboard players set #TimeLib.Output TimeLib.WeekDay 7

# Get date within the year
function timelib:zprivate/get_date/main with storage timelib:zprivate calc
execute store result score #TimeLib.Output TimeLib.Day run data get storage timelib:zprivate calc.Date[2]
execute store result score #TimeLib.Output TimeLib.Month run data get storage timelib:zprivate calc.Date[1]
execute store result score #TimeLib.Output TimeLib.Year run data get storage timelib:zprivate calc.Date[0]
execute store result storage timelib:output Year short 1 run scoreboard players add #TimeLib.Output TimeLib.Year 1970

# Get current year
scoreboard players operation #TimeLib.Calc TimeLib /= #c1461 Constant
scoreboard players operation #TimeLib.Calc TimeLib *= #c4 Constant
scoreboard players operation #TimeLib.Output TimeLib.Year += #TimeLib.Calc TimeLib

# Get daytime
scoreboard players operation #TimeLib.Output TimeLib.Second = #TimeLib.Calc TimeLib.UnixTime
scoreboard players operation #TimeLib.Output TimeLib.Second %= #c86400 Constant
scoreboard players operation #TimeLib.Output TimeLib.Hour = #TimeLib.Output TimeLib.Second
scoreboard players operation #TimeLib.Output TimeLib.Hour /= #c3600 Constant
scoreboard players operation #TimeLib.Output TimeLib.Second %= #c3600 Constant
scoreboard players operation #TimeLib.Output TimeLib.Minute = #TimeLib.Output TimeLib.Second
scoreboard players operation #TimeLib.Output TimeLib.Minute /= #c60 Constant
scoreboard players operation #TimeLib.Output TimeLib.Second %= #c60 Constant

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

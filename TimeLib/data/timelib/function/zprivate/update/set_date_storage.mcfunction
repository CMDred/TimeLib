# Set date storage
execute if score #TimeLib TimeLib.Day matches 1 run data modify storage timelib:date Day set value '01'
execute if score #TimeLib TimeLib.Day matches 2 run data modify storage timelib:date Day set value '02'
execute if score #TimeLib TimeLib.Day matches 3 run data modify storage timelib:date Day set value '03'
execute if score #TimeLib TimeLib.Day matches 4 run data modify storage timelib:date Day set value '04'
execute if score #TimeLib TimeLib.Day matches 5 run data modify storage timelib:date Day set value '05'
execute if score #TimeLib TimeLib.Day matches 6 run data modify storage timelib:date Day set value '06'
execute if score #TimeLib TimeLib.Day matches 7 run data modify storage timelib:date Day set value '07'
execute if score #TimeLib TimeLib.Day matches 8 run data modify storage timelib:date Day set value '08'
execute if score #TimeLib TimeLib.Day matches 9 run data modify storage timelib:date Day set value '09'
execute if score #TimeLib TimeLib.Day matches 10.. store result storage timelib:date Day byte 1 run scoreboard players get #TimeLib TimeLib.Day
data modify storage timelib:date Day set string storage timelib:date Day 0 -1

execute if score #TimeLib TimeLib.WeekDay matches 1 run data modify storage timelib:date WeekDay set value 'Monday'
execute if score #TimeLib TimeLib.WeekDay matches 2 run data modify storage timelib:date WeekDay set value 'Tuesday'
execute if score #TimeLib TimeLib.WeekDay matches 3 run data modify storage timelib:date WeekDay set value 'Wednesday'
execute if score #TimeLib TimeLib.WeekDay matches 4 run data modify storage timelib:date WeekDay set value 'Thursday'
execute if score #TimeLib TimeLib.WeekDay matches 5 run data modify storage timelib:date WeekDay set value 'Friday'
execute if score #TimeLib TimeLib.WeekDay matches 6 run data modify storage timelib:date WeekDay set value 'Saturday'
execute if score #TimeLib TimeLib.WeekDay matches 7 run data modify storage timelib:date WeekDay set value 'Sunday'
data modify storage timelib:date WeekDayShort set string storage timelib:date WeekDay 0 3

execute if score #TimeLib TimeLib.Month matches 1 run data modify storage timelib:date Month set value 'January'
execute if score #TimeLib TimeLib.Month matches 2 run data modify storage timelib:date Month set value 'February'
execute if score #TimeLib TimeLib.Month matches 3 run data modify storage timelib:date Month set value 'March'
execute if score #TimeLib TimeLib.Month matches 4 run data modify storage timelib:date Month set value 'April'
execute if score #TimeLib TimeLib.Month matches 5 run data modify storage timelib:date Month set value 'May'
execute if score #TimeLib TimeLib.Month matches 6 run data modify storage timelib:date Month set value 'June'
execute if score #TimeLib TimeLib.Month matches 7 run data modify storage timelib:date Month set value 'July'
execute if score #TimeLib TimeLib.Month matches 8 run data modify storage timelib:date Month set value 'August'
execute if score #TimeLib TimeLib.Month matches 9 run data modify storage timelib:date Month set value 'September'
execute if score #TimeLib TimeLib.Month matches 10 run data modify storage timelib:date Month set value 'October'
execute if score #TimeLib TimeLib.Month matches 11 run data modify storage timelib:date Month set value 'November'
execute if score #TimeLib TimeLib.Month matches 12 run data modify storage timelib:date Month set value 'December'
data modify storage timelib:date MonthShort set string storage timelib:date Month 0 3

execute store result storage timelib:date Year short 1 run scoreboard players get #TimeLib TimeLib.Year

# Run event
function #timelib:time_updated

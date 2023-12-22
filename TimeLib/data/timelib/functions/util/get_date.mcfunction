########################################################
##                     HOW TO USE                     ##
########################################################
## 1. Set #TimeLib.Input TimeLib as the input.        ##
## 2. Run this function.                              ##
## 3. The output is found in #TimeLib.Output ...      ##
##                                                    ##
## Note: It automatically adjusts for the timezone.   ##
########################################################

#Add Timezone Offset
scoreboard players operation #TimeLib.Calc TimeLib.UnixTime = #TimeLib.Input TimeLib
scoreboard players operation #TimeLib.Calc TimeLib.UnixTime += #TimeLib.Settings.CommandBlockOffset TimeLib
scoreboard players operation #TimeLib.Calc TimeLib.UnixTime += #TimeLib.Settings.TimeZoneOffset TimeLib

#Get Days Total
scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib.Calc TimeLib.UnixTime
scoreboard players operation #TimeLib.Calc TimeLib /= #c86400 Constant

#Get Days In The Current 4 Year Cycle
scoreboard players operation #TimeLib.Output TimeLib.Day = #TimeLib.Calc TimeLib
execute store result storage timelib:zprivate calc.Days short 1 run scoreboard players operation #TimeLib.Output TimeLib.Day %= #c1461 Constant

#Get Weekday
scoreboard players operation #TimeLib.Output TimeLib.WeekDay = #TimeLib.Calc TimeLib
scoreboard players add #TimeLib.Output TimeLib.WeekDay 4
scoreboard players operation #TimeLib.Output TimeLib.WeekDay %= #c7 Constant
execute if score #TimeLib.Output TimeLib.WeekDay matches 0 run scoreboard players set #TimeLib.Output TimeLib.WeekDay 7

#Get Date Within The Year
function timelib:zprivate/get_date/main with storage timelib:zprivate calc
execute store result score #TimeLib.Output TimeLib.Day run data get storage timelib:zprivate calc.Date.Day
execute store result score #TimeLib.Output TimeLib.Month run data get storage timelib:zprivate calc.Date.Month
execute store result score #TimeLib.Output TimeLib.Year run data get storage timelib:zprivate calc.Date.Year

#Get Current Year
scoreboard players operation #TimeLib.Calc TimeLib /= #c1461 Constant
scoreboard players operation #TimeLib.Calc TimeLib *= #c4 Constant
scoreboard players operation #TimeLib.Output TimeLib.Year += #TimeLib.Calc TimeLib

#Get Time
scoreboard players operation #TimeLib.Output TimeLib.Second = #TimeLib.Calc TimeLib.UnixTime
scoreboard players operation #TimeLib.Output TimeLib.Second %= #c86400 Constant
scoreboard players operation #TimeLib.Output TimeLib.Hour = #TimeLib.Output TimeLib.Second
scoreboard players operation #TimeLib.Output TimeLib.Hour /= #c3600 Constant
scoreboard players operation #TimeLib.Output TimeLib.Second %= #c3600 Constant
scoreboard players operation #TimeLib.Output TimeLib.Minute = #TimeLib.Output TimeLib.Second
scoreboard players operation #TimeLib.Output TimeLib.Minute /= #c60 Constant
scoreboard players operation #TimeLib.Output TimeLib.Second %= #c60 Constant
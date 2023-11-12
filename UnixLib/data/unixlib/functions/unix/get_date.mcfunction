########################################################
##                     HOW TO USE                     ##
########################################################
## 1. Set #UnixLib_Input UnixLib as the input.        ##
## 2. Run this function.                              ##
## 3. The output is found in #UnixLib_Output ...      ##
##                                                    ##
## Note: It automatically adjusts for the timezone.   ##
########################################################

#Add Timezone Offset
scoreboard players operation #UnixLib_Calc UnixLib_UnixTime = #UnixLib_Input UnixLib
scoreboard players operation #UnixLib_Calc UnixLib_UnixTime += #UnixLib UnixLib_CommandBlockOffset
scoreboard players operation #UnixLib_Calc UnixLib_UnixTime += #UnixLib UnixLib_TimeZoneOffset

#Get Days Total
scoreboard players operation #UnixLib_Calc UnixLib = #UnixLib_Calc UnixLib_UnixTime
scoreboard players operation #UnixLib_Calc UnixLib /= #c86400 Constant

#Get Days In The Current 4 Year Cycle
scoreboard players operation #UnixLib_Output UnixLib_Day = #UnixLib_Calc UnixLib
execute store result storage unixlib:zprivate calc.Days short 1 run scoreboard players operation #UnixLib_Output UnixLib_Day %= #c1461 Constant

#Get Weekday
scoreboard players operation #UnixLib_Output UnixLib_WeekDay = #UnixLib_Calc UnixLib
scoreboard players add #UnixLib_Output UnixLib_WeekDay 4
scoreboard players operation #UnixLib_Output UnixLib_WeekDay %= #c7 Constant
execute if score #UnixLib_Output UnixLib_WeekDay matches 0 run scoreboard players set #UnixLib_Output UnixLib_WeekDay 7

#Get Date Within The Year
function unixlib:zprivate/get_date/main with storage unixlib:zprivate calc
execute store result score #UnixLib_Output UnixLib_Day run data get storage unixlib:zprivate calc.Date.Day
execute store result score #UnixLib_Output UnixLib_Month run data get storage unixlib:zprivate calc.Date.Month
execute store result score #UnixLib_Output UnixLib_Year run data get storage unixlib:zprivate calc.Date.Year

#Get Current Year
scoreboard players operation #UnixLib_Calc UnixLib /= #c1461 Constant
scoreboard players operation #UnixLib_Calc UnixLib *= #c4 Constant
scoreboard players operation #UnixLib_Output UnixLib_Year += #UnixLib_Calc UnixLib

#Get Time
scoreboard players operation #UnixLib_Output UnixLib_Second = #UnixLib_Calc UnixLib_UnixTime
scoreboard players operation #UnixLib_Output UnixLib_Second %= #c86400 Constant
scoreboard players operation #UnixLib_Output UnixLib_Hour = #UnixLib_Output UnixLib_Second
scoreboard players operation #UnixLib_Output UnixLib_Hour /= #c3600 Constant
scoreboard players operation #UnixLib_Output UnixLib_Second %= #c3600 Constant
scoreboard players operation #UnixLib_Output UnixLib_Minute = #UnixLib_Output UnixLib_Second
scoreboard players operation #UnixLib_Output UnixLib_Minute /= #c60 Constant
scoreboard players operation #UnixLib_Output UnixLib_Second %= #c60 Constant
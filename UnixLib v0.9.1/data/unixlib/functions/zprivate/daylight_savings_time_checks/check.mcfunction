#Check if daylight savings time has to be applied
data modify storage unixlib:cmd_block Time.Hour set string block 29999983 1 29999983 LastOutput 10 12
function unixlib:zprivate/daylight_savings_time_checks/set_cmd_block_time with storage unixlib:cmd_block Time
setblock 29999983 1 29999983 air

execute if score #UnixLib UnixLib_Hour = #UnixLib_CommandBlock UnixLib_Hour run return 0

#Apply Daylight Savings Time (Unixtime = UnixtimePrev - HourPrev*3600 + Hour*3600)
scoreboard players operation #UnixLib_Calc UnixLib = #UnixLib UnixLib_Hour
scoreboard players operation #UnixLib_Calc UnixLib *= #c3600 Constant
scoreboard players operation #UnixLib UnixLib_UnixTIme -= #UnixLib_Calc UnixLib

scoreboard players operation #UnixLib_Calc UnixLib = #UnixLib_CommandBlock UnixLib_Hour
scoreboard players operation #UnixLib_Calc UnixLib *= #c3600 Constant
scoreboard players operation #UnixLib UnixLib_UnixTIme += #UnixLib_Calc UnixLib

#Increment or decrement the day, just in case daylight savings time COULD do that
scoreboard players operation #UnixLib_Calc UnixLib = #UnixLib UnixLib_Hour
scoreboard players operation #UnixLib_Calc UnixLib -= #UnixLib_CommandBlock UnixLib_Hour
execute if score #UnixLib_Calc UnixLib matches 12.. run function unixlib:zprivate/timer_1d
execute if score #UnixLib_Calc UnixLib matches ..-12 run scoreboard players remove #UnixLib UnixLib_Day 1

#Adjust "timer_1d" schedule
scoreboard players set #UnixLib_NextDayStart UnixLib_Second 1727998
scoreboard players operation #UnixLib_CommandBlock UnixLib_Hour *= #c72000 Constant
execute store result storage unixlib:calc Result.NextDayStart int 1 run scoreboard players operation #UnixLib_NextDayStart UnixLib_Second -= #UnixLib_CommandBlock UnixLib_Hour
function unixlib:zprivate/daylight_savings_time_checks/start_schedules with storage unixlib:calc Result
#Calculate macros for schedules
$scoreboard players set #UnixLib_CommandBlock UnixLib_Second $(Second)
$scoreboard players set #UnixLib_CommandBlock UnixLib_Minute $(Minute)
$scoreboard players set #UnixLib_CommandBlock UnixLib_Hour $(Hour)

scoreboard players set #UnixLib_NextMinuteStart UnixLib_Second 1199
scoreboard players operation #UnixLib_Calc UnixLib = #UnixLib_CommandBlock UnixLib_Second
scoreboard players operation #UnixLib_Calc UnixLib *= #c20 Constant
execute store result storage unixlib:calc Result.NextMinuteStart short 1 run scoreboard players operation #UnixLib_NextMinuteStart UnixLib_Second -= #UnixLib_Calc UnixLib

scoreboard players set #UnixLib_NextHourStart UnixLib_Second 70800
scoreboard players operation #UnixLib_NextHourStart UnixLib_Second += #UnixLib_NextMinuteStart UnixLib_Second
scoreboard players operation #UnixLib_Calc UnixLib = #UnixLib_CommandBlock UnixLib_Minute
scoreboard players operation #UnixLib_Calc UnixLib *= #c1200 Constant
execute store result storage unixlib:calc Result.NextHourStart int 1 run scoreboard players operation #UnixLib_NextHourStart UnixLib_Second -= #UnixLib_Calc UnixLib

scoreboard players set #UnixLib_NextDayStart UnixLib_Second 1656000
scoreboard players operation #UnixLib_NextDayStart UnixLib_Second += #UnixLib_NextHourStart UnixLib_Second
scoreboard players operation #UnixLib_Calc UnixLib = #UnixLib_CommandBlock UnixLib_Hour
scoreboard players operation #UnixLib_Calc UnixLib *= #c72000 Constant
execute store result storage unixlib:calc Result.NextDayStart int 1 run scoreboard players operation #UnixLib_NextDayStart UnixLib_Second -= #UnixLib_Calc UnixLib

function unixlib:zprivate/update/setup/start_schedules_3 with storage unixlib:calc Result
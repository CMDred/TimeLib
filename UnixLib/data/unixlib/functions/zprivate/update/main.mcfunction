#Get Unix Timestamp
execute store success score #UnixLib_Check UnixLib run data modify storage unixlib:zprivate b64.data set from block 29999983 0 29999983 Items[0].tag.SkullOwner.Properties.textures[0].Value
execute if score #UnixLib_Check UnixLib matches 0 run scoreboard players operation #UnixLib UnixLib_UnixTime = #UnixLib_Previous UnixLib_UnixTime
execute if score #UnixLib_Check UnixLib matches 1 run data modify storage unixlib:zprivate b64.input.0 set string storage unixlib:zprivate b64.data 24 28
execute if score #UnixLib_Check UnixLib matches 1 run data modify storage unixlib:zprivate b64.input.1 set string storage unixlib:zprivate b64.data 28 32
execute if score #UnixLib_Check UnixLib matches 1 run data modify storage unixlib:zprivate b64.input.2 set string storage unixlib:zprivate b64.data 32 36
execute if score #UnixLib_Check UnixLib matches 1 run data modify storage unixlib:zprivate b64.input.3 set string storage unixlib:zprivate b64.data 36 40
execute if score #UnixLib_Check UnixLib matches 1 run function unixlib:zprivate/update/b64/decode with storage unixlib:zprivate b64.input
item replace block 29999983 0 29999983 container.0 with air

#Update Unix Timestamp with information from the Command block (Part 3: Check if Command block is behind by at least 1 hour. Minimum of 1 hour because of daylight savings time)
scoreboard players operation #UnixLib_CommandBlock UnixLib_UnixTime = #UnixLib_CommandBlock UnixLib_Hour
scoreboard players operation #UnixLib_CommandBlock UnixLib_UnixTime *= #c3600 Constant
scoreboard players operation #UnixLib_Calc UnixLib = #UnixLib_CommandBlock UnixLib_Minute
scoreboard players operation #UnixLib_Calc UnixLib *= #c60 Constant
scoreboard players operation #UnixLib_CommandBlock UnixLib_UnixTime += #UnixLib_Calc UnixLib
scoreboard players operation #UnixLib_CommandBlock UnixLib_UnixTime += #UnixLib_CommandBlock UnixLib_Second

scoreboard players operation #UnixLib_Calc UnixLib_UnixTime = #UnixLib UnixLib_UnixTime
scoreboard players operation #UnixLib_Calc UnixLib_UnixTime += #UnixLib UnixLib_CommandBlockOffset
scoreboard players operation #UnixLib_Calc UnixLib_UnixTime %= #c86400 Constant

scoreboard players operation #UnixLib UnixLib_UnixTime -= #UnixLib_Calc UnixLib_UnixTime
scoreboard players operation #UnixLib UnixLib_UnixTime += #UnixLib_CommandBlock UnixLib_UnixTime
scoreboard players operation #UnixLib_Check UnixLib = #UnixLib_CommandBlock UnixLib_UnixTime
scoreboard players operation #UnixLib_Check UnixLib -= #UnixLib_Calc UnixLib_UnixTime
execute if score #UnixLib_Check UnixLib matches ..-3601 run scoreboard players add #UnixLib UnixLib_UnixTime 86400

#Get Date using the Unix Timestamp
scoreboard players operation #UnixLib_Input UnixLib = #UnixLib UnixLib_UnixTime
function unixlib:unix/get_date
scoreboard players operation #UnixLib UnixLib_Year = #UnixLib_Output UnixLib_Year
scoreboard players operation #UnixLib UnixLib_Month = #UnixLib_Output UnixLib_Month
scoreboard players operation #UnixLib UnixLib_Week = #UnixLib_Output UnixLib_Week
scoreboard players operation #UnixLib UnixLib_Day = #UnixLib_Output UnixLib_Day
scoreboard players operation #UnixLib UnixLib_Hour = #UnixLib_Output UnixLib_Hour
scoreboard players operation #UnixLib UnixLib_Minute = #UnixLib_Output UnixLib_Minute
scoreboard players operation #UnixLib UnixLib_Second = #UnixLib_Output UnixLib_Second
scoreboard players operation #UnixLib UnixLib_WeekDay = #UnixLib_Output UnixLib_WeekDay
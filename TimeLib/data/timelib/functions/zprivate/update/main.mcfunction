#Get Unix Timestamp
data modify storage timelib:zprivate b64.data set from block 29999983 0 29999983 Items[0].tag.SkullOwner.Properties.textures[0].Value
data modify storage timelib:zprivate b64.input.0 set string storage timelib:zprivate b64.data 24 28
data modify storage timelib:zprivate b64.input.1 set string storage timelib:zprivate b64.data 28 32
data modify storage timelib:zprivate b64.input.2 set string storage timelib:zprivate b64.data 32 36
data modify storage timelib:zprivate b64.input.3 set string storage timelib:zprivate b64.data 36 40
function timelib:zprivate/update/b64/decode with storage timelib:zprivate b64.input
item replace block 29999983 0 29999983 container.0 with air

#Update Unix Timestamp with information from the Command block (Part 3: Check if Command block is behind by at least 1 hour. Minimum of 1 hour because of daylight savings time)
scoreboard players operation #TimeLib.CommandBlock TimeLib.UnixTime = #TimeLib.CommandBlock TimeLib.Hour
scoreboard players operation #TimeLib.CommandBlock TimeLib.UnixTime *= #c3600 Constant
scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib.CommandBlock TimeLib.Minute
scoreboard players operation #TimeLib.Calc TimeLib *= #c60 Constant
scoreboard players operation #TimeLib.CommandBlock TimeLib.UnixTime += #TimeLib.Calc TimeLib
scoreboard players operation #TimeLib.CommandBlock TimeLib.UnixTime += #TimeLib.CommandBlock TimeLib.Second

scoreboard players operation #TimeLib TimeLib.UnixTime += #TimeLib.Settings.TimeZoneOffset TimeLib
scoreboard players operation #TimeLib.Calc TimeLib.UnixTime = #TimeLib TimeLib.UnixTime
scoreboard players operation #TimeLib.Calc TimeLib.UnixTime %= #c86400 Constant

scoreboard players operation #TimeLib TimeLib.UnixTime -= #TimeLib.Calc TimeLib.UnixTime
scoreboard players operation #TimeLib TimeLib.UnixTime += #TimeLib.CommandBlock TimeLib.UnixTime
scoreboard players operation #TimeLib.Check TimeLib = #TimeLib.CommandBlock TimeLib.UnixTime
scoreboard players operation #TimeLib.Check TimeLib -= #TimeLib.Calc TimeLib.UnixTime
scoreboard players operation #TimeLib.Check TimeLib -= #TimeLib.Settings.CommandBlockOffset TimeLib
execute if score #TimeLib.Check TimeLib matches ..-3601 run scoreboard players add #TimeLib TimeLib.UnixTime 86400

#Get Date using the Unix Timestamp
scoreboard players operation #TimeLib.Input TimeLib = #TimeLib TimeLib.UnixTime
function timelib:util/get_date
scoreboard players operation #TimeLib TimeLib.Year = #TimeLib.Output TimeLib.Year
scoreboard players operation #TimeLib TimeLib.Month = #TimeLib.Output TimeLib.Month
scoreboard players operation #TimeLib TimeLib.Week = #TimeLib.Output TimeLib.Week
scoreboard players operation #TimeLib TimeLib.Day = #TimeLib.Output TimeLib.Day
scoreboard players operation #TimeLib TimeLib.Hour = #TimeLib.Output TimeLib.Hour
scoreboard players operation #TimeLib TimeLib.Minute = #TimeLib.Output TimeLib.Minute
scoreboard players operation #TimeLib TimeLib.Second = #TimeLib.Output TimeLib.Second
scoreboard players operation #TimeLib TimeLib.WeekDay = #TimeLib.Output TimeLib.WeekDay
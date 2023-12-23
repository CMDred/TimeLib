#Check
scoreboard objectives add TimeLib.Uninstall dummy
execute store success score #TimeLib TimeLib.Uninstall run scoreboard objectives remove TimeLib
execute if score #TimeLib TimeLib.Uninstall matches 0 run tellraw @a ["",{"text":"🕒 TimeLib >> ","color":"#2DE1E1"},{"text":"⚠ Could not remove TimeLib. Is it already uninstalled?","color":"red"}]
execute if score #TimeLib TimeLib.Uninstall matches 0 run return run scoreboard objectives remove TimeLib.Uninstall
scoreboard objectives remove TimeLib.Uninstall

#Tellraw
tellraw @a [{"text":"🕒 TimeLib >> ","color":"#2DE1E1"},{"text":"Uninstalled TimeLib (v1.1.2)","color":"white"},"\n",{"text":"🕒 TimeLib >> ","color":"#2DE1E1"},{"text":"⚠ Due to compatibility reasons, the 'Constant' scoreboard objective, the shulker box at 29999983 0 29999983 and the forceloaded chunk at 29999983 29999983 were not automatically removed!","color":"red"}]

#Remove Scoreboards
scoreboard objectives remove TimeLib.UnixTime
scoreboard objectives remove TimeLib.WeekDay
scoreboard objectives remove TimeLib.Year
scoreboard objectives remove TimeLib.Month
scoreboard objectives remove TimeLib.Day
scoreboard objectives remove TimeLib.Hour
scoreboard objectives remove TimeLib.Minute
scoreboard objectives remove TimeLib.Second

scoreboard objectives remove TimeLib.Tick
scoreboard objectives remove TimeLib.TotalWorldTime

#Remove Fake Players
scoreboard players reset #TimeLib.Init
scoreboard players reset #TimeLib.Check
scoreboard players reset #TimeLib
scoreboard players reset #TimeLib.Input
scoreboard players reset #TimeLib.Output
scoreboard players reset #TimeLib.NextSecondStart
scoreboard players reset #TimeLib.Calc
scoreboard players reset #TimeLib.NextSecondStart
scoreboard players reset #TimeLib.NextMinuteStart
scoreboard players reset #TimeLib.NextHourStart
scoreboard players reset #TimeLib.NextDayStart
scoreboard players reset #TimeLib.PlayerHead
scoreboard players reset #TimeLib.CommandBlock
scoreboard players reset #TimeLib.Settings.CommandBlockOffset
scoreboard players reset #TimeLib.Settings.TimeZoneOffset
scoreboard players reset #TimeLib.Settings.RealtimeTracking
scoreboard players reset #TimeLib.Settings.SavingsTimeChecks

#Remove Data Storages
data remove storage timelib:zprivate days_list
data remove storage timelib:zprivate b64
data remove storage timelib:zprivate cmd_block
data remove storage timelib:zprivate calc

#Stop Schedule Loops
schedule clear timelib:zprivate/timer_1s
schedule clear timelib:zprivate/timer_1min
schedule clear timelib:zprivate/timer_1h
schedule clear timelib:zprivate/timer_1d

schedule clear timelib:zprivate/singleplayer/pause/detect
schedule clear timelib:zprivate/singleplayer/timer_1s

schedule clear timelib:zprivate/daylight_savings_time_checks/timer_1h
#Check
scoreboard objectives add UnixLib_Uninstall dummy
execute store success score #UnixLib UnixLib_Uninstall run scoreboard objectives remove UnixLib
execute if score #UnixLib UnixLib_Uninstall matches 0 run tellraw @a ["",{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"⚠ Could not remove UnixLib (v0.9.4). Is it already uninstalled?","color":"red"}]
execute if score #UnixLib UnixLib_Uninstall matches 0 run return run scoreboard objectives remove UnixLib_Uninstall

#Tellraw
tellraw @a [{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"Uninstalled UnixLib (v0.9.4)","color":"white"},"\n",{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"⚠ Due to compatibility reasons, the 'Constant' objective, the Shulker Box at 29999983 0 29999983 and the Forceloaded Chunk at 29999983 29999983 were not automatically removed!","color":"red"}]

#Remove Scoreboards
scoreboard objectives remove UnixLib_UnixTime
scoreboard objectives remove UnixLib_WeekDay
scoreboard objectives remove UnixLib_Year
scoreboard objectives remove UnixLib_Month
scoreboard objectives remove UnixLib_Day
scoreboard objectives remove UnixLib_Hour
scoreboard objectives remove UnixLib_Minute
scoreboard objectives remove UnixLib_Second

scoreboard objectives remove UnixLib_Tick
scoreboard objectives remove UnixLib_TotalWorldTime

scoreboard objectives remove UnixLib_TimeZoneOffset
scoreboard objectives remove UnixLib_CommandBlockOffset

#Remove Data Storages
data remove storage unixlib:zprivate days_list
data remove storage unixlib:zprivate b64
data remove storage unixlib:zprivate cmd_block
data remove storage unixlib:zprivate calc
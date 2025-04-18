# Check if TimeLib is installed
scoreboard objectives add TimeLib.Uninstall dummy
execute store success score #TimeLib TimeLib.Uninstall run scoreboard objectives remove TimeLib
execute if score #TimeLib TimeLib.Uninstall matches 0 run tellraw @a ["",{text:"🕒 TimeLib >> ",color:"#2DE1E1"},{text:"⚠ Could not remove TimeLib. Is it installed?",color:"red"}]
execute if score #TimeLib TimeLib.Uninstall matches 0 run return run scoreboard objectives remove TimeLib.Uninstall
scoreboard objectives remove TimeLib.Uninstall

# Tellraw
tellraw @a ["",{text:"🕒 TimeLib >> ",color:"#2DE1E1"},"Uninstalled TimeLib (v2.0.0)\n",{text:"🕒 TimeLib >> ",color:"#2DE1E1"},{text:"⚠ Removed the following things (Overworld):\n- Block at 29999983 0 29999983\n- Block at 29999983 1 29999983\n- Forceload at 29999983 29999983",color:"red"}]

# Remove scoreboards
scoreboard objectives remove TimeLib.UnixTime
scoreboard objectives remove TimeLib.WeekDay
scoreboard objectives remove TimeLib.Year
scoreboard objectives remove TimeLib.Month
scoreboard objectives remove TimeLib.Day
scoreboard objectives remove TimeLib.Hour
scoreboard objectives remove TimeLib.Minute
scoreboard objectives remove TimeLib.Second

# Reset fake players
scoreboard players reset #TimeLib
scoreboard players reset #TimeLib.Settings.CommandBlockOffset
scoreboard players reset #TimeLib.Settings.TimeZoneOffset
scoreboard players reset #TimeLib.Settings.ShowLoadMessage

scoreboard players reset #TimeLib.4
scoreboard players reset #TimeLib.7
scoreboard players reset #TimeLib.24
scoreboard players reset #TimeLib.60
scoreboard players reset #TimeLib.1461
scoreboard players reset #TimeLib.3600
scoreboard players reset #TimeLib.86400

scoreboard players reset #TimeLib.DaytimeChanged
scoreboard players reset #TimeLib.UnixTimestampChanged
scoreboard players reset #TimeLib.HourChanged
scoreboard players reset #TimeLib.MinuteChanged
scoreboard players reset #TimeLib.SecondChanged
scoreboard players reset #TimeLib.DaytimeInSeconds.Hours
scoreboard players reset #TimeLib.DaytimeInSeconds.Minutes
scoreboard players reset #TimeLib.LatestUnixTimestamp.Daytime
scoreboard players reset #TimeLib.LatestUnixTimestamp
scoreboard players reset #TimeLib.Current
scoreboard players reset #TimeLib.Previous
scoreboard players reset #TimeLib.CommandBlock.Daytime
scoreboard players reset #TimeLib.Calc
scoreboard players reset #TimeLib.Output

# Remove data storages
data remove storage timelib:zprivate Base64
data remove storage timelib:zprivate Days
data remove storage timelib:zprivate CommandBlock
data remove storage timelib:date WeekDay
data remove storage timelib:date WeekDayShort
data remove storage timelib:date Month
data remove storage timelib:date MonthShort
data remove storage timelib:date Day
data remove storage timelib:date Year
data remove storage timelib:output WeekDay
data remove storage timelib:output WeekDayShort
data remove storage timelib:output Month
data remove storage timelib:output MonthShort
data remove storage timelib:output Day
data remove storage timelib:output Year

# Remove the blocks and forceload
execute in minecraft:overworld run fill 29999983 0 29999983 29999983 1 29999983 minecraft:air
execute in minecraft:overworld run forceload remove 29999983 29999983

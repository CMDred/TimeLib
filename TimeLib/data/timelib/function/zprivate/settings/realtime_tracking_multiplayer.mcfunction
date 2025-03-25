playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2 1
execute if score #TimeLib.Settings.RealtimeTracking TimeLib matches 2 run return run tellraw @s [{text:"🕒 TimeLib >> ",color:"#2DE1E1"},{text:"This setting is already selected.",color:"red"}]
scoreboard players set #TimeLib.Settings.RealtimeTracking TimeLib 2
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n"
function timelib:util/settings
tellraw @s ["",{text:"🕒 TimeLib >> ",color:"#2DE1E1"},{text:"Successfully selected 'Multiplayer'."}]
schedule clear timelib:zprivate/singleplayer/pause/detect
schedule clear timelib:zprivate/singleplayer/timer_1s
scoreboard objectives remove TimeLib.TotalWorldTime
scoreboard objectives remove TimeLib.Tick
function timelib:util/update

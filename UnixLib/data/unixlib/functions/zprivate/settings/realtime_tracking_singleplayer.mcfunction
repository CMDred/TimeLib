playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2 1
execute if score #UnixLib_Settings_RealtimeTracking UnixLib matches 1 run return run tellraw @s [{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"This setting is already selected.","color":"red"}]
scoreboard players set #UnixLib_Settings_RealtimeTracking UnixLib 1
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n"
function unixlib:unix/settings
tellraw @s ["",{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"Successfully selected 'Singleplayer'."}]
scoreboard objectives add UnixLib_TotalWorldTime minecraft.custom:minecraft.total_world_time
scoreboard objectives add UnixLib_Tick dummy
schedule clear unixlib:zprivate/timer_1s
function unixlib:unix/update
function unixlib:zprivate/singleplayer/pause/detect
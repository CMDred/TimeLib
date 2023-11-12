playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2 1
execute if score #UnixLib_Settings_SavingsTimeChecks UnixLib matches 2 run return run tellraw @s [{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"This setting is already enabled.","color":"red"}]
scoreboard players set #UnixLib_Settings_SavingsTimeChecks UnixLib 2
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n"
function unixlib:unix/settings
tellraw @s ["",{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"Successfully enabled hourly daylight savings time checks."}]
schedule clear unixlib:zprivate/timer_1h
function unixlib:unix/update
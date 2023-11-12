playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2 1
execute if score #UnixLib_Settings_SavingsTimeChecks UnixLib matches 1 run return run tellraw @s [{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"This setting is already disabled.","color":"red"}]
scoreboard players set #UnixLib_Settings_SavingsTimeChecks UnixLib 1
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n"
function unixlib:unix/settings
tellraw @s ["",{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"Successfully disabled hourly daylight savings time checks."}]
schedule clear unixlib:zprivate/daylight_savings_time_checks/timer_1h
function unixlib:unix/update
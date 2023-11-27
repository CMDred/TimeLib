playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2 1
execute if score #TimeLib.Settings_SavingsTimeChecks TimeLib matches 1 run return run tellraw @s [{"text":"🕒 TimeLib >> ","color":"#2DE1E1"},{"text":"This setting is already disabled.","color":"red"}]
scoreboard players set #TimeLib.Settings_SavingsTimeChecks TimeLib 1
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n"
function timelib:util/settings
tellraw @s ["",{"text":"🕒 TimeLib >> ","color":"#2DE1E1"},{"text":"Successfully disabled hourly daylight savings time checks."}]
schedule clear timelib:zprivate/daylight_savings_time_checks/timer_1h
function timelib:util/update
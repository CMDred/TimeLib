playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2 1
execute if score #TimeLib.Settings.ShowLoadMessage TimeLib matches 1 run return run tellraw @s [{"text":"🕒 TimeLib >> ","color":"#2DE1E1"},{"text":"This setting is already enabled.","color":"red"}]
scoreboard players set #TimeLib.Settings.ShowLoadMessage TimeLib 1
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n"
function timelib:util/settings
tellraw @s ["",{"text":"🕒 TimeLib >> ","color":"#2DE1E1"},{"text":"Successfully enabled the reload messages."}]

playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2 1
execute if score #TimeLib.Settings.ShowLoadMessage TimeLib matches 0 run return run tellraw @s [{text:"🕒 TimeLib >> ",color:"#2DE1E1"},{text:"This setting is already disabled.",color:"red"}]
scoreboard players set #TimeLib.Settings.ShowLoadMessage TimeLib 0
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n"
function timelib:util/settings
tellraw @s ["",{text:"🕒 TimeLib >> ",color:"#2DE1E1"},{text:"Successfully disabled the reload messages."}]

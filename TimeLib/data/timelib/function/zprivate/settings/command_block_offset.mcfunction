playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2 1
$scoreboard players set #TimeLib.Temporary TimeLib $(Offset)
scoreboard players operation #TimeLib.Temporary TimeLib *= #c3600 Constant
execute if score #TimeLib.Settings.CommandBlockOffset TimeLib = #TimeLib.Temporary TimeLib run tellraw @s [{text:"🕒 TimeLib >> ",color:"#2DE1E1"},{text:"This setting already has this value.",color:"red"}]
execute if score #TimeLib.Settings.CommandBlockOffset TimeLib = #TimeLib.Temporary TimeLib run return run scoreboard players reset #TimeLib.Temporary
scoreboard players operation #TimeLib.Settings.CommandBlockOffset TimeLib = #TimeLib.Temporary TimeLib
scoreboard players reset #TimeLib.Temporary
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n"
function timelib:util/settings
tellraw @s ["",{text:"🕒 TimeLib >> ",color:"#2DE1E1"},{text:"Successfully updated the Command Block Offset."}]
function timelib:util/update

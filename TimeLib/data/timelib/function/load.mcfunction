#Init
scoreboard objectives add TimeLib dummy
execute unless score #TimeLib.Init TimeLib matches 1 run function timelib:init

#Tellraw
tellraw @a ["",{"text":"🕒 TimeLib >> ","color":"#2DE1E1"},{"text":"Made by CMDred","clickEvent":{"action":"open_url","value":"https://www.youtube.com/BluesProductionTeam"},"hoverEvent":{"action":"show_text","contents":[{"text":"YouTube: ","color":"dark_aqua"},{"text":"CMDred","color":"white"}]}}]
tellraw @a [{"text":"🕒 TimeLib >> ","color":"#2DE1E1"},{"text":"Click here to open the settings!","color":"yellow","clickEvent":{"action":"run_command","value":"/function timelib:util/settings"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to open!","color":"yellow"}]}}]

#Update
function timelib:zprivate/update/setup/reload_update
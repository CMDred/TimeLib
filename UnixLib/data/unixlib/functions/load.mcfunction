#Init
scoreboard objectives add UnixLib dummy
execute unless score #UnixLib_Init UnixLib matches 1 run function unixlib:init

#Tellraw
tellraw @a ["",{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"Made by CMDred","clickEvent":{"action":"open_url","value":"https://www.youtube.com/BluesProductionTeam"},"hoverEvent":{"action":"show_text","contents":[{"text":"YouTube: ","color":"dark_aqua"},{"text":"CMDred","color":"white"}]}}]
tellraw @a [{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"Click here to open the settings!","color":"yellow","clickEvent":{"action":"run_command","value":"/function unixlib:unix/settings"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click to open!","color":"yellow"}]}}]

#Update
execute if entity @a[limit=1] run return run function unixlib:unix/update
schedule function unixlib:unix/update 1s
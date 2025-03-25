# Init
scoreboard objectives add TimeLib dummy
execute unless score #TimeLib.Init TimeLib matches 1 run function timelib:zprivate/init

# Tellraw
execute unless score #TimeLib.Settings.ShowLoadMessage TimeLib matches 0 run tellraw @a ["",{text:"🕒 TimeLib >> ",color:"#2DE1E1"},{text:"Made by CMDred",click_event:{action:"open_url",url:"https://www.youtube.com/BluesProductionTeam"},hover_event:{action:"show_text",value:[{text:"YouTube: ",color:"dark_aqua"},{text:"CMDred",color:"white"}]}},"\n",{text:"🕒 TimeLib >> ",color:"#2DE1E1"},"Get the latest updates: ",{text:"Modrinth",color:"#5491F7",click_event:{action:"open_url",url:"https://modrinth.com/datapack/timelib"},hover_event:{action:"show_text",value:["Open page"]}},", ",{text:"GitHub",color:"#5491F7",click_event:{action:"open_url",url:"https://github.com/CMDred/timelib"},hover_event:{action:"show_text",value:["Open page"]}}]
execute unless score #TimeLib.Settings.ShowLoadMessage TimeLib matches 0 run tellraw @a [{text:"🕒 TimeLib >> ",color:"#2DE1E1"},{text:"Click here to open the settings!",color:"yellow",click_event:{action:"run_command",command:"/function timelib:util/settings"},hover_event:{action:"show_text",value:[{text:"Click to open!",color:"yellow"}]}}]

# Update
function timelib:zprivate/update/setup/reload_update

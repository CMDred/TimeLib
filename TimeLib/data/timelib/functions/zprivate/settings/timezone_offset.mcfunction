playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2 1
$execute if score #TimeLib TimeLib.TimeZoneOffset matches $(Offset) run return run tellraw @s [{"text":"🕒 TimeLib >> ","color":"#2DE1E1"},{"text":"This setting already has this value.","color":"red"}]
$scoreboard players set #TimeLib TimeLib.TimeZoneOffset $(Offset)
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n"
function timelib:util/settings
tellraw @s ["",{"text":"🕒 TimeLib >> ","color":"#2DE1E1"},{"text":"Successfully updated the Timezone Offset."}]
function timelib:util/update
playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2 1
$execute if score #UnixLib UnixLib_TimeZoneOffset matches $(Offset) run return run tellraw @s [{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"This setting already has this value.","color":"red"}]
$scoreboard players set #UnixLib UnixLib_TimeZoneOffset $(Offset)
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n"
function unixlib:unix/settings
tellraw @s ["",{"text":"🕒 UnixLib >> ","color":"#2DE1E1"},{"text":"Successfully updated the Timezone Offset."}]
function unixlib:unix/update
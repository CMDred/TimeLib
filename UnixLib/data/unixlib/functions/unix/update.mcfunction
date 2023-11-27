########################################################
##                     HOW TO USE                     ##
########################################################
## 1. Run this function.                              ##
##                                                    ##
## Note: It runs automatically on server start,       ##
##       pause (Singleplayer) and every hour          ##
##       (If the setting is enabled).                 ##
## Note: Updating can take 2 ticks if the             ##
##       "Multiplayer" setting is enabled, but is     ##
##       instant in "Singleplayer" with minimal       ##
##       performance cost.                            ##
########################################################

#Update Unix Time (Setup)
scoreboard players set #TimeLib.CommandBlock TimeLib 0
scoreboard players set #TimeLib.PlayerHead TimeLib 0
schedule clear timelib:zprivate/update/setup/tick_loop

execute store result score #TimeLib.GameruleCheck TimeLib run gamerule sendCommandFeedback
execute if score #TimeLib.GameruleCheck TimeLib matches 0 run gamerule sendCommandFeedback true

item replace block 29999983 0 29999983 container.0 with player_head{SkullOwner:"SilicatYT"}
execute as @a[limit=1] store success score #TimeLib.PlayerHead TimeLib run loot replace block 29999983 0 29999983 container.0 loot timelib:fill_player_head
setblock 29999983 1 29999983 command_block{TrackOutput:1b,auto:1b,Command:"execute if score #TimeLib.Init TimeLib matches 1"}
setblock 29999983 2 29999983 repeating_command_block{TrackOutput:1b,auto:1b,Command:"execute if score #TimeLib.Init TimeLib matches 1"}
schedule function timelib:zprivate/update/setup/start_checks 2t
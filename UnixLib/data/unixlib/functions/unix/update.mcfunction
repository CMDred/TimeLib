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
scoreboard players set #UnixLib_CommandBlock UnixLib 0
scoreboard players set #UnixLib_PlayerHead UnixLib 0
schedule clear unixlib:zprivate/update/setup/tick_loop

execute store result score #UnixLib_GameruleCheck UnixLib run gamerule sendCommandFeedback
execute if score #UnixLib_GameruleCheck UnixLib matches 0 run gamerule sendCommandFeedback true

item replace block 29999983 0 29999983 container.0 with player_head{SkullOwner:"SilicatYT"}
execute as @a[limit=1] store success score #UnixLib_PlayerHead UnixLib run loot replace block 29999983 0 29999983 container.0 loot unixlib:fill_player_head
setblock 29999983 1 29999983 command_block{TrackOutput:1b,auto:1b,Command:"execute if score #UnixLib_Init UnixLib matches 1"}
setblock 29999983 2 29999983 repeating_command_block{TrackOutput:1b,auto:1b,Command:"execute if score #UnixLib_Init UnixLib matches 1"}
schedule function unixlib:zprivate/update/setup/start_checks 2t
# Update the time
    # Check if the unix timestamp has changed
    # (Important): The player head does not resolve instantly. While unresolved, it will behave as if the unix timestamp hadn't changed, so it won't go backwards in time.
    # (Important): If the unix timestamp has changed, it will update the time directly from its own function.
    # (Important): If a player is online, the loot table is used instead, as that will resolve the head much quicker.
    execute in minecraft:overworld run item replace block 29999999 0 29999999 container.0 with minecraft:player_head[minecraft:profile={name:"SilicatYT"}]
    execute as @a[limit=1] in minecraft:overworld run loot replace block 29999999 0 29999999 container.0 loot timelib:player_head
    execute in minecraft:overworld store success score #TimeLib.UnixTimestampChanged TimeLib run data modify storage timelib:zprivate Base64.Value set from block 29999999 0 29999999 Items[0].components."minecraft:profile".properties[0].value
    execute if score #TimeLib.UnixTimestampChanged TimeLib matches 1 run return run function timelib:zprivate/update_time/get_unix_timestamp/main

    # Check if the daytime has changed
        # Get TPS
        # (Important): Keep track of the ticks between each daytime change to get the TPS.
        # (Important): Because of execution order, players leaving the game will have their score set to -1. This means a player leaving and rejoining cannot cause the game to think it was paused.
        scoreboard players add #TimeLib.TicksSinceDaytimeChange TimeLib 1
        execute as @a[scores={TimeLib.Internal.TotalWorldTime=1..},limit=1] run function timelib:zprivate/game_unpaused
        scoreboard players set @a TimeLib.Internal.TotalWorldTime -1

    execute in minecraft:overworld store success score #TimeLib.DaytimeChanged TimeLib run data modify storage timelib:zprivate CommandBlock.Output set from block 29999999 1 29999999 LastOutput.text
    execute if score #TimeLib.DaytimeChanged TimeLib matches 1 run function timelib:zprivate/update_time/main

# Update the time
    # Check if the unix timestamp has changed
    # (Important): The player head does not resolve instantly. While unresolved, it will behave as if the unix timestamp hadn't changed, so it won't go backwards in time.
    # (Important): If the unix timestamp has changed, it will update the time directly from its own function.
    # (Important): If a player is online, the loot table is used instead, as that will resolve the head much quicker.
    execute in timelib:void run item replace block 0 0 0 container.0 with minecraft:player_head[minecraft:profile={name:"SilicatYT"}]
    execute as @a[limit=1] in timelib:void run loot replace block 0 0 0 container.0 loot timelib:player_head
    execute in timelib:void store success score #TimeLib.UnixTimestampChanged TimeLib run data modify storage timelib:zprivate Base64.Value set from block 0 0 0 Items[0].components."minecraft:profile".properties[0].value
    execute if score #TimeLib.UnixTimestampChanged TimeLib matches 1 run return run function timelib:zprivate/update_time/get_unix_timestamp/main

    # Check if the daytime has changed
    execute in timelib:void store success score #TimeLib.DaytimeChanged TimeLib run data modify storage timelib:zprivate CommandBlock.Output set from block 0 1 0 LastOutput.text
    execute if score #TimeLib.DaytimeChanged TimeLib matches 1 run function timelib:zprivate/update_time/main

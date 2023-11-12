#Only plays if the "Singleplayer" setting is enabled
scoreboard players add #UnixLib UnixLib_Tick 1
execute unless score @a[limit=1] UnixLib_TotalWorldTime matches 0 run function unixlib:zprivate/singleplayer/pause/adjust
scoreboard players set @a UnixLib_TotalWorldTime -1
schedule function unixlib:zprivate/singleplayer/pause/detect 1t
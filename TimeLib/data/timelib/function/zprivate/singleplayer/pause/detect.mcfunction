# Only plays if the "Singleplayer" setting is enabled
scoreboard players add #TimeLib TimeLib.Tick 1
execute unless score @a[limit=1] TimeLib.TotalWorldTime matches 0 run function timelib:zprivate/singleplayer/pause/adjust
scoreboard players set @a TimeLib.TotalWorldTime -1
schedule function timelib:zprivate/singleplayer/pause/detect 1t

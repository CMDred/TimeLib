scoreboard players add #TimeLib TimeLib.Second 1
scoreboard players add #TimeLib TimeLib.UnixTime 1
scoreboard players remove #TimeLib TimeLib.Tick 20
schedule function timelib:zprivate/singleplayer/timer_1s 1s
scoreboard players add #TimeLib TimeLib.Hour 1
scoreboard players remove #TimeLib TimeLib.Minute 60

setblock 29999983 1 29999983 command_block{TrackOutput:1b,auto:1b,Command:"execute if score #TimeLib.Init TimeLib matches 1"}
schedule function timelib:zprivate/daylight_savings_time_checks/check 2t

schedule function timelib:zprivate/daylight_savings_time_checks/timer_1h 3600s
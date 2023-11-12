scoreboard players add #UnixLib UnixLib_Hour 1
scoreboard players remove #UnixLib UnixLib_Minute 60

setblock 29999983 1 29999983 command_block{TrackOutput:1b,auto:1b,Command:"execute if score #UnixLib_Init UnixLib matches 1"}
schedule function unixlib:zprivate/daylight_savings_time_checks/check 2t

schedule function unixlib:zprivate/daylight_savings_time_checks/timer_1h 3600s
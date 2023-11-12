#Start schedules for seconds, minutes, hours and days
execute store result storage unixlib:zprivate cmd_block.Time.Hour byte 1 run scoreboard players get #UnixLib UnixLib_Hour
execute store result storage unixlib:zprivate cmd_block.Time.Minute byte 1 run scoreboard players get #UnixLib UnixLib_Minute
execute store result storage unixlib:zprivate cmd_block.Time.Second byte 1 run scoreboard players get #UnixLib UnixLib_Second
execute store result storage unixlib:zprivate cmd_block.Time.Tick byte 1 run scoreboard players get #UnixLib UnixLib_Tick
function unixlib:zprivate/singleplayer/pause/start_schedules_2 with storage unixlib:zprivate cmd_block.Time
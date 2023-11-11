scoreboard players add #UnixLib UnixLib_Second 1
scoreboard players add #UnixLib UnixLib_UnixTime 1
#tellraw @a [{"score":{"name":"#UnixLib","objective":"UnixLib_Day"}},".",{"score":{"name":"#UnixLib","objective":"UnixLib_Month"}},".",{"score":{"name":"#UnixLib","objective":"UnixLib_Year"}}," - ",{"score":{"name":"#UnixLib","objective":"UnixLib_Hour"}},"h ",{"score":{"name":"#UnixLib","objective":"UnixLib_Minute"}},"min ",{"score":{"name":"#UnixLib","objective":"UnixLib_Second"}},"s"]
schedule function unixlib:zprivate/timer_1s 1s
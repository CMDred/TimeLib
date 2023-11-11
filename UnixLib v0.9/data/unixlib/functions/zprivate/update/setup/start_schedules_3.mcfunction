#Set schedules
execute unless score #UnixLib_Settings_RealtimeTracking UnixLib matches 1 run schedule function unixlib:zprivate/singleplayer/timer_1s 19t
execute if score #UnixLib_Settings_RealtimeTracking UnixLib matches 1 run schedule function unixlib:zprivate/timer_1s 19t
$schedule function unixlib:zprivate/timer_1min $(NextMinuteStart)t
$execute unless score #UnixLib_Settings_SavingsTimeChecks UnixLib matches 1 run schedule function unixlib:zprivate/timer_1h $(NextHourStart)t
$execute if score #UnixLib_Settings_SavingsTimeChecks UnixLib matches 1 run schedule function unixlib:zprivate/daylight_savings_time_checks/timer_1h $(NextHourStart)t
$schedule function unixlib:zprivate/timer_1d $(NextDayStart)t
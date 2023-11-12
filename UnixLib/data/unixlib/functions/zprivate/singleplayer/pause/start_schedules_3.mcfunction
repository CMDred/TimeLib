#Set schedules
$schedule function unixlib:zprivate/singleplayer/timer_1s $(NextSecondStart)t
$schedule function unixlib:zprivate/timer_1min $(NextMinuteStart)t
$execute if score #UnixLib_Settings_SavingsTimeChecks UnixLib matches 1 run schedule function unixlib:zprivate/timer_1h $(NextHourStart)t
$execute if score #UnixLib_Settings_SavingsTimeChecks UnixLib matches 2 run schedule function unixlib:zprivate/daylight_savings_time_checks/timer_1h $(NextHourStart)t
$schedule function unixlib:zprivate/timer_1d $(NextDayStart)t
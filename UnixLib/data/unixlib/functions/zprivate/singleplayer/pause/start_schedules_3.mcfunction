#Set schedules
$schedule function timelib:zprivate/singleplayer/timer_1s $(NextSecondStart)t
$schedule function timelib:zprivate/timer_1min $(NextMinuteStart)t
$execute if score #TimeLib.Settings_SavingsTimeChecks TimeLib matches 1 run schedule function timelib:zprivate/timer_1h $(NextHourStart)t
$execute if score #TimeLib.Settings_SavingsTimeChecks TimeLib matches 2 run schedule function timelib:zprivate/daylight_savings_time_checks/timer_1h $(NextHourStart)t
$schedule function timelib:zprivate/timer_1d $(NextDayStart)t
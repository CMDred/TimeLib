# Set the daytime
$scoreboard players set #TimeLib TimeLib.Hour $(Hour)
scoreboard players operation #TimeLib.Calc TimeLib = #TimeLib.Settings.TimeZoneOffset TimeLib
scoreboard players operation #TimeLib.Calc TimeLib /= #TimeLib.3600 TimeLib
scoreboard players operation #TimeLib TimeLib.Hour += #TimeLib.Calc TimeLib
scoreboard players operation #TimeLib TimeLib.Hour %= #TimeLib.24 TimeLib

# Convert the hours to seconds
scoreboard players operation #TimeLib.DaytimeInSeconds.Hours TimeLib = #TimeLib TimeLib.Hour
scoreboard players operation #TimeLib.DaytimeInSeconds.Hours TimeLib *= #TimeLib.3600 TimeLib

# Update the storage
execute if score #TimeLib TimeLib.Hour matches 10.. store result storage timelib:daytime Hour byte 1 run scoreboard players get #TimeLib TimeLib.Hour
execute if score #TimeLib TimeLib.Hour matches 10.. run return run data modify storage timelib:daytime Hour set string storage timelib:daytime Hour 0 2
execute if score #TimeLib TimeLib.Hour matches 9 run return run data modify storage timelib:daytime Hour set value "09"
execute if score #TimeLib TimeLib.Hour matches 8 run return run data modify storage timelib:daytime Hour set value "08"
execute if score #TimeLib TimeLib.Hour matches 7 run return run data modify storage timelib:daytime Hour set value "07"
execute if score #TimeLib TimeLib.Hour matches 6 run return run data modify storage timelib:daytime Hour set value "06"
execute if score #TimeLib TimeLib.Hour matches 5 run return run data modify storage timelib:daytime Hour set value "05"
execute if score #TimeLib TimeLib.Hour matches 4 run return run data modify storage timelib:daytime Hour set value "04"
execute if score #TimeLib TimeLib.Hour matches 3 run return run data modify storage timelib:daytime Hour set value "03"
execute if score #TimeLib TimeLib.Hour matches 2 run return run data modify storage timelib:daytime Hour set value "02"
execute if score #TimeLib TimeLib.Hour matches 1 run return run data modify storage timelib:daytime Hour set value "01"
data modify storage timelib:daytime Hour set value "00"

# Set the daytime
$scoreboard players set #TimeLib TimeLib.Minute $(Minute)

# Convert the minutes to seconds
scoreboard players operation #TimeLib.DaytimeInSeconds.Minutes TimeLib = #TimeLib TimeLib.Minute
scoreboard players operation #TimeLib.DaytimeInSeconds.Minutes TimeLib *= #TimeLib.60 TimeLib

# Update the storage
execute if score #TimeLib TimeLib.Minute matches 10.. store result storage timelib:daytime Minute byte 1 run scoreboard players get #TimeLib TimeLib.Minute
execute if score #TimeLib TimeLib.Minute matches 10.. run return run data modify storage timelib:daytime Minute set string storage timelib:daytime Minute 0 2
execute if score #TimeLib TimeLib.Minute matches 9 run return run data modify storage timelib:daytime Minute set value "09"
execute if score #TimeLib TimeLib.Minute matches 8 run return run data modify storage timelib:daytime Minute set value "08"
execute if score #TimeLib TimeLib.Minute matches 7 run return run data modify storage timelib:daytime Minute set value "07"
execute if score #TimeLib TimeLib.Minute matches 6 run return run data modify storage timelib:daytime Minute set value "06"
execute if score #TimeLib TimeLib.Minute matches 5 run return run data modify storage timelib:daytime Minute set value "05"
execute if score #TimeLib TimeLib.Minute matches 4 run return run data modify storage timelib:daytime Minute set value "04"
execute if score #TimeLib TimeLib.Minute matches 3 run return run data modify storage timelib:daytime Minute set value "03"
execute if score #TimeLib TimeLib.Minute matches 2 run return run data modify storage timelib:daytime Minute set value "02"
execute if score #TimeLib TimeLib.Minute matches 1 run return run data modify storage timelib:daytime Minute set value "01"
data modify storage timelib:daytime Minute set value "00"

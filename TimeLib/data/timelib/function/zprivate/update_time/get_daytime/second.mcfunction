# Set the daytime
$scoreboard players set #TimeLib TimeLib.Second $(Second)

# Update the storage
execute if score #TimeLib TimeLib.Second matches 10.. store result storage timelib:daytime Second byte 1 run scoreboard players get #TimeLib TimeLib.Second
execute if score #TimeLib TimeLib.Second matches 10.. run return run data modify storage timelib:daytime Second set string storage timelib:daytime Second 0 2
execute if score #TimeLib TimeLib.Second matches 9 run return run data modify storage timelib:daytime Second set value "09"
execute if score #TimeLib TimeLib.Second matches 8 run return run data modify storage timelib:daytime Second set value "08"
execute if score #TimeLib TimeLib.Second matches 7 run return run data modify storage timelib:daytime Second set value "07"
execute if score #TimeLib TimeLib.Second matches 6 run return run data modify storage timelib:daytime Second set value "06"
execute if score #TimeLib TimeLib.Second matches 5 run return run data modify storage timelib:daytime Second set value "05"
execute if score #TimeLib TimeLib.Second matches 4 run return run data modify storage timelib:daytime Second set value "04"
execute if score #TimeLib TimeLib.Second matches 3 run return run data modify storage timelib:daytime Second set value "03"
execute if score #TimeLib TimeLib.Second matches 2 run return run data modify storage timelib:daytime Second set value "02"
execute if score #TimeLib TimeLib.Second matches 1 run return run data modify storage timelib:daytime Second set value "01"
data modify storage timelib:daytime Second set value "00"

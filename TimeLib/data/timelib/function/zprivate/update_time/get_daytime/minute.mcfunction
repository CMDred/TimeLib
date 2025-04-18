# Set the daytime
$scoreboard players set #TimeLib TimeLib.Minute $(Minute)

# Convert the minutes to seconds
scoreboard players operation #TimeLib.DaytimeInSeconds.Minutes TimeLib = #TimeLib TimeLib.Minute
scoreboard players operation #TimeLib.DaytimeInSeconds.Minutes TimeLib *= #TimeLib.60 TimeLib

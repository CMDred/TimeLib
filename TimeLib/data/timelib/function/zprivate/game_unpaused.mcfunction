# Adjust the 'PreviousGametime' score to take the paused time into account
scoreboard players operation #TimeLib.PreviousGametime TimeLib -= @s TimeLib.Internal.TotalWorldTime

# Run the '#timelib:game_unpaused' event
# (Important): The number of ticks the game has been paused for can be read in '#TimeLib.PausedTicks TimeLib'.
scoreboard players operation #TimeLib.PausedTicks TimeLib = @s TimeLib.Internal.TotalWorldTime
function #timelib:game_unpaused
scoreboard players reset #TimeLib.PausedTicks

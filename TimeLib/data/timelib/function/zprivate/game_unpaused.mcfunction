# Adjust the "TicksSinceDaytimeChange" score to take the paused time into account
scoreboard players operation #TimeLib.TicksSinceDaytimeChange TimeLib += @s TimeLib.Internal.TotalWorldTime

# Run the '#timelib:game_unpaused' event
# (Important): The number of ticks the game has been paused for can be read in the '#TimeLib TimeLib.PausedTicks' score.
scoreboard players operation #TimeLib TimeLib.PausedTicks = @s TimeLib.Internal.TotalWorldTime
function #timelib:game_unpaused
scoreboard players reset #TimeLib TimeLib.PausedTicks

# Temporarily use the current command block time until it's overwritten once the next second starts
data modify storage timelib:zprivate cmd_block.Output set from block 29999983 1 29999983 LastOutput.text

data modify storage timelib:zprivate cmd_block.Time.Hour set string storage timelib:zprivate cmd_block.Output 1 3
data modify storage timelib:zprivate cmd_block.Time.Minute set string storage timelib:zprivate cmd_block.Output 4 6
data modify storage timelib:zprivate cmd_block.Time.Second set string storage timelib:zprivate cmd_block.Output 7 9

function timelib:zprivate/update/setup/set_cmd_block_time with storage timelib:zprivate cmd_block.Time
function timelib:zprivate/update/main

# Start 'tick_loop' where the player head data & command block time are checked until ready
schedule function timelib:zprivate/update/setup/tick_loop 1t

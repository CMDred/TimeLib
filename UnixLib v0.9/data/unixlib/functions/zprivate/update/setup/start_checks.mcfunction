#Temporarily use the current command block time until it's overwritten once the next second starts
data modify storage unixlib:cmd_block Output set from block 29999983 1 29999983 LastOutput

data modify storage unixlib:cmd_block Time.Hour set string storage unixlib:cmd_block Output 10 12
data modify storage unixlib:cmd_block Time.Minute set string storage unixlib:cmd_block Output 13 15
data modify storage unixlib:cmd_block Time.Second set string storage unixlib:cmd_block Output 16 18

function unixlib:zprivate/update/setup/set_cmd_block_time with storage unixlib:cmd_block Time
function unixlib:zprivate/update/main

#Start 'tick_loop' where the player head data & command block time are checked until ready
schedule function unixlib:zprivate/update/setup/tick_loop 1t
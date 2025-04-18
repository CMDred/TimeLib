# Decode the Base64 (Credits to BananaRedPanda)
data modify storage timelib:zprivate Base64.Input.0 set string storage timelib:zprivate Base64.Value 24 28
data modify storage timelib:zprivate Base64.Input.1 set string storage timelib:zprivate Base64.Value 28 32
data modify storage timelib:zprivate Base64.Input.2 set string storage timelib:zprivate Base64.Value 32 36
data modify storage timelib:zprivate Base64.Input.3 set string storage timelib:zprivate Base64.Value 36 40
function timelib:zprivate/update_time/get_unix_timestamp/decode with storage timelib:zprivate Base64.Input

# Update the date & time
function timelib:zprivate/update_time/get_unix_timestamp/update

execute in minecraft:overworld run data modify storage timelib:zprivate CommandBlock.Output set from block 29999983 1 29999983 LastOutput.text
function timelib:zprivate/update_time/main

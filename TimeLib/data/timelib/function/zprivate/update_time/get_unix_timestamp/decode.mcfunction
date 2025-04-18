# Decode the Base64 value to get the stringified form of the unix timestamp
# (Important): The timestamp is scaled too high to fit in an integer, so I cut off the last 2 digits.
$data modify storage timelib:zprivate Base64.Out.0 set from storage timelib:zprivate Base64.Table.$(0)
$data modify storage timelib:zprivate Base64.Out.1 set from storage timelib:zprivate Base64.Table.$(1)
$data modify storage timelib:zprivate Base64.Out.2 set from storage timelib:zprivate Base64.Table.$(2)
$data modify storage timelib:zprivate Base64.Out.3 set string storage timelib:zprivate Base64.Table.$(3) 0 -2
function timelib:zprivate/update_time/get_unix_timestamp/set_score with storage timelib:zprivate Base64.Out

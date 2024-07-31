# Delay the update on reload until the command block is loaded
execute unless loaded 29999983 1 29999983 run return run schedule function timelib:zprivate/update/setup/reload_update 1t
function timelib:util/update

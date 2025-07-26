tellraw @a [{text:"🕒 TimeLib >> ",color:"#2DE1E1"},{text:"⚠ Multiple incompatible versions of TimeLib detected. Remove all but one and try again.",color:"red"}]
execute if score #TimeLib.VersionError load.status matches 1 run return fail

# In case it's run in load
scoreboard players set #TimeLib.VersionError load.status 1
scoreboard players reset #TimeLib.Version
schedule clear timelib:zprivate/tick

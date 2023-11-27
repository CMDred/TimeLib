$data modify storage timelib:zprivate b64.unix set value $(0)$(1)$(2)$(3)d
execute store result score #TimeLib TimeLib.UnixTime run data get storage timelib:zprivate b64.unix 0.01
scoreboard players operation #TimeLib.Previous TimeLib.UnixTime = #TimeLib TimeLib.UnixTime
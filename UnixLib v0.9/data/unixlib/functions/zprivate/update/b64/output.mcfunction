$data modify storage unixlib:b64 decode.unix set value $(0)$(1)$(2)$(3)d
execute store result score #UnixLib UnixLib_UnixTime run data get storage unixlib:b64 decode.unix 0.01
scoreboard players operation #UnixLib_Previous UnixLib_UnixTime = #UnixLib UnixLib_UnixTime
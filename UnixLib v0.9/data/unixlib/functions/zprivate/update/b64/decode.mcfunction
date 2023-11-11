$data modify storage unixlib:b64 decode.out.0 set from storage unixlib:b64 table[{b:$(0)}].s
$data modify storage unixlib:b64 decode.out.1 set from storage unixlib:b64 table[{b:$(1)}].s
$data modify storage unixlib:b64 decode.out.2 set from storage unixlib:b64 table[{b:$(2)}].s
$data modify storage unixlib:b64 decode.out.3 set from storage unixlib:b64 table[{b:$(3)}].s
function unixlib:zprivate/update/b64/output with storage unixlib:b64 decode.out
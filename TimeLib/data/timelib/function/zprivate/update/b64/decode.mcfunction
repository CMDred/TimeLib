$data modify storage timelib:zprivate b64.out.0 set from storage timelib:zprivate b64.table[{b:$(0)}].s
$data modify storage timelib:zprivate b64.out.1 set from storage timelib:zprivate b64.table[{b:$(1)}].s
$data modify storage timelib:zprivate b64.out.2 set from storage timelib:zprivate b64.table[{b:$(2)}].s
$data modify storage timelib:zprivate b64.out.3 set from storage timelib:zprivate b64.table[{b:$(3)}].s
function timelib:zprivate/update/b64/output with storage timelib:zprivate b64.out
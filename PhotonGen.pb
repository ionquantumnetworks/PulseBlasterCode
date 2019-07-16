///////Time Constants///////////
$preptime = 750ns //1000 ns
$extracttime = 200ns //60ns
$offtime = 60 ns//100ns
$cooltime = 500ns
$pregatetime = 60 ns
$postgatetime = 60 ns
////////////////////////////////
///////Pulse Groups/////////////
$Cooling = 0n 0 + 1// + 2
$Prep = 0n 0 + 1
$off = 0x000000
$Extract = 0n 2 + 3
$gate = 0n 3
////////////////////////////////

alt:	$off, $offtime//, branch, cool
	$gate, $pregatetime
	$Extract, $extracttime
	$gate, $postgatetime
	$off, 300 ns //750ns
	0n 0 + 1, $cooltime, wait
	0n 0, $preptime, branch, alt

start:	$off, 60 ns
	0n 0 + 1, 50 ns, wait
	$Prep, $preptime
	$off, 50ns
	$Extract, $extracttime, branch, start //Branch returns us to start

cool:	0n 0 + 1 + 2, 1000s
	0n 0 + 1 + 2, 1000s, branch, cool
	
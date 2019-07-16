///////Time Constants///////////
$preptime = 500ns //1000 ns
$extracttime = 200ns //60ns
$offtime = 100ns
$cooltime = 500ns
////////////////////////////////
///////Pulse Groups/////////////
$Cooling = 0n 0 + 1// + 2
$Prep = 0n 0 + 1
$off = 0x000000
$Extract = 0n 2
////////////////////////////////

alt:	$off, $offtime//, wait//, branch, cool
	0n 2, $extracttime
	$off, $offtime
	0n 0, $preptime, branch, alt

start:	$off, 60 ns
	0n 0 + 1, 50 ns, wait
	$Prep, $preptime
	$off, 50ns
	$Extract, $extracttime, branch, start //Branch returns us to start

cool:	0n 0 + 1 + 2, 1000s
	0n 0 + 1 + 2, 1000s, branch, cool
	
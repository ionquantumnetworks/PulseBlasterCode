///////Time Constants///////////
$preptime = 500ns //750ns //1000 ns
$extracttime = 200ns //60ns
$offtime = 60 ns//100ns
$cooltime = 245 ns//500ns
$pregatetime = 60 ns //time to add in before detector gates
$postgatetime = 240 ns //time to add in after detector gates
$gatetime = 100 ns
///////Pulse Groups/////////////
/// 0: 493 pi 1: 650 pi and sigmaprep 2: 650 sigma extract 5: 614////
$Cooling = 0n 0 + 1 + 2 + 5
$Prep = 0n 0 + 1
$Off = 0x000000
$Extract = 0n 2 
$GateAPD = 0n 3
$GatePMT = On 4
$GateBoth = On 3 + 4
////////////////////////////////
start:	$Off, $offtime
	$Cooling, $cooltime
	$Off, $offtime
	$Prep, $pretime
	$Off, $offtime
	$Extract, $extracttime
	//$GateBoth, $gatetime
	$GateAPD, $gatetime
	$GatePMT, $gatetime, branch, start //Branch returns us to start
	
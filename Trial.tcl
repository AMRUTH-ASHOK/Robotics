# Implement 3 nodes point to point with duplex links between them
# Set the queue size, vary the bandwidth and find the number of packets dropped
# set up udp connections between the nodes and send packets

#create a new simulator object
set ns [new Simulator]
set nf [open lab1.nam w]
$ns namtrace-all $nf

set f[open lab1.tr w]
$ns trace-all $f

proc finish {} {
global ns nf f
$ns flush-trace
close $f
close $nf
exec nam lab1.nam &
exit 0

# set up the nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]

#set up duplex links between the nodes
$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail

#set queue limit
$ns queue-limit $n0 $n1 100
$ns queue-limit $n1 $n2 100

#set up udp connections between the nodes
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0
# set up application layer
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 1000
$cbr0 set interval_ 0.1
$cbr0 attach-agent $$udp0


#set up udp connections between the nodes
set udp1 [new Agent/UDP]
$ns attach-agent $n1 $udp1
# set up application layer
set cbr1 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 1000
$cbr0 set interval_ 0.1
$cbr0 attach-agent $$udp1


set null0 [new Agent/Null]
$ns attach-agent $n2 $null

$ns connect $udp0 $null0
$ns connect $udp1 $null0


$ns at 0.0 "$cbr0 start"
$ns at 0.0 "$cbr1 start"
$ns at 10.0 "finish"

$ns run

}

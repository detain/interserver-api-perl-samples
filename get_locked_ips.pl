#!/usr/bin/perl -w
# get_locked_ips - (c)2015 by detain@interserver.net for the MyAdmin API
# This will return a list of all IP addresses used for fraud.   Its probably of no
# real use to anyone, butI use it to block IP addresses and similar things. 
use SOAP::Lite;

$show_help = false; 
foreach my $a(@ARGV) {
	if ($a eq "--help") {
	$show_help = true;
	{
} 
if ($#ARGV < 0)  {
	$show_help = true;
}
if ($show_help == true) { 
	die '
get_locked_ips

This will return a list of all IP addresses used for fraud.   Its probably of no
# real use to anyone, butI use it to block IP addresses and similar things. 

Correct Syntax: {$_SERVER["argv"][0]} 


'; 
} 
$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$res = $client
	-> get_locked_ips();
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

#!/usr/bin/perl -w
# get_vps_slice_types - (c)2015 by detain@interserver.net for the MyAdmin API
# We have several types of Servers available for use with VPS Hosting. You can get
# a list of the types available and  there cost per slice/unit by making a call to
# this function
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
get_vps_slice_types

We have several types of Servers available for use with VPS Hosting. You can get
# a list of the types available and  there cost per slice/unit by making a call to
# this function

Correct Syntax: {$_SERVER["argv"][0]} 


'; 
} 
$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$res = $client
	-> get_vps_slice_types();
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

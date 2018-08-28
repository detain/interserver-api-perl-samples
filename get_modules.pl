#!/usr/bin/perl -w
# get_modules - (c)2015 by detain@interserver.net for the MyAdmin API
# Returns a list of all the modules available.
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
get_modules

Returns a list of all the modules available.

Correct Syntax: {$_SERVER["argv"][0]} 


'; 
} 
$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$res = $client
	-> get_modules();
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

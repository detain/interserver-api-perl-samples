#!/usr/bin/perl -w
# api_get_license_types - (c)2015 by detain@interserver.net for the MyAdmin API
# Get a license of the various license types.
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
api_get_license_types

Get a license of the various license types.

Correct Syntax: {$_SERVER["argv"][0]} 


'; 
} 
$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$res = $client
	-> api_get_license_types();
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

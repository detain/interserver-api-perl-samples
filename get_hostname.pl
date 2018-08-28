#!/usr/bin/perl -w
# get_hostname - (c)2015 by detain@interserver.net for the MyAdmin API
# Resolves an IP Address and returns the hostname it points to.
# @param ip string 
use SOAP::Lite;

$ip = $ARGV[0];
$show_help = false; 
foreach my $a(@ARGV) {
	if ($a eq "--help") {
	$show_help = true;
	{
} 
if ($#ARGV < 1)  {
	$show_help = true;
}
if ($show_help == true) { 
	die '
get_hostname

Resolves an IP Address and returns the hostname it points to.

Correct Syntax: {$_SERVER["argv"][0]}  <ip>

  <ip>  Must be a string

'; 
} 
$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$res = $client
	-> get_hostname($ip);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

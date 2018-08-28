#!/usr/bin/perl -w
# api_get_prepay_remaining - (c)2015 by detain@interserver.net for the MyAdmin API
# Get the PrePay amount available for a given module.
# @param sid string the *Session ID* you get from the [login](#login) call
# @param module string the module you want to check your prepay amounts on
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$module = $ARGV[2];
$show_help = false; 
foreach my $a(@ARGV) {
	if ($a eq "--help") {
	$show_help = true;
	{
} 
if ($#ARGV < 3)  {
	$show_help = true;
}
if ($show_help == true) { 
	die '
api_get_prepay_remaining

Get the PrePay amount available for a given module.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <module>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <module>  Must be a string

'; 
} 
$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$sid = $client
	-> api_login($username, $password)
	-> result;
if (length($sid) == 0)  {
	die "Got A Blank Session";
} 
$res = $client
	-> api_get_prepay_remaining($sid, $module);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

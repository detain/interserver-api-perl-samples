#!/usr/bin/perl -w
# api_change_license_ip - (c)2015 by detain@interserver.net for the MyAdmin API
# Change the IP on an active license.
# @param sid string the *Session ID* you get from the [login](#login) call
# @param oldip string the old ip address
# @param newip string the new ip address
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$oldip = $ARGV[2];
$newip = $ARGV[3];
$show_help = false; 
foreach my $a(@ARGV) {
	if ($a eq "--help") {
	$show_help = true;
	{
} 
if ($#ARGV < 4)  {
	$show_help = true;
}
if ($show_help == true) { 
	die '
api_change_license_ip

Change the IP on an active license.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <oldip> <newip>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <oldip>  Must be a string
  <newip>  Must be a string

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
	-> api_change_license_ip($sid, $oldip, $newip);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

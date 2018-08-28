#!/usr/bin/perl -w
# api_cancel_license_ip - (c)2015 by detain@interserver.net for the MyAdmin API
# Cancel a License by IP and Type.
# @param sid string the *Session ID* you get from the [login](#login) call
# @param ip string IP Address to cancel
# @param type int Package ID. use [get_license_types](#get-license-types) to get a list of possible types.
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$ip = $ARGV[2];
$type = $ARGV[3];
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
api_cancel_license_ip

Cancel a License by IP and Type.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <ip> <type>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <ip>  Must be a string
  <type>  Must be a int

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
	-> api_cancel_license_ip($sid, $ip, $type);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

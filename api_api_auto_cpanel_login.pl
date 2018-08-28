#!/usr/bin/perl -w
# api_api_auto_cpanel_login - (c)2015 by detain@interserver.net for the MyAdmin API
# Logs into cpanel for the given website id and returns a unique logged-in url. 
# The status will be "ok" if successful, or "error" if there was any problems
# status_text will contain a description of the problem if any.
# @param sid string the *Session ID* you get from the [login](#login) call
# @param id int id of website
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$id = $ARGV[2];
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
api_api_auto_cpanel_login

Logs into cpanel for the given website id and returns a unique logged-in url. 
# The status will be "ok" if successful, or "error" if there was any problems
# status_text will contain a description of the problem if any.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <id>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <id>  Must be a int

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
	-> api_api_auto_cpanel_login($sid, $id);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

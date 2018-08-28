#!/usr/bin/perl -w
# api_login - (c)2015 by detain@interserver.net for the MyAdmin API
# This function creates a session in our system which you will need to pass to
# most functions for authentication.
# @param username string the username (email address) you signed up with.
# @param password string the password you use to login to the web account, or alternatively the API key.
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$show_help = false; 
foreach my $a(@ARGV) {
	if ($a eq "--help") {
	$show_help = true;
	{
} 
if ($#ARGV < 2)  {
	$show_help = true;
}
if ($show_help == true) { 
	die '
api_login

This function creates a session in our system which you will need to pass to
# most functions for authentication.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password>

  <username>  Must be a string
  <password>  Must be a string

'; 
} 
$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$res = $client
	-> api_login($username, $password);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

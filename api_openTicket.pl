#!/usr/bin/perl -w
# api_openTicket - (c)2015 by detain@interserver.net for the MyAdmin API
# This command creates a new ticket in our system.
# @param sid string the *Session ID* you get from the [login](#login) call
# @param user_email string client email address
# @param user_ip string client ip address
# @param subject string subject of the ticket
# @param product string the product/service if any this is in reference to.
# @param body string full content/description for the ticket
# @param box_auth_value string encryption string?
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$user_email = $ARGV[2];
$user_ip = $ARGV[3];
$subject = $ARGV[4];
$product = $ARGV[5];
$body = $ARGV[6];
$box_auth_value = $ARGV[7];
$show_help = false; 
foreach my $a(@ARGV) {
	if ($a eq "--help") {
	$show_help = true;
	{
} 
if ($#ARGV < 8)  {
	$show_help = true;
}
if ($show_help == true) { 
	die '
api_openTicket

This command creates a new ticket in our system.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <user_email> <user_ip> <subject> <product> <body> <box_auth_value>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <user_email>  Must be a string
  <user_ip>  Must be a string
  <subject>  Must be a string
  <product>  Must be a string
  <body>  Must be a string
  <box_auth_value>  Must be a string

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
	-> api_openTicket($sid, $user_email, $user_ip, $subject, $product, $body, $box_auth_value);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

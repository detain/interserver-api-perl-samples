#!/usr/bin/perl -w
# api_viewTicket - (c)2015 by detain@interserver.net for the MyAdmin API
# View/Retrieve information about the given ticketID.
# @param sid string the *Session ID* you get from the [login](#login) call
# @param ticketID string the id of the ticket to retrieve. you can use [getTicketList](#getticketlist) to get a list of your tickets
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$ticketID = $ARGV[2];
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
api_viewTicket

View/Retrieve information about the given ticketID.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <ticketID>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <ticketID>  Must be a string

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
	-> api_viewTicket($sid, $ticketID);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

#!/usr/bin/perl -w
# api_ticketPost - (c)2015 by detain@interserver.net for the MyAdmin API
# This commands adds the content parameter as a response/reply to an existing
# ticket specified by ticketID.
# @param sid string the *Session ID* you get from the [login](#login) call
# @param ticketID string the id of the ticket to add a response to. you can use [getTicketList](#getticketlist) to get a list of your tickets
# @param content string the message to add to the ticket
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$ticketID = $ARGV[2];
$content = $ARGV[3];
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
api_ticketPost

This commands adds the content parameter as a response/reply to an existing
# ticket specified by ticketID.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <ticketID> <content>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <ticketID>  Must be a string
  <content>  Must be a string

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
	-> api_ticketPost($sid, $ticketID, $content);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

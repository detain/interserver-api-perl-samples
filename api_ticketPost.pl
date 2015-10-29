#!/usr/bin/perl -w
#
# api_ticketPost
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This commands adds the content parameter as a response/reply to an existing
# ticket specified by ticketID.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param ticketID string the id of the ticket to add a response to. you can use [api_getTicketList](#api_getTicketList) to get a list of your tickets 
# @param content string the message to add to the ticket
#
use SOAP::Lite;

$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$sid = $client
	-> api_login(argv[1], argv[2])
	-> result;
if (strlen($sid)  == 0)
	die "Got A Blank Sessoion";
echo "Got Session ID "+$sid+"\n";
	
$response = $client->api_ticketPost();
print $response;
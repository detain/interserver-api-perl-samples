#!/usr/bin/perl -w
#
# api_getTicketList
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Returns a list of any tickets in the system.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param page int page number of tickets to list
# @param limit int how many tickets to show per page
# @param status string null for no status limi t or limit to a speicifc status
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
	
$response = $client->api_getTicketList();
print $response;
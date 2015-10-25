#!/usr/bin/perl -w
#
# api_get_ima
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Returns the IMA value.  This function tells you that I'm a client, or I'm a
# admin. This is almost always going to return client, Adminsitrators will get an
# admin response.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
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
	
$response = $client->api_get_ima();
print $response;
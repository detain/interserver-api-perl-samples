#!/usr/bin/perl -w
#
# api_get_dns_domain
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Gets the DNS entry for a given Domain ID
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param domain_id int The ID of the domain in question.
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
	
$response = $client->api_get_dns_domain();
print $response;
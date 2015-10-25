#!/usr/bin/perl -w
#
# api_change_license_ip_by_id
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Change the IP on an active license.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int the license order id of the license to change the ip for
# @param newip string the new ip address to associate with the license
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
	
$response = $client->api_change_license_ip_by_id();
print $response;
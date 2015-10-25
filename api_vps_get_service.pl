#!/usr/bin/perl -w
#
# api_vps_get_service
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This Function Applies to the VPS services.
# Gets service info for the given ID in the given Module.   An example of this
# would be in the "vps" modulei have order id
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int service id, such as VPS ID
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
	
$response = $client->api_vps_get_service();
print $response;
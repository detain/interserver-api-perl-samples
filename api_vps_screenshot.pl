#!/usr/bin/perl -w
#
# api_vps_screenshot
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This command returns a link to an animated screenshot of your VPS.   Only works
# currently with KVM VPS servers
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int false to link to the image itself , otherwise a url
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
	
$response = $client->api_vps_screenshot();
print $response;
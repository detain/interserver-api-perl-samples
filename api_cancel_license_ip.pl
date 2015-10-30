#!/usr/bin/perl -w
#
# api_cancel_license_ip
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Cancel a License by IP and Type.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param ip string IP Address to cancel
# @param type int Package ID. use [api_get_license_types](#api_get_license_types) to get a list of possible types.
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
  
$response = $client->api_cancel_license_ip();
print $response;
#!/usr/bin/perl -w
#
# api_vps_get_server_name
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Get the name of the vps master/host server your giving the id for
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int id of the vps master
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
  
$response = $client->api_vps_get_server_name();
print $response;
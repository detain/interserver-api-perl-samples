#!/usr/bin/perl -w
#
# api_domains_get_services
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This Function Applies to the Domain Registrations services.
# Gets List of Services
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
  
$response = $client->api_domains_get_services();
print $response;
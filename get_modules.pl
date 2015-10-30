#!/usr/bin/perl -w
#
# get_modules
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Returns a list of all the modules available.
#
#
use SOAP::Lite;

$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
  
$response = $client->get_modules();
print $response;
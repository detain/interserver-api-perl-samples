#!/usr/bin/perl -w
#
# api_get_license_types
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Get a license of the various license types.
#
#
use SOAP::Lite;

$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
	
$response = $client->api_get_license_types();
print $response;
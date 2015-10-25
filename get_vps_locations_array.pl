#!/usr/bin/perl -w
#
# get_vps_locations_array
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Use this function to get a list of the Locations available for ordering. The id
# field in the return value is also needed to pass to the buy_vps functions.
#
#
use SOAP::Lite;

$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
	
$response = $client->get_vps_locations_array();
print $response;
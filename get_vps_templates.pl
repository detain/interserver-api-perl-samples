#!/usr/bin/perl -w
#
# get_vps_templates
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Get the currently available VPS templates for each server type.
#
#
use SOAP::Lite;

$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
	
$response = $client->get_vps_templates();
print $response;
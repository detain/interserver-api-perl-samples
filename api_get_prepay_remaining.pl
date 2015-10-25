#!/usr/bin/perl -w
#
# api_get_prepay_remaining
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Get the PrePay amount available for a given module.
#
# @param module string the module you want to check your prepay amounts on
#
use SOAP::Lite;

$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
	
$response = $client->api_get_prepay_remaining();
print $response;
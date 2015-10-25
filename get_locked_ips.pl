#!/usr/bin/perl -w
#
# get_locked_ips
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This will return a list of all IP addresses used for fraud.   Its probably of no
# real use to anyone, butI use it to block IP addresses and similar things. 
#
#
use SOAP::Lite;

$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
	
$response = $client->get_locked_ips();
print $response;
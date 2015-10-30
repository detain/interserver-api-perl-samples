#!/usr/bin/perl -w
#
# get_hostname
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Resolves an IP Address and returns the hostname it points to.
#
# @param ip string IP Address
#
use SOAP::Lite;

$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
  
$response = $client->get_hostname();
print $response;
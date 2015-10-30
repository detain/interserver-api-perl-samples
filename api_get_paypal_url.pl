#!/usr/bin/perl -w
#
# api_get_paypal_url
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Get the PayPal payment URL for an invoice on a given module.
#
# @param module string the module the invoice is for. use [get_modules](#get_modules) to get a list of modules
# @param invoice int the invoice id, or a comma seperated list of invoice ids to get a payment url for.  
#
use SOAP::Lite;

$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
  
$response = $client->api_get_paypal_url();
print $response;
#!/usr/bin/perl -w
#
# api_make_payment
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Makes a payment for an invoice on a module.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param module string the module of the service being paid on
# @param invoice int the invoice id you want to make a payment on
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
  
$response = $client->api_make_payment();
print $response;
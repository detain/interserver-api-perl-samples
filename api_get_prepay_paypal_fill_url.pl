#!/usr/bin/perl -w
#
# api_get_prepay_paypal_fill_url
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Gets a PayPal URL to fill a PrePay.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param module string the module the prepay is for. use [get_modules](#get_modules) to get a list of modules
# @param prepay_id int the ID of the PrePay
# @param amount float the amount to pay on the prepay.
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
  
$response = $client->api_get_prepay_paypal_fill_url();
print $response;
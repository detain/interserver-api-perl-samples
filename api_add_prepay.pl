#!/usr/bin/perl -w
#
# api_add_prepay
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Adds a PrePay into the system under the given module.    PrePays are a credit on
# your account by prefilling  your account with funds.   These are stored in a
# PrePay.    PrePay funds can be automaticaly used as needed or set to only be
# usable by direct action
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param module string the module the prepay is for
# @param amount float the dollar amount of prepay total
# @param automatic_use bool wether or not the prepay will get used automatically by billing system.
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
	
$response = $client->api_add_prepay();
print $response;
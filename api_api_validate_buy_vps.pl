#!/usr/bin/perl -w
#
# api_api_validate_buy_vps
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Checks if the parameters for your order pass validation and let you know if
# there are any errors. It will also give you information on the pricing
# breakdown.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param os string 
# @param slices int 
# @param platform string 
# @param controlpanel string 
# @param period int 
# @param location int 
# @param version string 
# @param hostname string 
# @param coupon string 
# @param rootpass string 
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
	
$response = $client->api_api_validate_buy_vps();
print $response;
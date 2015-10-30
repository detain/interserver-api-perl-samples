#!/usr/bin/perl -w
#
# api_buy_license
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Purchase a License.  Returns an invoice ID.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param ip string ip address you wish to license some software on
# @param type int the package id of the license type you want. use [api_get_license_types](#api_get_license_types) to get a list of possible types.
# @param coupon string an optional coupon
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
  
$response = $client->api_buy_license();
print $response;
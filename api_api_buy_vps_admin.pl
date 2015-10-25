#!/usr/bin/perl -w
#
# api_api_buy_vps_admin
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Purchase a VPS (admins only).   Returns a comma seperated list of invoices if
# any need paid.  Same as client function but allows specifying which server to
# install to if there are resources available on the specified server.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param os string 
# @param slices int 
# @param platform string 
# @param controlpanel string 
# @param period int 
# @param location int 
# @param version int 
# @param hostname string 
# @param coupon string 
# @param rootpass string 
# @param server int 
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
	
$response = $client->api_api_buy_vps_admin();
print $response;
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
# @param os string file field from [get_vps_templates](#get_vps_templates)
# @param slices int 1 to 16 specifying the scale of the VPS resources you want (a 3 slice has 3x the resources of a 1 slice vps)
# @param platform string platform field from the [get_vps_platforms_array](#get_vps_platforms_array)
# @param controlpanel string none, cpanel, or da for None, cPanel, or DirectAdmin control panel addons, only availbale with CentOS
# @param period int 1-36, How frequently to be billed in months. Some discounts as given based on the period
# @param location int id field from the [get_vps_locations_array](#get_vps_locations_array)
# @param version int os field from [get_vps_templates](#get_vps_templates)
# @param hostname string Desired Hostname for the VPS
# @param coupon string Optional Coupon to pass
# @param rootpass string Desired Root Password (unused for windows, send a blank string)
# @param server int 0 for auto assign otherwise the id of the vps master to put this on
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
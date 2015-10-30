#!/usr/bin/perl -w
# api_api_buy_vps_admin - (c)2015 by detain@interserver.net for the MyAdmin API
# Purchase a VPS (admins only).   Returns a comma seperated list of invoices if
# any need paid.  Same as client function but allows specifying which server to
# install to if there are resources available on the specified server.
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
use SOAP::Lite;

username = argv[1];
password = argv[2];
os = argv[3];
slices = argv[4];
platform = argv[5];
controlpanel = argv[6];
period = argv[7];
location = argv[8];
version = argv[9];
hostname = argv[10];
coupon = argv[11];
rootpass = argv[12];
server = argv[13];
show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  show_help = true;
  break;
} 
if (argc < 14)
  show_help = true;
if (show_help == true)
  exit(<<<EOF
api_api_buy_vps_admin

Purchase a VPS (admins only).   Returns a comma seperated list of invoices if
# any need paid.  Same as client function but allows specifying which server to
# install to if there are resources available on the specified server.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <os> <slices> <platform> <controlpanel> <period> <location> <version> <hostname> <coupon> <rootpass> <server>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <os>  Must be a string
  <slices>  Must be a int
  <platform>  Must be a string
  <controlpanel>  Must be a string
  <period>  Must be a int
  <location>  Must be a int
  <version>  Must be a int
  <hostname>  Must be a string
  <coupon>  Must be a string
  <rootpass>  Must be a string
  <server>  Must be a int

EOF
); 
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
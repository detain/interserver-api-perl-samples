#!/usr/bin/perl -w
# api_api_validate_buy_vps - (c)2015 by detain@interserver.net for the MyAdmin API
# Checks if the parameters for your order pass validation and let you know if
# there are any errors. It will also give you information on the pricing
# breakdown.
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param os string file field from [get_vps_templates](#get_vps_templates)
# @param slices int 1 to 16 specifying the scale of the VPS resources you want (a 3 slice has 3x the resources of a 1 slice vps)
# @param platform string platform field from the [get_vps_platforms_array](#get_vps_platforms_array)
# @param controlpanel string none, cpanel, or da for None, cPanel, or DirectAdmin control panel addons, only availbale with CentOS
# @param period int 1-36, How frequently to be billed in months. Some discounts as given based on the period
# @param location int id field from the [get_vps_locations_array](#get_vps_locations_array)
# @param version string os field from [get_vps_templates](#get_vps_templates)
# @param hostname string Desired Hostname for the VPS
# @param coupon string Optional Coupon to pass
# @param rootpass string Desired Root Password (unused for windows, send a blank string)
use SOAP::Lite;

ההה$username = $ARGV[1];
$password = $ARGV[2];
$os = $ARGV[3];
$slices = $ARGV[4];
$platform = $ARGV[5];
$controlpanel = $ARGV[6];
$period = $ARGV[7];
$location = $ARGV[8];
$version = $ARGV[9];
$hostname = $ARGV[10];
$coupon = $ARGV[11];
$rootpass = $ARGV[12];
$show_help = false; 
foreach my $a(@ARGV) {
  if ($a eq "--help") {
    $show_help = true;
  {
} 
if ($#ARGV < 13)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
api_api_validate_buy_vps

Checks if the parameters for your order pass validation and let you know if
# there are any errors. It will also give you information on the pricing
# breakdown.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <os> <slices> <platform> <controlpanel> <period> <location> <version> <hostname> <coupon> <rootpass>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <os>  Must be a string
  <slices>  Must be a int
  <platform>  Must be a string
  <controlpanel>  Must be a string
  <period>  Must be a int
  <location>  Must be a int
  <version>  Must be a string
  <hostname>  Must be a string
  <coupon>  Must be a string
  <rootpass>  Must be a string

EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
$sid = $client
  -> api_login($username, $password)
  -> result;
if (strlen($sid)  == 0)
  die "Got A Blank Sessoion";
$res = $client
  -> api_api_validate_buy_vps($sid, $os, $slices, $platform, $controlpanel, $period, $location, $version, $hostname, $coupon, $rootpass);
print $res;
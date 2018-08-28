#!/usr/bin/perl -w
# api_api_validate_buy_vps - (c)2015 by detain@interserver.net for the MyAdmin API
# Checks if the parameters for your order pass validation and let you know if
# there are any errors. It will also give you information on the pricing
# breakdown.
# @param sid string the *Session ID* you get from the [login](#login) call
# @param os string file field from [get_vps_templates](#get_vps_templates)
# @param slices int 1 to 16 specifying the scale of the VPS resources you want (a 3 slice has 3x the resources of a 1 slice vps)
# @param platform string platform field from the [get_vps_platforms_array](#get_vps_platforms_array)
# @param controlpanel string none, cpanel, or da for None, cPanel, or DirectAdmin control panel addons, only available with CentOS
# @param period int 1-36, How frequently to be billed in months. Some discounts as given based on the period
# @param location int id field from the [get_vps_locations_array](#get_vps_locations_array)
# @param version string os field from [get_vps_templates](#get_vps_templates)
# @param hostname string Desired Hostname for the VPS
# @param coupon string Optional Coupon to pass
# @param rootpass string Desired Root Password (unused for windows, send a blank string)
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$os = $ARGV[2];
$slices = $ARGV[3];
$platform = $ARGV[4];
$controlpanel = $ARGV[5];
$period = $ARGV[6];
$location = $ARGV[7];
$version = $ARGV[8];
$hostname = $ARGV[9];
$coupon = $ARGV[10];
$rootpass = $ARGV[11];
$show_help = false; 
foreach my $a(@ARGV) {
	if ($a eq "--help") {
	$show_help = true;
	{
} 
if ($#ARGV < 12)  {
	$show_help = true;
}
if ($show_help == true) { 
	die '
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

'; 
} 
$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$sid = $client
	-> api_login($username, $password)
	-> result;
if (length($sid) == 0)  {
	die "Got A Blank Session";
} 
$res = $client
	-> api_api_validate_buy_vps($sid, $os, $slices, $platform, $controlpanel, $period, $location, $version, $hostname, $coupon, $rootpass);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

#!/usr/bin/perl -w
# api_buy_license - (c)2015 by detain@interserver.net for the MyAdmin API
# Purchase a License.  Returns an invoice ID.
# @param sid string the *Session ID* you get from the [login](#login) call
# @param ip string ip address you wish to license some software on
# @param type int the package id of the license type you want. use [get_license_types](#get-license-types) to get a list of possible types.
# @param coupon string an optional coupon
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$ip = $ARGV[2];
$type = $ARGV[3];
$coupon = $ARGV[4];
$show_help = false; 
foreach my $a(@ARGV) {
	if ($a eq "--help") {
	$show_help = true;
	{
} 
if ($#ARGV < 5)  {
	$show_help = true;
}
if ($show_help == true) { 
	die '
api_buy_license

Purchase a License.  Returns an invoice ID.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <ip> <type> <coupon>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <ip>  Must be a string
  <type>  Must be a int
  <coupon>  Must be a string

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
	-> api_buy_license($sid, $ip, $type, $coupon);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

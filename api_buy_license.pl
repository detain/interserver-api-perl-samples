#!/usr/bin/perl -w
# api_buy_license - (c)2015 by detain@interserver.net for the MyAdmin API
# Purchase a License.  Returns an invoice ID.
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param ip string ip address you wish to license some software on
# @param type int the package id of the license type you want. use [api_get_license_types](#api_get_license_types) to get a list of possible types.
# @param coupon string an optional coupon
use SOAP::Lite;

$username = argv[1];
$password = argv[2];
$ip = argv[3];
$type = argv[4];
$coupon = argv[5];
$show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  $show_help = true;
  break;
} 
if (argc < 6)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
api_buy_license

Purchase a License.  Returns an invoice ID.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <ip> <type> <coupon>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <ip>  Must be a string
  <type>  Must be a int
  <coupon>  Must be a string

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
  -> api_buy_license($sid, $ip, $type, $coupon);
print $res;
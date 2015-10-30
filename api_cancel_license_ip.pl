#!/usr/bin/perl -w
# api_cancel_license_ip - (c)2015 by detain@interserver.net for the MyAdmin API
# Cancel a License by IP and Type.
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param ip string IP Address to cancel
# @param type int Package ID. use [api_get_license_types](#api_get_license_types) to get a list of possible types.
use SOAP::Lite;

$username = argv[1];
$password = argv[2];
$ip = argv[3];
$type = argv[4];
$show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  $show_help = true;
  break;
} 
if (argc < 5)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
api_cancel_license_ip

Cancel a License by IP and Type.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <ip> <type>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <ip>  Must be a string
  <type>  Must be a int

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
  -> api_cancel_license_ip($sid, $ip, $type);
print $res;
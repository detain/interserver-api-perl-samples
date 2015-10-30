#!/usr/bin/perl -w
# api_change_license_ip - (c)2015 by detain@interserver.net for the MyAdmin API
# Change the IP on an active license.
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param oldip string the old ip address
# @param newip string the new ip address
use SOAP::Lite;

$username = argv[1];
$password = argv[2];
$oldip = argv[3];
$newip = argv[4];
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
api_change_license_ip

Change the IP on an active license.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <oldip> <newip>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <oldip>  Must be a string
  <newip>  Must be a string

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
  
$response = $client->api_change_license_ip($sid, $oldip, $newip);
print $response;
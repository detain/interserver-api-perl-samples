#!/usr/bin/perl -w
# api_get_prepay_list - (c)2015 by detain@interserver.net for the MyAdmin API
# Gets a list of your current prepays added into the system and how much is left
# on each one.
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
use SOAP::Lite;

$username = argv[1];
$password = argv[2];
$show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  $show_help = true;
  break;
} 
if (argc < 3)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
api_get_prepay_list

Gets a list of your current prepays added into the system and how much is left
# on each one.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site

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
  
$response = $client->api_get_prepay_list($sid);
print $response;
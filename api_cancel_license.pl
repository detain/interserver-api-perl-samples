#!/usr/bin/perl -w
# api_cancel_license - (c)2015 by detain@interserver.net for the MyAdmin API
# Cancel a License.
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int License Order ID
use SOAP::Lite;

username = argv[1];
password = argv[2];
id = argv[3];
show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  show_help = true;
  break;
} 
if (argc < 4)
  show_help = true;
if (show_help == true)
  exit(<<<EOF
api_cancel_license

Cancel a License.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <id>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <id>  Must be a int

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
  
$response = $client->api_cancel_license();
print $response;
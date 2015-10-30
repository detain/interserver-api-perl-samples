#!/usr/bin/perl -w
# api_vps_queue_restart - (c)2015 by detain@interserver.net for the MyAdmin API
# restart a vps
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int defaults to false, if specifeid tries usign that di instead of the one passed
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
api_vps_queue_restart

restart a vps

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
  
$response = $client->api_vps_queue_restart();
print $response;
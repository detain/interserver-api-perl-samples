#!/usr/bin/perl -w
# api_getTicketList - (c)2015 by detain@interserver.net for the MyAdmin API
# Returns a list of any tickets in the system.
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param page int page number of tickets to list
# @param limit int how many tickets to show per page
# @param status string null for no status limi t or limit to a speicifc status
use SOAP::Lite;

$username = argv[1];
$password = argv[2];
$page = argv[3];
$limit = argv[4];
$status = argv[5];
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
api_getTicketList

Returns a list of any tickets in the system.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <page> <limit> <status>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <page>  Must be a int
  <limit>  Must be a int
  <status>  Must be a string

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
  
$response = $client->api_getTicketList($sid, $page, $limit, $status);
print $response;
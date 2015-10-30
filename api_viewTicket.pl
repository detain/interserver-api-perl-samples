#!/usr/bin/perl -w
# api_viewTicket - (c)2015 by detain@interserver.net for the MyAdmin API
# View/Retrieve information about the given ticketID.
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param ticketID string the id of the ticket to retrieve. you can use [api_getTicketList](#api_getTicketList) to get a list of your tickets
use SOAP::Lite;

$username = argv[1];
$password = argv[2];
$ticketID = argv[3];
$show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  $show_help = true;
  break;
} 
if (argc < 4)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
api_viewTicket

View/Retrieve information about the given ticketID.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <ticketID>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <ticketID>  Must be a string

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
  -> api_viewTicket($sid, $ticketID);
print $res;
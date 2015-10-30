#!/usr/bin/perl -w
# api_openTicket - (c)2015 by detain@interserver.net for the MyAdmin API
# This command creates a new ticket in our system.  
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param user_email string client email address
# @param user_ip string client ip address
# @param subject string subject of the ticket
# @param product string the product/service if any this is in reference to.  
# @param body string full content/description for the ticket
# @param box_auth_value string encryption string?
use SOAP::Lite;

username = argv[1];
password = argv[2];
user_email = argv[3];
user_ip = argv[4];
subject = argv[5];
product = argv[6];
body = argv[7];
box_auth_value = argv[8];
show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  show_help = true;
  break;
} 
if (argc < 9)
  show_help = true;
if (show_help == true)
  exit(<<<EOF
api_openTicket

This command creates a new ticket in our system.  

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <user_email> <user_ip> <subject> <product> <body> <box_auth_value>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <user_email>  Must be a string
  <user_ip>  Must be a string
  <subject>  Must be a string
  <product>  Must be a string
  <body>  Must be a string
  <box_auth_value>  Must be a string

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
  
$response = $client->api_openTicket();
print $response;
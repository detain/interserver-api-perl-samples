#!/usr/bin/perl -w
# api_delete_dns_record - (c)2015 by detain@interserver.net for the MyAdmin API
# Deletes a single DNS record
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param domain_id int The ID of the domain in question.
# @param record_id int The ID of the domains record to remove.
use SOAP::Lite;

$username = argv[1];
$password = argv[2];
$domain_id = argv[3];
$record_id = argv[4];
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
api_delete_dns_record

Deletes a single DNS record

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <domain_id> <record_id>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <domain_id>  Must be a int
  <record_id>  Must be a int

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
  
$response = $client->api_delete_dns_record($sid, $domain_id, $record_id);
print $response;
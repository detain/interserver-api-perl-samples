#!/usr/bin/perl -w
# api_add_dns_record - (c)2015 by detain@interserver.net for the MyAdmin API
# Adds a single DNS record
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param domain_id int The ID of the domain in question.
# @param name string the hostname being set on the dns record.
# @param content string the value of the dns record, or what its set to.
# @param type string dns record type.
# @param ttl int dns record time to live, or update time.
# @param prio int dns record priority
use SOAP::Lite;

$username = argv[1];
$password = argv[2];
$domain_id = argv[3];
$name = argv[4];
$content = argv[5];
$type = argv[6];
$ttl = argv[7];
$prio = argv[8];
$show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  $show_help = true;
  break;
} 
if (argc < 9)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
api_add_dns_record

Adds a single DNS record

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <domain_id> <name> <content> <type> <ttl> <prio>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <domain_id>  Must be a int
  <name>  Must be a string
  <content>  Must be a string
  <type>  Must be a string
  <ttl>  Must be a int
  <prio>  Must be a int

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
  
$response = $client->api_add_dns_record($sid, $domain_id, $name, $content, $type, $ttl, $prio);
print $response;
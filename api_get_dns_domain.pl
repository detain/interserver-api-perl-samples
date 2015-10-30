#!/usr/bin/perl -w
# api_get_dns_domain - (c)2015 by detain@interserver.net for the MyAdmin API
# Gets the DNS entry for a given Domain ID
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param domain_id int The ID of the domain in question.
use SOAP::Lite;

$username = argv[1];
$password = argv[2];
$domain_id = argv[3];
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
api_get_dns_domain

Gets the DNS entry for a given Domain ID

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <domain_id>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <domain_id>  Must be a int

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
  -> api_get_dns_domain($sid, $domain_id);
print $res;
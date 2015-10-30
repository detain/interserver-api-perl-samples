#!/usr/bin/perl -w
# get_hostname - (c)2015 by detain@interserver.net for the MyAdmin API
# Resolves an IP Address and returns the hostname it points to.
# @param ip string IP Address
use SOAP::Lite;

$ip = argv[1];
$show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  $show_help = true;
  break;
} 
if (argc < 2)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
get_hostname

Resolves an IP Address and returns the hostname it points to.

Correct Syntax: {$_SERVER["argv"][0]}  <ip>

  <ip>  Must be a string

EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
  
$response = $client->get_hostname($ip);
print $response;
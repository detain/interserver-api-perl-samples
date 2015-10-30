#!/usr/bin/perl -w
# get_locked_ips - (c)2015 by detain@interserver.net for the MyAdmin API
# This will return a list of all IP addresses used for fraud.   Its probably of no
# real use to anyone, butI use it to block IP addresses and similar things. 
use SOAP::Lite;

$show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  $show_help = true;
  break;
} 
if (argc < 1)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
get_locked_ips

This will return a list of all IP addresses used for fraud.   Its probably of no
# real use to anyone, butI use it to block IP addresses and similar things. 

Correct Syntax: {$_SERVER["argv"][0]} 


EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
  
$response = $client->get_locked_ips($);
print $response;
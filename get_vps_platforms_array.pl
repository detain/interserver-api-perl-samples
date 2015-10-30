#!/usr/bin/perl -w
# get_vps_platforms_array - (c)2015 by detain@interserver.net for the MyAdmin API
# Use this function to get a list of the various platforms available for ordering.
# The platform field in the return value is also needed to pass to the buy_vps
# functions.
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
get_vps_platforms_array

Use this function to get a list of the various platforms available for ordering.
# The platform field in the return value is also needed to pass to the buy_vps
# functions.

Correct Syntax: {$_SERVER["argv"][0]} 


EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
$res = $client
  -> get_vps_platforms_array($);
print $res;
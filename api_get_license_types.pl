#!/usr/bin/perl -w
# api_get_license_types - (c)2015 by detain@interserver.net for the MyAdmin API
# Get a license of the various license types.
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
api_get_license_types

Get a license of the various license types.

Correct Syntax: {$_SERVER["argv"][0]} 


EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
  
$res = $client
  -> api_get_license_types($);
print $res;
#!/usr/bin/perl -w
# get_vps_templates - (c)2015 by detain@interserver.net for the MyAdmin API
# Get the currently available VPS templates for each server type.
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
get_vps_templates

Get the currently available VPS templates for each server type.

Correct Syntax: {$_SERVER["argv"][0]} 


EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
$res = $client
  -> get_vps_templates($);
print $res;
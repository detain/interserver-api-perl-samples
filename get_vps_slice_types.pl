#!/usr/bin/perl -w
# get_vps_slice_types - (c)2015 by detain@interserver.net for the MyAdmin API
# We have several types of Servers available for use with VPS Hosting. You can get
# a list of the types available and  there cost per slice/unit by making a call to
# this function
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
get_vps_slice_types

We have several types of Servers available for use with VPS Hosting. You can get
# a list of the types available and  there cost per slice/unit by making a call to
# this function

Correct Syntax: {$_SERVER["argv"][0]} 


EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
  
$res = $client
  -> get_vps_slice_types($);
print $res;
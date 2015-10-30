#!/usr/bin/perl -w
# get_modules - (c)2015 by detain@interserver.net for the MyAdmin API
# Returns a list of all the modules available.
use SOAP::Lite;

show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  show_help = true;
  break;
} 
if (argc < 1)
  show_help = true;
if (show_help == true)
  exit(<<<EOF
get_modules

Returns a list of all the modules available.

Correct Syntax: {$_SERVER["argv"][0]} 


EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
  
$response = $client->get_modules();
print $response;
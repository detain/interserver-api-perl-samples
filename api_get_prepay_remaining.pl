#!/usr/bin/perl -w
# api_get_prepay_remaining - (c)2015 by detain@interserver.net for the MyAdmin API
# Get the PrePay amount available for a given module.
# @param module string the module you want to check your prepay amounts on
use SOAP::Lite;

module = argv[1];
show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  show_help = true;
  break;
} 
if (argc < 2)
  show_help = true;
if (show_help == true)
  exit(<<<EOF
api_get_prepay_remaining

Get the PrePay amount available for a given module.

Correct Syntax: {$_SERVER["argv"][0]}  <module>

  <module>  Must be a string

EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
  
$response = $client->api_get_prepay_remaining();
print $response;
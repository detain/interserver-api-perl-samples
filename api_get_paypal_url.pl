#!/usr/bin/perl -w
# api_get_paypal_url - (c)2015 by detain@interserver.net for the MyAdmin API
# Get the PayPal payment URL for an invoice on a given module.
# @param module string the module the invoice is for. use [get_modules](#get_modules) to get a list of modules
# @param invoice int the invoice id, or a comma seperated list of invoice ids to get a payment url for.  
use SOAP::Lite;

$module = argv[1];
$invoice = argv[2];
$show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  $show_help = true;
  break;
} 
if (argc < 3)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
api_get_paypal_url

Get the PayPal payment URL for an invoice on a given module.

Correct Syntax: {$_SERVER["argv"][0]}  <module> <invoice>

  <module>  Must be a string
  <invoice>  Must be a int

EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
$res = $client
  -> api_get_paypal_url($module, $invoice);
print $res;
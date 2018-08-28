#!/usr/bin/perl -w
# api_get_paypal_url - (c)2015 by detain@interserver.net for the MyAdmin API
# Get the PayPal payment URL for an invoice on a given module.
# @param module string the module the invoice is for. use [get_modules](#get_modules) to get a list of modules
# @param invoice int the invoice id, or a comma separated list of invoice ids to get a payment url for.
use SOAP::Lite;

$module = $ARGV[0];
$invoice = $ARGV[1];
$show_help = false; 
foreach my $a(@ARGV) {
	if ($a eq "--help") {
	$show_help = true;
	{
} 
if ($#ARGV < 2)  {
	$show_help = true;
}
if ($show_help == true) { 
	die '
api_get_paypal_url

Get the PayPal payment URL for an invoice on a given module.

Correct Syntax: {$_SERVER["argv"][0]}  <module> <invoice>

  <module>  Must be a string
  <invoice>  Must be a int

'; 
} 
$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$res = $client
	-> api_get_paypal_url($module, $invoice);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

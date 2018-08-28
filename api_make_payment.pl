#!/usr/bin/perl -w
# api_make_payment - (c)2015 by detain@interserver.net for the MyAdmin API
# Makes a payment for an invoice on a module.
# @param sid string the *Session ID* you get from the [login](#login) call
# @param module string the module of the service being paid on
# @param invoice int the invoice id you want to make a payment on
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$module = $ARGV[2];
$invoice = $ARGV[3];
$show_help = false; 
foreach my $a(@ARGV) {
	if ($a eq "--help") {
	$show_help = true;
	{
} 
if ($#ARGV < 4)  {
	$show_help = true;
}
if ($show_help == true) { 
	die '
api_make_payment

Makes a payment for an invoice on a module.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <module> <invoice>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <module>  Must be a string
  <invoice>  Must be a int

'; 
} 
$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$sid = $client
	-> api_login($username, $password)
	-> result;
if (length($sid) == 0)  {
	die "Got A Blank Session";
} 
$res = $client
	-> api_make_payment($sid, $module, $invoice);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

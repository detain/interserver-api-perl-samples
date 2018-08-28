#!/usr/bin/perl -w
# api_get_prepay_paypal_fill_url - (c)2015 by detain@interserver.net for the MyAdmin API
# Gets a PayPal URL to fill a PrePay.
# @param sid string the *Session ID* you get from the [login](#login) call
# @param module string the module the prepay is for. use [get_modules](#get_modules) to get a list of modules
# @param prepay_id int the ID of the PrePay
# @param amount float the amount to pay on the prepay.
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$module = $ARGV[2];
$prepay_id = $ARGV[3];
$amount = $ARGV[4];
$show_help = false; 
foreach my $a(@ARGV) {
	if ($a eq "--help") {
	$show_help = true;
	{
} 
if ($#ARGV < 5)  {
	$show_help = true;
}
if ($show_help == true) { 
	die '
api_get_prepay_paypal_fill_url

Gets a PayPal URL to fill a PrePay.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <module> <prepay_id> <amount>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <module>  Must be a string
  <prepay_id>  Must be a int
  <amount>  Must be a float

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
	-> api_get_prepay_paypal_fill_url($sid, $module, $prepay_id, $amount);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

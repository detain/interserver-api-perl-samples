#!/usr/bin/perl -w
# api_add_prepay - (c)2015 by detain@interserver.net for the MyAdmin API
# Adds a PrePay into the system under the given module.    PrePays are a credit on
# your account by prefilling  your account with funds.   These are stored in a
# PrePay.    PrePay funds can be automatically used as needed or set to only be
# usable by direct action
# @param sid string the *Session ID* you get from the [login](#login) call
# @param module string the module the prepay is for. use [get_modules](#get_modules) to get a list of modules
# @param amount float the dollar amount of prepay total
# @param automatic_use bool whether or not the prepay will get used automatically by billing system.
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$module = $ARGV[2];
$amount = $ARGV[3];
$automatic_use = $ARGV[4];
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
api_add_prepay

Adds a PrePay into the system under the given module.    PrePays are a credit on
# your account by prefilling  your account with funds.   These are stored in a
# PrePay.    PrePay funds can be automatically used as needed or set to only be
# usable by direct action

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <module> <amount> <automatic_use>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <module>  Must be a string
  <amount>  Must be a float
  <automatic_use>  Must be a bool

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
	-> api_add_prepay($sid, $module, $amount, $automatic_use);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

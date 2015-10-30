#!/usr/bin/perl -w
# api_webhosting_get_client_unpaid_invoices - (c)2015 by detain@interserver.net for the MyAdmin API
# This Function Applies to the Webhosting services.
# This function returns a list of all the unpaid invoices matching the module
# passed..
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
use SOAP::Lite;

���$username = $ARGV[0];
$password = $ARGV[1];
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
api_webhosting_get_client_unpaid_invoices

This Function Applies to the Webhosting services.
# This function returns a list of all the unpaid invoices matching the module
# passed..

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site

'; 
} 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
$sid = $client
  -> api_login($username, $password)
  -> result;
if (length($sid) == 0)  {
  die "Got A Blank Sessoion";
} 
$res = $client
  -> api_webhosting_get_client_unpaid_invoices($sid);
print $res;
#!/usr/bin/perl -w
# api_make_payment - (c)2015 by detain@interserver.net for the MyAdmin API
# Makes a payment for an invoice on a module.
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param module string the module of the service being paid on
# @param invoice int the invoice id you want to make a payment on
use SOAP::Lite;

$username = argv[1];
$password = argv[2];
$module = argv[3];
$invoice = argv[4];
$show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  $show_help = true;
  break;
} 
if (argc < 5)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
api_make_payment

Makes a payment for an invoice on a module.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <module> <invoice>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <module>  Must be a string
  <invoice>  Must be a int

EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
$sid = $client
  -> api_login($username, $password)
  -> result;
if (strlen($sid)  == 0)
  die "Got A Blank Sessoion";
$res = $client
  -> api_make_payment($sid, $module, $invoice);
print $res;
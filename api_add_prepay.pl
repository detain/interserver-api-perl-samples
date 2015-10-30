#!/usr/bin/perl -w
# api_add_prepay - (c)2015 by detain@interserver.net for the MyAdmin API
# Adds a PrePay into the system under the given module.    PrePays are a credit on
# your account by prefilling  your account with funds.   These are stored in a
# PrePay.    PrePay funds can be automaticaly used as needed or set to only be
# usable by direct action
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param module string the module the prepay is for. use [get_modules](#get_modules) to get a list of modules
# @param amount float the dollar amount of prepay total
# @param automatic_use bool wether or not the prepay will get used automatically by billing system.
use SOAP::Lite;

username = argv[1];
password = argv[2];
module = argv[3];
amount = argv[4];
automatic_use = argv[5];
show_help = false; 
if (in_array('--help', $_SERVER['argv']))
{
  show_help = true;
  break;
} 
if (argc < 6)
  show_help = true;
if (show_help == true)
  exit(<<<EOF
api_add_prepay

Adds a PrePay into the system under the given module.    PrePays are a credit on
# your account by prefilling  your account with funds.   These are stored in a
# PrePay.    PrePay funds can be automaticaly used as needed or set to only be
# usable by direct action

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <module> <amount> <automatic_use>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <module>  Must be a string
  <amount>  Must be a float
  <automatic_use>  Must be a bool

EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
$sid = $client
  -> api_login(argv[1], argv[2])
  -> result;
if (strlen($sid)  == 0)
  die "Got A Blank Sessoion";
echo "Got Session ID "+$sid+"\n";
  
$response = $client->api_add_prepay();
print $response;
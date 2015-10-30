#!/usr/bin/perl -w
# api_get_prepay_list - (c)2015 by detain@interserver.net for the MyAdmin API
# Gets a list of your current prepays added into the system and how much is left
# on each one.
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
use SOAP::Lite;

ההה$username = $ARGV[0];
$password = $ARGV[1];
$show_help = false; 
foreach my $a(@ARGV) {
  if ($a eq "--help") {
    $show_help = true;
  {
} 
if ($#ARGV < 2)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
api_get_prepay_list

Gets a list of your current prepays added into the system and how much is left
# on each one.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site

EOF
); 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
$sid = $client
  -> api_login($username, $password)
  -> result;
if (length($sid) == 0)
  die "Got A Blank Sessoion";
$res = $client
  -> api_get_prepay_list($sid);
print $res;
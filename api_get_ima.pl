#!/usr/bin/perl -w
# api_get_ima - (c)2015 by detain@interserver.net for the MyAdmin API
# Returns the IMA value.  This function tells you that I'm a client, or I'm a
# admin. This is almost always going to return client, Adminsitrators will get an
# admin response.
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
api_get_ima

Returns the IMA value.  This function tells you that I'm a client, or I'm a
# admin. This is almost always going to return client, Adminsitrators will get an
# admin response.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site

'; 
} 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
$login_res = $client
  -> api_login($username, $password)
  -> result;
die $login_res->faultstring if ($login_res->fault);
print $login_res->result, "\n";
if (length($login_res->result) == 0)  {
  die "Got A Blank Sessoion";
} 
$res = $client
  -> api_get_ima($sid);
print $res;
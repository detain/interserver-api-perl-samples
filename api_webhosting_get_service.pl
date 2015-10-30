#!/usr/bin/perl -w
# api_webhosting_get_service - (c)2015 by detain@interserver.net for the MyAdmin API
# This Function Applies to the Webhosting services.
# Gets service info for the given ID in the given Module.   An example of this
# would be in the "vps" modulei have order id
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int service id, such as VPS ID
use SOAP::Lite;

ההה$username = $ARGV[0];
$password = $ARGV[1];
$id = $ARGV[2];
$show_help = false; 
foreach my $a(@ARGV) {
  if ($a eq "--help") {
    $show_help = true;
  {
} 
if ($#ARGV < 3)  {
  $show_help = true;
}
if ($show_help == true) { 
  die '
api_webhosting_get_service

This Function Applies to the Webhosting services.
# Gets service info for the given ID in the given Module.   An example of this
# would be in the "vps" modulei have order id

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <id>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <id>  Must be a int

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
  -> api_webhosting_get_service($sid, $id);
print $res;
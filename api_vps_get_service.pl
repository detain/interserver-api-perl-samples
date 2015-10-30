#!/usr/bin/perl -w
# api_vps_get_service - (c)2015 by detain@interserver.net for the MyAdmin API
# This Function Applies to the VPS services.
# Gets service info for the given ID in the given Module.   An example of this
# would be in the "vps" modulei have order id
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int service id, such as VPS ID
use SOAP::Lite;

ההה$username = $ARGV[1];
$password = $ARGV[2];
$id = $ARGV[3];
$show_help = false; 
foreach my $a(@ARGV) {
  if ($a eq "--help") {
    $show_help = true;
  {
} 
if ($#ARGV < 4)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
api_vps_get_service

This Function Applies to the VPS services.
# Gets service info for the given ID in the given Module.   An example of this
# would be in the "vps" modulei have order id

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <id>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <id>  Must be a int

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
  -> api_vps_get_service($sid, $id);
print $res;
#!/usr/bin/perl -w
# api_vps_queue_restart - (c)2015 by detain@interserver.net for the MyAdmin API
# restart a vps
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int defaults to false, if specifeid tries usign that di instead of the one passed
use SOAP::Lite;

���$username = $ARGV[0];
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
api_vps_queue_restart

restart a vps

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <id>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <id>  Must be a int

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
  -> api_vps_queue_restart($sid, $id);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";
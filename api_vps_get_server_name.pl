#!/usr/bin/perl -w
# api_vps_get_server_name - (c)2015 by detain@interserver.net for the MyAdmin API
# Get the name of the vps master/host server your giving the id for
# @param sid string the *Session ID* you get from the [login](#login) call
# @param id int id of the vps master
use SOAP::Lite;

$username = $ARGV[0];
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
api_vps_get_server_name

Get the name of the vps master/host server your giving the id for

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
	die "Got A Blank Session";
} 
$res = $client
	-> api_vps_get_server_name($sid, $id);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

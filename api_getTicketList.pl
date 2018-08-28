#!/usr/bin/perl -w
# api_getTicketList - (c)2015 by detain@interserver.net for the MyAdmin API
# Returns a list of any tickets in the system.
# @param sid string the *Session ID* you get from the [login](#login) call
# @param page int page number of tickets to list
# @param limit int how many tickets to show per page
# @param status string null for no status limit or limit to a specific status
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$page = $ARGV[2];
$limit = $ARGV[3];
$status = $ARGV[4];
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
api_getTicketList

Returns a list of any tickets in the system.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <page> <limit> <status>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <page>  Must be a int
  <limit>  Must be a int
  <status>  Must be a string

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
	-> api_getTicketList($sid, $page, $limit, $status);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

#!/usr/bin/perl -w
# api_delete_dns_record - (c)2015 by detain@interserver.net for the MyAdmin API
# Deletes a single DNS record
# @param sid string the *Session ID* you get from the [login](#login) call
# @param domain_id int The ID of the domain in question.
# @param record_id int The ID of the domains record to remove.
use SOAP::Lite;

$username = $ARGV[0];
$password = $ARGV[1];
$domain_id = $ARGV[2];
$record_id = $ARGV[3];
$show_help = false; 
foreach my $a(@ARGV) {
	if ($a eq "--help") {
	$show_help = true;
	{
} 
if ($#ARGV < 4)  {
	$show_help = true;
}
if ($show_help == true) { 
	die '
api_delete_dns_record

Deletes a single DNS record

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <domain_id> <record_id>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <domain_id>  Must be a int
  <record_id>  Must be a int

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
	-> api_delete_dns_record($sid, $domain_id, $record_id);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

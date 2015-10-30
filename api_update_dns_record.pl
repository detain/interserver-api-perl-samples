#!/usr/bin/perl -w
# api_update_dns_record - (c)2015 by detain@interserver.net for the MyAdmin API
# Updates a single DNS record
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param domain_id int The ID of the domain in question.
# @param record_id int The ID of the record to update
# @param name string the hostname being set on the dns record.
# @param content string the value of the dns record, or what its set to.
# @param type string dns record type.
# @param ttl int dns record time to live, or update time.
# @param prio int dns record priority
use SOAP::Lite;

���$username = $ARGV[0];
$password = $ARGV[1];
$domain_id = $ARGV[2];
$record_id = $ARGV[3];
$name = $ARGV[4];
$content = $ARGV[5];
$type = $ARGV[6];
$ttl = $ARGV[7];
$prio = $ARGV[8];
$show_help = false; 
foreach my $a(@ARGV) {
  if ($a eq "--help") {
    $show_help = true;
  {
} 
if ($#ARGV < 9)  {
  $show_help = true;
}
if ($show_help == true) { 
  die '
api_update_dns_record

Updates a single DNS record

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <domain_id> <record_id> <name> <content> <type> <ttl> <prio>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <domain_id>  Must be a int
  <record_id>  Must be a int
  <name>  Must be a string
  <content>  Must be a string
  <type>  Must be a string
  <ttl>  Must be a int
  <prio>  Must be a int

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
  -> api_update_dns_record($sid, $domain_id, $record_id, $name, $content, $type, $ttl, $prio);
print $res;
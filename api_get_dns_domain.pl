#!/usr/bin/perl -w
# api_get_dns_domain - (c)2015 by detain@interserver.net for the MyAdmin API
# Gets the DNS entry for a given Domain ID
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param domain_id int The ID of the domain in question.
use SOAP::Lite;

���$username = $ARGV[0];
$password = $ARGV[1];
$domain_id = $ARGV[2];
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
api_get_dns_domain

Gets the DNS entry for a given Domain ID

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <domain_id>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <domain_id>  Must be a int

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
  -> api_get_dns_domain($sid, $domain_id);
print $res;
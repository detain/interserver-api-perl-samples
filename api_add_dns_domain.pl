#!/usr/bin/perl -w
# api_add_dns_domain - (c)2015 by detain@interserver.net for the MyAdmin API
# Adds a new domain into our system.  The status will be "ok" if it added, or
# "error" if there was any problems status_text will contain a description of the
# problem if any.
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param domain string domain name to host
# @param ip string ip address to assign it to.
use SOAP::Lite;

ההה$username = $ARGV[0];
$password = $ARGV[1];
$domain = $ARGV[2];
$ip = $ARGV[3];
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
api_add_dns_domain

Adds a new domain into our system.  The status will be "ok" if it added, or
# "error" if there was any problems status_text will contain a description of the
# problem if any.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <domain> <ip>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <domain>  Must be a string
  <ip>  Must be a string

'; 
} 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
$sid = $client
  -> api_login($username, $password)
  -> result;
die $sid->faultstring if ($sid->fault);
print $sid->result, "\n";
if (length($sid) == 0)  {
  die "Got A Blank Sessoion";
} 
$res = $client
  -> api_add_dns_domain($sid, $domain, $ip);
die $res->faultstring if ($res->fault);
print "Response:\n",$res,"\n";
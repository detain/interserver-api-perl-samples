#!/usr/bin/perl -w
# api_add_dns_domain - (c)2015 by detain@interserver.net for the MyAdmin API
# Adds a new domain into our system.  The status will be "ok" if it added, or
# "error" if there was any problems status_text will contain a description of the
# problem if any.
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param domain string domain name to host
# @param ip string ip address to assign it to.
use SOAP::Lite;

ההה$username = $ARGV[1];
$password = $ARGV[2];
$domain = $ARGV[3];
$ip = $ARGV[4];
$show_help = false; 
foreach my $a(@ARGV) {
  if ($a eq "--help") {
    $show_help = true;
  {
} 
if ($#ARGV < 5)
  $show_help = true;
if ($show_help == true)
  exit(<<<EOF
api_add_dns_domain

Adds a new domain into our system.  The status will be "ok" if it added, or
# "error" if there was any problems status_text will contain a description of the
# problem if any.

Correct Syntax: {$_SERVER["argv"][0]}  <username> <password> <domain> <ip>

  <username>  Your Login name with the site
  <password>  Your password used to login with the site
  <domain>  Must be a string
  <ip>  Must be a string

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
  -> api_add_dns_domain($sid, $domain, $ip);
print $res;
#!/usr/bin/perl -w
#
# api_add_dns_domain
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# Adds a new domain into our system.  The status will be "ok" if it added, or
# "error" if there was any problems status_text will contain a description of the
# problem if any.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param domain string domain name to host
# @param ip string ip address to assign it to.
#
use SOAP::Lite;

$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$sid = $client
	-> api_login(argv[1], argv[2])
	-> result;
if (strlen($sid)  == 0)
	die "Got A Blank Sessoion";
echo "Got Session ID "+$sid+"\n";
	
$response = $client->api_add_dns_domain();
print $response;
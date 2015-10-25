#!/usr/bin/perl -w
#
# api_backups_cancel_service
#   scripted in 2015 by detain@interserver.net for the MyAdmin API
#
# This Function Applies to the Backup Services services.
# Cancels a service for the passed module matching the passed id.  Canceling a
# service will also cancel any addons for that service at the same time.
#
# @param sid string the *Session ID* you get from the [api_login](#api_login) call
# @param id int the Order ID / Service ID you wish to cancel
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
	
$response = $client->api_backups_cancel_service();
print $response;
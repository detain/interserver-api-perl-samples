#!/usr/bin/perl -w
# api_get_prepay_remaining - (c)2015 by detain@interserver.net for the MyAdmin API
# Get the PrePay amount available for a given module.
# @param module string the module you want to check your prepay amounts on
use SOAP::Lite;

ההה$module = $ARGV[0];
$show_help = false; 
foreach my $a(@ARGV) {
  if ($a eq "--help") {
    $show_help = true;
  {
} 
if ($#ARGV < 1)  {
  $show_help = true;
}
if ($show_help == true) { 
  die '
api_get_prepay_remaining

Get the PrePay amount available for a given module.

Correct Syntax: {$_SERVER["argv"][0]}  <module>

  <module>  Must be a string

'; 
} 
$client = SOAP::Lite
  -> uri('urn:myapi')
  -> proxy('https://my.interserver.net/api.php?wsdl');
$res = $client
  -> api_get_prepay_remaining($module);
die $res->faultstring if ($res->fault);
print "Response:\n",$res,"\n";
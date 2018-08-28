#!/usr/bin/perl -w
# strPixels - (c)2015 by detain@interserver.net for the MyAdmin API
# This function uses the array below to calculate the pixel width of a string of
# characters. The widths of each character are based on a 12px Helvetica font. 
# Kerning is not taken into account so RESULTS ARE APPROXIMATE.  The purpose is to
# return a relative size to help in formatting. For example, strPixels('I like
# cake') == 54    strPixels('I LIKE CAKE') == 67
# @param string string characters to measure size
use SOAP::Lite;

$string = $ARGV[0];
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
strPixels

This function uses the array below to calculate the pixel width of a string of
# characters. The widths of each character are based on a 12px Helvetica font. 
# Kerning is not taken into account so RESULTS ARE APPROXIMATE.  The purpose is to
# return a relative size to help in formatting. For example, strPixels('I like
# cake') == 54    strPixels('I LIKE CAKE') == 67

Correct Syntax: {$_SERVER["argv"][0]}  <string>

  <string>  Must be a string

'; 
} 
$client = SOAP::Lite
	-> uri('urn:myapi')
	-> proxy('https://my.interserver.net/api.php?wsdl');
$res = $client
	-> strPixels($string);
die $res->faultstring if ($res->fault);
print "Response:\n",$res->result,"\n";

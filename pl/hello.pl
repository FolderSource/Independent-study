#!/usr/bin/perl
#
# the traditional first program
#
# Strict and warnings are recommended.
#
use strict;
use warnings;
use Getopt::Long;
#
# print a message
#
print "Hello, World!\n";
# use Getopt::Long; GetOptions
my $file = "temp.txt";


my $filename   ="";
my $width      ="";
my $stages     ="";
my $reset      ="";
my $outfile    ="";

#foreach (@ARGV)
#{  
#  print "$_\n";
#}
#my ($filename:s, $width, $stages, $reset, $outfile)= @ARGV;
if (@ARGV >0) {
     
   # foreach (@ARGV)
#{  
#  print "$_\n";
#}

GetOptions(
    'param:s'      => \$filename,
    'width:i'      => \$width,
    'stages:i'     => \$stages,
    'reset:s'     => \$reset,
    'outfile:s'    => \$outfile
) 
or die "Incorrect usage!\n";close FILE;
 #die " Missing -arg1 or arg2" unless $ARGV[0];    
}
else {print "$0: Argument required.\n";
    exit 1
}
if ( $filename ne "" && ($width ne "" && $stages ne "" && $outfile ne ""))   {
     	print "fail test2\n"; 
     die "Incorrect usage!\n";close FILE;

}
elsif ( $filename ne "" || ($width ne "" && $stages ne "" && $outfile ne ""))   {
     	print "pass test1\n"; 
     if ($filename ne ""){
	$width = 1+0;        #default val
        $stages =1+0;        #default val
        $reset = 0+0;        #default val
        $outfile = "outfile.txt";
}
     elsif($width ne "" && $stages ne "" && $outfile ne ""){
	$filename = "temp.txt";  #default val
        $width = $width+0;
        $stages =$stages+0;
     	if( ($width <1 || $width >64) || ($stages <2 || $stages >128) ){
       		die "Limits of number!\n";close FILE;
     	}
        if ( $reset =~ "0x"){
		$reset = substr($reset,2);
                $reset = hex($reset);
                print "$reset\n";
  	} else {
                $reset = $reset + 0;
		print "$reset\n";
        }
     }
}



#if( $help ) {
#    print "Com'on, it's not that hard.\n";
#} else {
    print "My name is $filename.\n";
    print "The width is $width.\n";
    print "The stages is $stages.\n";
    print "$outfile\n";
#}






unless(open FILE, '>'.$file){
	die "\nUnable to create $file\n";
}

    my $message = <<"END_MESSAGE";

    
        Testing complete!
END_MESSAGE
    print $message;

    print FILE $message;
close FILE;



#if ( $reset =~ /[0-9a-fA-F]+/ ) {
 #  print "valid no."
#} else {
  # print "not valid no."
#} 

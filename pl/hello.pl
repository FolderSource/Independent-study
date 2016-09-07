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
my $width      = 0;
my $stages     = 0;
my $reset      = 0;
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
if ( $filename ne "" && ($width != 0 && $stages != 0 && $outfile ne ""))   {
     print "fail test2\n"; 
     die "Incorrect usage!\n";close FILE;

}
elsif ( $filename ne "" || ($width != 0 && $stages != 0 && $outfile ne ""))   {
     print "pass test1\n"; 

}



#if( $help ) {
#    print "Common on, it's really not that hard.\n";
#} else {
    print "My name is $filename.\n";
    print "The width is $width.\n";
    #print "$outfile\n";
#}






unless(open FILE, '>'.$file){
	die "\nUnable to create $file\n";
}

    my $message = <<"END_MESSAGE";
        Dear bro,
    
        this is a message I plan to send to you.
    
        Regards,
          the Perl Maven
END_MESSAGE
    print $message;

    print FILE $message;
close FILE;



#if ( $reset =~ /[0-9a-fA-F]+/ ) {
 #  print "valid no."
#} else {
  # print "not valid no."
#} 

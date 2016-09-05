#!/usr/bin/perl
#
# the traditional first program
#
# Strict and warnings are recommended.
#
use strict;
use warnings;

#
# print a message
#
print "Hello, World!\n";
# use Getopt::Long; GetOptions
my $file = "temp.txt";

unless(open FILE, '>'.$file){
	die "\nUnable to create $file\n";
}

    my $message = <<"END_MESSAGE";
        Dear bro,
    
        this is a message I plan to send to you.
    
        regards
          the Perl Maven
END_MESSAGE
    print $message;

    print FILE $message;
close FILE;

#!/usr/bin/perl
#
# the traditional first program
#
# Strict and warnings are recommended.
#
use strict;
use warnings;
#use Path::Class;
use Getopt::Long
# print a message
#
print "Hello, World!\n";
# use Getopt::Long; GetOptions
my $file = "temp.txt";
#my $number; # = 33;
my $string = "reg";
my $file2 = "file.txt";
my $num = 0;
my @array = ();
my $indexnum = 0;

my $filename   ="";
my $width      ="";
my $stages     ="";
my $reset      ="";
my $outfile    ="";

#say $array[0];
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
    'reset:s'      => \$reset,
    'outfile:s'    => \$outfile
) 
or die "Incorrect usage!\n";close FILE;
}
#else {print "$0: Argument required.\n";
#    exit 1
#}
#if ( $filename =~ /^ *$/){
#	print "input param empty\n";  #testing
#}
#if ( $outfile =~ /^ *$/) {
#	print "outfile empty\n";
#}
#if ((not $width =~ /^ *$/) && (not $stages =~ /^ *$/) && ($outfile =~ /^ *$/ )) {
#	print "width not empty and output empty\n";
#        die "\n(Error ! outfile not provided)\n";
#}
#if ((not $width =~ /^ *$/) && (not $outfile =~ /^ *$/ )) {
#	print "width not empty and output not empty\n";
#}
#if ((not $width =~ /^ *$/) && (not $stages =~ /^ *$/) && (not $outfile =~ /^ *$/)){ print "pass3\n";}

#print $array[1];
#open( my $fh, '<', $file2 ) or die "Can't open $file2: $!";
#    while ( my $line = <$fh> ) {
        #if ( $line =~ /wanted text/ ) {
#            print $line;
#    }   
#my $text = "day1= string over here\n";

#print $1 if ($text =~ /:\s*(.+)$/);

if ( (not $filename =~ /^ *$/) && ((not $width =~ /^ *$/) && (not $stages =~ /^ *$/) && (not $outfile =~ /^ *$/)) )   {
     	print "fail test2\n"; 
     die "Incorrect usage!\n";close FILE;

}

elsif ( (not $filename =~ /^ *$/) || ((not $width =~ /^ *$/) && (not $stages =~ /^ *$/) && (not $outfile =~ /^ *$/)) )   {
     	print "pass test1\n"; 
     if (not $filename =~ /^ *$/){
	# Read the file 
my $str = 'abc 123 x456xy 789foo';

my ($first_num) = $str =~ /(\d+)/;
print "first_num $first_num";
my @all_nums    = $str =~ /(\d+)/g;        
print @all_nums;   
#my $string = 'abc$hello-goodbye';  
#print ((split /\./, $string)[0], "\n");
#print substr($string,index($string, '.'),length $string)."\n";
#$string =~ *//.s/\$.*//;
#$string =~ s/\$.*//;
#$print $string;

	#	my $count=0; :encoding(UTF-8)
my $integer =0;
#my $find = "width";
#open (FILE, "<", "file.txt") or die "could not open:$!";
#while (<FILE>) {
#print "find width" if (/$find/);
#}
#close (FILE);
#close (NEW);
        open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
	while (my $row = <$fh>) {
  		chomp $row;
		print "$row\n";
		if ($row =~ "width"){
			print "read width";
			#$indexnum = index($row, '=')+1;
			#print $indexnum+1; print length $row;
			#$array[0] = substr($row,$indexnum  ,(length $row)) ;
			# $array[0] = \*d*; doesn't work
			my ($width_temp)   = $row =~ /(\d+)/g;  
			$width = int($width_temp);
			print $width;
			
       		}
                elsif($row =~ "stages"){
			#$array[1] = substr($row,index($row, '=')+1,(length $row)+1) ;
			my ($stages_temp) = $row =~ /(\d+)/g;  
			$stages = int($stages_temp);
			print " stages $stages\n";
 		}
		elsif($row =~ "reset"){
			if ( $reset =~ "0x"){
				$reset = substr($row,2);
		                $reset = hex($reset);
	                	print "$reset\n";
		  	}
			else{
			my ($reset_temp) = $row =~ /(\d+)/g;  
			$reset = int($reset_temp);
			print "rest $reset\n";
			}
		}
		elsif($row =~ "outfile"){
			#if ($row =~ /:\s*(.+)$/){
			#my ($a) = $text =~ /:\s*(.+)$/;
			#$array[3] = $a;
			#}
			#$array[3] = substr($row,index($row, '=')+1,(length $row)+1) ;
		}
  	#	$array[$count] = $row;
  	#	print "$row\n";
  	#	$count = $count+1;

	}

        #$width = $width;        #default val
        #$stages =$stages;        #default val
        #$reset = $reset;        #default val
        $outfile = 'outfile.txt';  #default val
}
     elsif((not $width =~ /^ *$/) && (not $stages =~ /^ *$/) && (not $outfile =~ /^ *$/)){
	$filename = "";  #default val
        $width = $width+0;
        $stages =$stages+0;

     	if( ($width <1 || $width >64) || ($stages <2 || $stages >128) ){
       		die "Limits out of range!\n";close FILE;
     	}
        if ( $reset =~ "0x"){
		$reset = substr($reset,2);
                $reset = hex($reset);
                #print "$reset\n";
  	} else {
                $reset = $reset + 0;
		#print "$reset\n";
        }
     }
    
}
else{
		die "\n(Error ! Invalid argument)\n";
}
if (($reset) > ($width) ){
	die "Reset shouldn't be larger than width\n"; close FILE;
}


#if( $help ) {
#    print "Com'on, it's not that hard.\n";
#} else {
    print "My name is $filename.\n";
    print "The width is $width.\n";
    print "The stages is $stages.\n";
    print "The reset is $reset.\n";
    print "$outfile\n";
#}






unless(open FILE, '>'.$outfile){
	die "\nUnable to create(outfile not provided) $outfile\n";
}

# Register bit wide  Reg0[bit-1:0] => Reg1[bit-1:0]
#  Stages mean the no. of registers Reg99[bit-1:0] => Output[bit-1:0]; 

$width = $width -1;                     
    my $message = <<"END_MESSAGE";
module digit_reg (
    reset,
    clk,
    in,
    out,
    scan_in0,
    scan_en,
    scan_out0
    ) ;
 
input
    reset,                // system reset
    clk ;                 // write strobe

input [$width:0]
    in ;                  // data input

output [$width:0]
    out ;                 // data output

input
    scan_in0,             // test scan mode data input
    scan_en;              // test scan mode enable

output
    scan_out0;            // test scan mode data output

wire [$width:0]
    out ;
END_MESSAGE

    print FILE $message;
#unless(open FILE2, '>'.$file2){
#	die "\nUnable to create $file2\n";
#}


    for (my $number=0;$number<$stages;$number++)
    {
        #print"$number\n";
        print FILE "reg" ." [".$width.":0]"." R".$number . ";\n";
    }
my $message2 = <<"END_MESSAGE";
always @(posedge clk or posedge reset)
    if (reset)
        begin
END_MESSAGE
    print FILE $message2;
for (my $number=0;$number<$stages;$number++)
    {     
        print FILE "          R".$number ." <= ".$reset. ";\n";
    }

my $message3 = <<"END_MESSAGE";
        end
    else
        begin
          R0 <= in;
END_MESSAGE
print FILE $message3;
for (my $number=0;$number<$stages;$number++){
   if ($number < $stages-1){   
        print FILE "          R";
        $num= $number+1;
        print FILE $num." <= R".$number. ";\n";
   }
   else{ 
        print FILE "          out = " . "R".$number.";\n" ;
   }
}
my $message4 = <<"END_MESSAGE";
        end
        
endmodule 
END_MESSAGE
print FILE $message4;

close FILE;



#if ( $reset =~ /[0-9a-fA-F]+/ ) {
 #  print "valid no."
#} else {
  # print "not valid no."
#} 

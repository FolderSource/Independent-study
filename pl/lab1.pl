#!/usr/bin/perl
#
# the traditional first program
#
# Strict and warnings are recommended.
#
use strict;
use warnings;
#use Path::Class;
use Getopt::Long;
# print a message
#
#print "Hello, World!\n";
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
my $text = ""; 

if (@ARGV >0) {
     

GetOptions(
    'param:s'      => \$filename,
    'width:i'      => \$width,
    'stages:i'     => \$stages,
    'reset:s'      => \$reset,
    'outfile:s'    => \$outfile
) 
or die "Incorrect usage!\n";close FILE;
}



if ( (not $filename =~ /^ *$/) && ((not $width =~ /^ *$/) && (not $stages =~ /^ *$/) && (not $outfile =~ /^ *$/)) )   {
     die "Incorrect usage!\n";close FILE;

}

elsif ( (not $filename =~ /^ *$/) || ((not $width =~ /^ *$/) && (not $stages =~ /^ *$/) && (not $outfile =~ /^ *$/)) )   {
     if (not $filename =~ /^ *$/){

        open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
	while (my $row = <$fh>) {
  		chomp $row;
		print "$row\n";
		if ($row =~ "width"){
			print "read width";
			my ($width_temp)   = $row =~ /(\d+)/g;  
			$width = int($width_temp);
			print $width;
			
       		}
                elsif($row =~ "stages"){
			my ($stages_temp) = $row =~ /(\d+)/g;  
			$stages = int($stages_temp);
			print " stages $stages\n";
 		}
		elsif($row =~ "reset"){
			if ( $row =~ "0x"){                # if string has 0x convert hex
				my ($a) = $row =~ /x\s*(.+)$/;
				#print $a;
		                $reset = hex($a);
	                	print "reset 0x is $reset\n";
		  	}
			else{
			my ($reset_temp) = $row =~ /(\d+)/g;  
			$reset = int($reset_temp);
			print "rest $reset\n";
			}
		}
		elsif($row =~ "outfile"){
			my ($a) = $row =~ /=\s*(.+)$/;    # read string after = sign
			$outfile = $a;
		}


	}

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
  	} else {
                $reset = $reset + 0;
        }
     }
    
}
else{
		die "\n(Error ! Invalid argument)\n";
}
if (($reset) > ($width) ){
	die "Reset shouldn't be larger than width\n"; close FILE;
}



    print "My filename is $filename.\n";
    print "The width is $width.\n";
    print "The stages is $stages.\n";
    print "The reset is $reset.\n";
    print "$outfile\n";






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


    for (my $number=0;$number<$stages;$number++)
    {

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

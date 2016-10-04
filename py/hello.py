#!/usr/bin/python
#

#
# print a message
#
from argparse import ArgumentParser
#print "Hello, World!";

import re
import sys
import getopt

width_low, width_high = (1, 64)
stages_low, stages_high = (2,128)
outfile_type = ""

     
class ArgumentError(Exception):
    pass


def usage():
    print ' Accept commands as follows. --param filename or --width nn, --stages nn --reset nn and --outfile filename\n '
    print sys.exit(__doc__)


def parse_arguments(argv):
    filename = None
    width = None
    stages = None
    reset = None
    outfile = None
	
    try:
        opts, args = getopt.getopt(argv[1:], "f:w:s:r:o:", ["param=","width=","stages=","reset=", "outfile="])
    except getopt.GetoptError as err:
        # print help information and exit:
        print str(err)  # will print something like "option -a not recognized"
        usage()

    for opt, arg in opts:
        if opt =='-h':
            usage()
	elif opt in ('-f', "--param"):
		filename = arg
                
		
  		# read the files
        elif opt in ('-w',"--width"):
            width = arg
            if width not in map(str, range(width_low, width_high + 1)):
                raise ArgumentError("Argument Error: Invalid width. \n "
                                    "The range of width is within (%s, %s)" % (width_low, width_high))
            width = int(width)
	elif opt in ('-s',"--stages"):
            stages = arg
            if stages not in map(str, range(stages_low, stages_high + 1)):
                raise ArgumentError("Argument Error: Invalid stages. \n "
                                    "The range of width is within (%s, %s)" % (stages_low, stages_high))
            stages = int(stages)
	elif opt in ('-r',"--reset"):
	    reset = arg
            reset = int(reset)
        elif opt in ('-o',"--outfile"):
            outfile = arg.lower()

        else:
            raise ArgumentError("Bad argument: I don't know what %s is" % arg)

    if (not (filename is None) or not(width is None and stages is None and reset is None and outfile is None)):
    	#do nothing
        pass
    else:    
    	raise ArgumentError("You need to supply Argument file or width, stages ,reset and output file")
    if (not (filename is None) and (not(width is None and stages is None and reset is None and outfile is None))):
			raise ArgumentError("Cannot supply both Argument file, and width, stages ,reset and output file")
    if (not (filename is None)):
   	 with open(filename) as f:
    			for line in f:
				if "width" in line: 
        				
 					width_g = re.search(r"\d+", line)	
					width   = width_g.group()
					width   = int(width)
					#print "width"
					#width = read int after width
				elif "stages" in line: 
					stages_g = re.search(r"\d+", line)	
					stages   = stages_g.group()
					stages   = int(stages)
					#print "stages"
					#stages = read int

				elif "reset" in line: 
					if "0x" in line:
						#print "0x in line" 
						
						line1 = line.split('=')[1]
						b = line1.find(';')
						reset = line1[0:b]
						reset = int(reset,16)	
                                                
						
						#print reset
					else:
						reset_g = re.search(r"\d+", line)	
						reset   = reset_g.group()
						reset   = int(reset)
						#print "reset"
					#reset = read int with nn and 
					
					#0x case
				elif "outfile" in line: 
					
					outfile = line.split("=")[1]
					a       = outfile.find(';')
					outfile = outfile[0:a]
					#outfile = read string after outfile
    if ( reset > width ):
     			raise ArgumentError("Reset cannot be larger than width")
    print 'filename:', filename
    print 'width :', width 
    print 'stages:' ,stages 
    print 'reset:'  ,reset
    print 'outfile:', outfile 
   
    # return argument values
    return filename,width,stages,reset, outfile
    


if __name__ == "__main__":
    print ' Accept commands as follows. --param filename or --width nn, --stages nn --reset nn and --outfile filename\n '
    filename, width, stages, reset, outfile = parse_arguments(sys.argv)
    f2 = open(outfile, 'w')
   
    f2.write('module ')
    #for x in range(0, 3):
    #	print "We're on time %d" % (x)
    # change outfile.txt to just outfile	  
    # a=" ABc = def"
    #b=a.split("=")[1]
    #print b
   
    a       = outfile.find('.')
    outfile2 = outfile[0:a]
    f2.write(outfile2 )
    f2.write('( \n' )	
    template = """    reset,
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

input [1:0]
    in ;                  // data input

output [1:0]
    out ;                 // data output

input
    scan_in0,             // test scan mode data input
    scan_en;              // test scan mode enable

output
    scan_out0;            // test scan mode data output

wire [1:0] out ;\n"""
    f2.write(template)
    f2.write("reg [")
    stages = stages -1
    stages_str = str(stages)
    width = width-1
    width_str = str(width)
    reset_str = str(reset)
    f2.write(width_str)
    f2.write(":0]")
    f2.write("R [")
  
    f2.write(stages_str)
    f2.write(":0];\n")
            # print "We're on time %d" % (x)
    f2.write("assign out = R[")
    f2.write(stages_str)
    f2.write("] ;\n")
    template2="""always @(posedge clk or posedge reset)
    if (reset)
        begin\n"""
    f2.write(template2)
    for x in range(0, stages+1):
    
    	f2.write("          R[")
        f2.write(str(x)) 
        f2.write("] <= ") 
        f2.write(reset_str)
        f2.write(" ;\n")
 
    
    template3="""       end   
    else
        begin
          R[0] <= in;\n"""
    f2.write(template3)
    
    for x in range(1, stages+1):
    	f2.write("          R[")
	f2.write(str(x)) 
        f2.write("] <= ") 
        f2.write(" R[")
        y = x-1
        f2.write(str(y)) 
        f2.write("] ;\n")
    #      R1 <= R0;
    #      R2 <= R1;
    #      R3 <= R2;
    #      R4 <= R3;

    template4="""       end
        
endmodule """
     
    f2.write(template4)
    f2.close
#def main():
    # print command line arguments
  #  for arg in sys.argv[1:]:
   #     print arg

#if __name__ == "__main__":
#    main(sys.argv[1:])

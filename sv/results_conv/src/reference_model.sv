function [7:0] reference_model ( input logic clk, input reset, input rcc_clk,  input logic[7:0] var_x,input logic[7:0] pre_var,input logic[3:0] address1, input logic [15:0]din1,
input logic[3:0] address2, input logic [15:0]din2, input logic[3:0] address3, input logic [15:0]din3,
input logic[3:0] address4, input logic [15:0]din4, input logic[3:0] address5, input logic [15:0]din5,
input logic[3:0] address6, input logic [15:0]din6, input logic[3:0] address7, input logic [15:0]din7,
input logic[3:0] address8, input logic [15:0]din8, 
output logic [7:0] dout, output logic[7:0] var_z );

        logic [15:0] r697,r770,r852,r941,r1209,r1336,r1477,r1633,low_mag,high_mag;
	logic [2:0] low, high ;
	logic [7:0]  out_p1 ;
	logic okay;
	logic nodigit;
	logic signed [16:0] cmpf;
	logic signed [16:0] cmpr;
	logic [15:0] opa,opb;
	logic signed [16:0] a, b, c ,a2, b2, c2, a3,b3,c3,a4,b4,c4,a5,b5,c5,a6,b6,c6,a7,b7,c7,a8,b8,c8; //signed
	logic  test1;
        //$display(address);
	//  dout = 2'b11;
	//var_z = 1'b1;	

	nodigit = 1'b0;

	//out_p1          = 0;
	var_z           = pre_var ;
	dout 		= pre_var ;
	var_z 		= 8'hff ;
	low		= 0 ;
	high 		= 0 ;
	low_mag		= 0 ;
	high_mag	= 0 ;

	if ( reset == 1'b1)
		begin

		//sb.digit_clk = 0 ; error
		//sb.dout_flag 	= 1 ; error

		//out_p1          = 0;
		dout 		= 8'hff ;
		var_z 		= 8'hff ;
		low		= 0 ;
		high 		= 0 ;
		low_mag		= 0 ;
		high_mag	= 0 ;
		//int seen_quiet = 0;  //not need to use
		end
	//$display(address1);
	//$display(address2);
	//$display(address3);
	//$display(address4);
	//$display(address5);
	//$display(address6);
	//$display(address7);
	//$display(address8);
	if (address1 == 4'b0000)
		  r697 = din1;
	else if (address1 == 4'b0001)
		  r770 = din1;
	else if (address1 == 4'b0010)
		  r852 = din1;
	else if (address1 == 4'b0011)
		  r941 = din1;
	else if (address1 == 4'b0100)
		  r1209 = din1;
	else if (address1 == 4'b0101)
		  r1336 = din1;
	else if (address1 == 4'b0110)
		  r1477 = din1;
	else if (address1 == 4'b0111)
		  r1633 = din1;

	if (address2 == 4'b0000)
		  r697 = din2;
	else if (address2 == 4'b0001)
		  r770 = din2;
	else if (address2 == 4'b0010)
		  r852 = din2;
	else if (address2 == 4'b0011)
		  r941 = din2;
	else if (address2 == 4'b0100)
		  r1209 = din2;
	else if (address2 == 4'b0101)
		  r1336 = din2;
	else if (address2 == 4'b0110)
		  r1477 = din2;
	else if (address2 == 4'b0111)
		  r1633 = din2;


	if (address3 == 4'b0000)
		  r697 = din3;
	else if (address3 == 4'b0001)
		  r770 = din3;
	else if (address3 == 4'b0010)
		  r852 = din3;
	else if (address3 == 4'b0011)
		  r941 = din3;
	else if (address3 == 4'b0100)
		  r1209 = din3;
	else if (address3 == 4'b0101)
		  r1336 = din3;
	else if (address3 == 4'b0110)
		  r1477 = din3;
	else if (address3 == 4'b0111)
		  r1633 = din3;

	if (address4 == 4'b0000)
		  r697 = din4;
	else if (address4 == 4'b0001)
		  r770 = din4;
	else if (address4 == 4'b0010)
		  r852 = din4;
	else if (address4 == 4'b0011)
		  r941 = din4;
	else if (address4 == 4'b0100)
		  r1209 = din4;
	else if (address4 == 4'b0101)
		  r1336 = din4;
	else if (address4 == 4'b0110)
		  r1477 = din3;
	else if (address4 == 4'b0111)
		  r1633 = din4;


	if (address5 == 4'b0000)
		  r697 = din5;
	else if (address5 == 4'b0001)
		  r770 = din5;
	else if (address5 == 4'b0010)
		  r852 = din5;
	else if (address5 == 4'b0011)
		  r941 = din5;
	else if (address5 == 4'b0100)
		  r1209 = din5;
	else if (address5 == 4'b0101)
		  r1336 = din5;
	else if (address5 == 4'b0110)
		  r1477 = din5;
	else if (address5 == 4'b0111)
		  r1633 = din5;
	
	if (address6 == 4'b0000)
		  r697 = din6;
	else if (address6 == 4'b0001)
		  r770 = din6;
	else if (address6 == 4'b0010)
		  r852 = din6;
	else if (address6 == 4'b0011)
		  r941 = din6;
	else if (address6 == 4'b0100)
		  r1209 = din6;
	else if (address6 == 4'b0101)
		  r1336 = din6;
	else if (address6 == 4'b0110)
		  r1477 = din6;
	else if (address6 == 4'b0111)
		  r1633 = din6;

	if (address7 == 4'b0000)
		  r697 = din7;
	else if (address7 == 4'b0001)
		  r770 = din7;
	else if (address7== 4'b0010)
		  r852 = din7;
	else if (address7 == 4'b0011)
		  r941 = din7;
	else if (address7 == 4'b0100)
		  r1209 = din7;
	else if (address7 == 4'b0101)
		  r1336 = din7;
	else if (address7 == 4'b0110)
		  r1477 = din7;
	else if (address7 == 4'b0111)
		  r1633 = din7;

	
	if (address8 == 4'b0000)
		  r697 = din8;
	else if (address8 == 4'b0001)
		  r770 = din8;
	else if (address8 == 4'b0010)
		  r852 = din8;
	else if (address8 == 4'b0011)
		  r941 = din8;
	else if (address8 == 4'b0100)
		  r1209 = din8;
	else if (address8 == 4'b0101)
		  r1336 = din8;
	else if (address8 == 4'b0110)
		  r1477 = din8;
	else if (address8 == 4'b0111)
		  r1633 = din8;


	//$display("r697 is %b",r697);
	//$display("r770 is %b",r770);
	//$display("r852 is %b",r852);
	//$display("r941 is %b",r941);
	//$display("r1209 is %b",r1209);
	//$display("r1336 is %b",r1336);
	//$display("r1477 is %b",r1477);
	//$display("r1633 is %b",r1633);
	//$display(r1209);
	//$display(r1336);
	//$display(r1477);
	//$display(r1633);
	a = ( r697 - r770);
	b =( r697 - r852);
	c =( r697 - r941);
	//if( a[16] == 1'b0 )
	//	$display (" r697 is greater than r770");
	//if( b[16] == 1'b0)
	//	$display (" r697 is greater than r852");
	//if( c[16] == 1'b0 )
	//	$display (" r697 is greater than r941");
	//$display ( a);
	//$display ( b);
	//$display ( c);
	a2 = r770 - r697;
	b2 = r770 - r852 ;
	c2 = r770 - r941;
	a3 = r852 - r697;
	b3 = r852 - r770;
	c3 = r852 - r941;
	a4 = r941 - r697;
	b4 = r941 - r770;
	c4 = r941 - r852;
	a5 = r1209 - r1336;
	b5 = r1209 - r1477;
	c5 = r1209 - r1633;
	a6 = r1336 - r1209;
	b6 = r1336 - r1477;
	c6 = r1336 - r1633;
	a7 = r1477 - r1209;
	b7 = r1477 - r1336;
	c7 = r1477 - r1633;
	a8 = r1633 - r1209;
	b8 = r1633 - r1336;
	c8 = r1633 - r1477;
	//if( a2[16] == 1'b0 )
	//	$display (" r770 is greater than r697");
	//if( b2[16] == 1'b0)
	//	$display (" r770 is greater than r852");
	//if( c2[16] == 1'b0 )
	//	$display (" r770 is greater than r941");
	//$display ( a2);
	//$display ( b2);
	//$display ( c2);
	if ( a[16] == 1'b0 && b[16] == 1'b0  && c[16] == 1'b0 )
	begin
		 // $display( " row 1");
		//$display ( a);
		//$display ( b);
		//$display ( c);
		  low = { 1'b0, 2'b00};
		  low_mag = r697;
	end
	
	else if ( a2[16] == 1'b0 && b2[16] == 1'b0 && c2[16] == 1'b0 )
	begin
		//  $display( " row 2");
		//$display ( a2);
		//$display ( b2);
		//$display ( c2);
		  low = { 1'b0, 2'b01};
		  low_mag = r770;
	end

	else if ( a3[16] == 1'b0 && b3[16] == 1'b0 && c3[16] == 1'b0 )
	begin
		// $display( " row 3");
		//$display ( a3);
		//$display ( b3);
		//$display ( c3);
		  low = { 1'b0, 2'b10};
		  low_mag = r852;
	end
	
	else if ( a4[16] == 1'b0 && b4[16] == 1'b0 && c4[16] == 1'b0 )
	begin
		// $display( " row 4");
		//$display ( a4);
		//$display ( b4);
		//$display ( c4);
		  low = { 1'b0, 2'b11};
		  low_mag = r941;
	end
	

	if ( a5[16] == 1'b0 && b5[16] == 1'b0 && c5[16] == 1'b0 )
	begin
		// $display( " col 1");
		//$display ( a5);
		//$display ( b5);
		//$display ( c5);
		  high = { 1'b0, 2'b00};
		  high_mag = r1209;
	end 
	
	else if ( a6[16] == 1'b0 && b6[16] == 1'b0 && c6[16] == 1'b0 )
	begin	
		//$display( " col 2");
		//$display ( a6);
		//$display ( b6);
		//$display ( c6);
		  high = { 1'b0, 2'b01};
		  high_mag = r1336;
	end
	
	else if  ( a7[16] == 1'b0 && b7[16] == 1'b0 && c7[16] == 1'b0 )
	begin	
		//$display( " col 3");
		//$display ( a7);
		//$display ( b7);
		//$display ( c7);
		  high = { 1'b0, 2'b10};
		  high_mag = r1477;
	end
	
	else if  ( a8[16] == 1'b0 && b8[16] == 1'b0 && c8[16] == 1'b0 )
	begin
		//$display( " col 4");
		//$display ( a8);
		//$display ( b8);
		//$display ( c8);
		  high = { 1'b0,2'b11};
		  high_mag = r1633;
	end
	
	
	
	//$display(high_mag);
	//$display(high);
	//$display(low_mag);
	//$display(low);
	//okay = 1'b1;
	//$display ( okay);
	//if ( okay == 1'b1)
	//begin
	//if ((!low[2] && !high[2]) ==1)

	if (low[2] == 1'b0 && high [2] == 1'b0)	
	begin
		   opa= low_mag;
		   opb = high_mag;
		   cmpf = opa - opb;
	//$display ("cmpf [15:0] is %b", cmpf[15:0]);
	//$display ("cmpf [16] is %b", cmpf[16]);
	//$display ("cmpr [] is %b", cmpr);

	if (cmpf[16] == 1'b1)
		begin
			cmpf = opa - {2'b0,opb[15:2]};
			cmpr = opb - opa;
		end	
	else
		begin	
			cmpf = opb - {2'b0,opa[15:2]};	
			cmpr = opa - opb;
		end
	//$display ("show cmpf %b", cmpf);
	//$display ("show cmpr %b", cmpr);
	okay = (~cmpf[16]) && (~cmpr[16]); 
	//$display ("show okay %b", okay);
	end	
	
	if ( okay)
	begin
		if ( {low[1:0], high[1:0]} == 4'b0000)
		begin
			   out_p1 = "1"; //$display ("#######################################  1 is found ##########");
		end
		else if ( {low[1:0], high[1:0]} == {2'b00, 2'b01} )
		begin
			   out_p1 = "2";//$display ("#######################################  2 is found ##########");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b00, 2'b10} )
		begin
			   out_p1 = "3";//$display ("#######################################  3 is found ##########");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b00, 2'b11} )
		begin
			   out_p1 = "a";//$display ("#######################################  a is found ##########");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b01, 2'b00} )
		begin
			   out_p1 = "4";//$display ("#######################################  4 is found ##########");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b01, 2'b01} )
		begin
			   out_p1 = "5";//$display ("#######################################  5 is found ########## ");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b01, 2'b10} )
		begin
			   out_p1 = "6";//$display ("#######################################  6 is found ##########");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b01, 2'b11} )
		begin
			   out_p1 = "b";//$display ("#######################################  b is found ########## ");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b10, 2'b00} )
		begin
			   out_p1 = "7";//$display ("#######################################  7 is found ##########");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b10, 2'b01} )
		begin
			   out_p1 = "8";//$display ("#######################################  8 is found ########## ");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b10, 2'b10} )
		begin
			   out_p1 = "9";//$display ("#######################################  9 is found ########## ");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b10, 2'b11} )
		begin
			   out_p1 = "c";//$display ("#######################################  c is found ##########");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b11, 2'b00} )
		begin
			   out_p1 = "*";//$display ("#######################################  *  is found ##########");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b11, 2'b01} )
		begin
			   out_p1 = "0";//$display ("#######################################  0  is found ##########");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b11, 2'b10} )
		begin
			   out_p1 = "#";//$display ("#######################################  #  is found ##########");
		end
		else if  ( {low[1:0], high[1:0]} == {2'b11, 2'b11} )
		begin
			   out_p1 = "d";//$display ("#######################################  d  is found  ##########");
		end
		else
		begin
			   out_p1 = nodigit;//$display ("########## No digit  is found ##########");
		end
	end
	
	//$display ( "out_p1 is %b", out_p1);
	//$display ( " var_x is %b" , var_x);
	//$display ( "not use sb.store is %b ", var_w);
	if ( var_x ==  pre_var)
		dout = out_p1;
	var_z = out_p1;
endfunction

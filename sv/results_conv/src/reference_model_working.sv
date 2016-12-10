function [7:0] reference_model ( input logic clk, input reset, input rcc_clk, input logic[7:0] var_x,input logic[3:0] address, input logic [15:0]din,
output logic [7:0] dout, output logic[7:0] var_z );

        logic [15:0] r697,r770,r852,r941,r1209,r1336,r1477,r1633,low_mag,high_mag;
	logic [2:0] low, high ;
	logic [7:0]  out_p1 ;
	logic okay;
	logic nodigit;
	logic [15:0] cmpf;
	logic [15:0] cmpr;
        //$display(address);
	//  dout = 2'b11;
	//var_z = 1'b1;	
	nodigit = 1'b0;
	if ( reset == 1'b1)
		begin

		//sb.digit_clk = 0 ; error
		//sb.dout_flag 	= 1 ; error

		out_p1          = 0;
		dout 		= 8'hff ;
		var_z 		= 8'hff ;
		low		= 0 ;
		high 		= 0 ;
		low_mag		= 0 ;
		high_mag	= 0 ;
		//int seen_quiet = 0;  //not need to use
		end

	if (address == 4'b0000)
		  r697 = din;
	else if (address == 4'b0001)
		  r770 = din;
	else if (address == 4'b0010)
		  r852 = din;
	else if (address == 4'b0011)
		  r941 = din;
	else if (address == 4'b0100)
		  r1209 = din;
	else if (address == 4'b0101)
		  r1336 = din;
	else if (address == 4'b0110)
		  r1477 = din;
	else if (address == 4'b0111)
		  r1633 = din;

	if ( r697 - r770 > 0 && r697 - r852 > 0  && r697 -r941 > 0)
	begin
		  low = { 1'b0, 2'b00};
		  low_mag = r697;
	end
	
	else if ( r770 - r697 > 0 && r770 - r852 >0 && r770 - r941 > 0 )
	begin
		  low = { 1'b0, 2'b01};
		  low_mag = r770;
	end

	else if ( r852 - r697 > 0 && r852 - r770 > 0 && r852 - r941 > 0)
	begin
		  low = { 1'b0, 2'b10};
		  low_mag = r852;
	end
	
	else if ( r941 - r697 > 0 && r941 - r770 > 0 && r941 - r852 > 0 )
	begin
		  low = { 1'b0, 2'b11};
		  low_mag = r941;
	end
	else
	begin

	end
	if ( r1209 - r1336 > 0 && r1209 - r1477 > 0 && r1209 - r1633 > 0)
	begin
		  high = { 1'b0, 2'b00};
		  high_mag = r1209;
	end 
	
	else if ( r1336 - r1209 > 0 && r1336 - r1477 > 0 && r1336 - r1633 > 0 )
	begin	
		  high = { 1'b0, 2'b01};
		  high_mag = r1336;
	end
	
	else if ( r1477 - r1209 > 0 && r1477 - r1336 > 0 && r1477 - r1633 > 0 )
	begin	
		  high = { 1'b0, 2'b10};
		  high_mag = r1477;
	end
	
	else if ( r1633 - r1209 > 0 && r1633 - r1336 > 0 && r1633 - r1477 > 0)
	begin
		  high = { 1'b0,2'b11};
		  high_mag = r1633;
	end

	if ( !low[2] && !high[2])
	begin
		int opa = low_mag;
		int opb = high_mag;
		int cmpf = opa - opb;
		if (cmpf[16])
		begin
			cmpf = opa - {2'b0,opb[15:2]};
			cmpr = opb - opa;
		end	
		else
		begin	
			cmpf = opb - {2'b0,opa[15:2]};	
			cmpr = opa - opb;
		end
		okay = (~cmpf[16]) && (~cmpr[16]); 
	end

	if ( okay == 1'b1)
	begin
		if ( {low[1:0], high[1:0]} == 4'b0000)
			  out_p1 = "1";
		else if ( {low[1:0], high[1:0]} == {2'b00, 2'b01} )
			  out_p1 = "2";
		else if  ( {low[1:0], high[1:0]} == {2'b00, 2'b10} )
			  out_p1 = "3";
		else if  ( {low[1:0], high[1:0]} == {2'b00, 2'b11} )
			  out_p1 = "a";
		else if  ( {low[1:0], high[1:0]} == {2'b01, 2'b00} )
			  out_p1 = "4";
		else if  ( {low[1:0], high[1:0]} == {2'b01, 2'b01} )
			  out_p1 = "5";
		else if  ( {low[1:0], high[1:0]} == {2'b01, 2'b10} )
			  out_p1 = "6";
		else if  ( {low[1:0], high[1:0]} == {2'b01, 2'b11} )
			  out_p1 = "b";
		else if  ( {low[1:0], high[1:0]} == {2'b10, 2'b00} )
			  out_p1 = "7";
		else if  ( {low[1:0], high[1:0]} == {2'b10, 2'b01} )
			  out_p1 = "8";
		else if  ( {low[1:0], high[1:0]} == {2'b10, 2'b10} )
			  out_p1 = "9";
		else if  ( {low[1:0], high[1:0]} == {2'b10, 2'b11} )
			  out_p1 = "c";
		else if  ( {low[1:0], high[1:0]} == {2'b11, 2'b00} )
			  out_p1 = "*";
		else if  ( {low[1:0], high[1:0]} == {2'b11, 2'b01} )
			  out_p1 = "0";
		else if  ( {low[1:0], high[1:0]} == {2'b11, 2'b10} )
			  out_p1 = "#";
		else if  ( {low[1:0], high[1:0]} == {2'b11, 2'b11} )
			  out_p1 = "d";
		else
			  out_p1 = nodigit;
	end
	
	var_z = out_p1;
	if ( out_p1 == var_x)
		$display(" valid digit");
		dout = out_p1;
endfunction

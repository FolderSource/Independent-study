interface intf_cnt( input clk);

	var logic reset;
	var logic [3:0] address;
	var logic [3:0] address1;
	var logic [3:0] address2;
	var logic [3:0] address3;
	var logic [3:0] address4;
	var logic [3:0] address5;
	var logic [3:0] address6;
	var logic [3:0] address7;
	var logic [3:0] address8;
	var logic [3:0] address9;

	var logic [15:0] din;
	var logic [15:0] din1;
	var logic [15:0] din2;
	var logic [15:0] din3;
	var logic [15:0] din4;
	var logic [15:0] din5;
	var logic [15:0] din6;
	var logic [15:0] din7;
	var logic [15:0] din8;
	var logic [15:0] din9;

	var logic rcc_clk;
	var logic test_mode;
	var logic [7:0] dout;
	var logic dout_flag;
	var logic digit_clk;
endinterface

module test();
	reg clk = 0;
	initial 
	forever #25 clk = ~clk;

	intf_cnt intf(clk);
	// test_sv DUT (clk, intf.reset, intf.data, others);
	results_conv top (clk, intf.reset, intf.rcc_clk, intf.address, intf.din, intf.digit_clk, intf.dout, intf.dout_flag, 0,0,0, scan_out0, scan_out1 ); 
	testcase test(intf);
	assertion_cov acov(intf); 
endmodule

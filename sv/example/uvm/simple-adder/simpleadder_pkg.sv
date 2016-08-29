package simpleadder_pkg;
	import uvm_pkg::*;
`ifdef CDSIRUN
	// enable mixed-language UVM communication
	import ml_uvm::*;
`endif

	`include "simpleadder_sequencer.sv"
	`include "simpleadder_monitor.sv"
	`include "simpleadder_driver.sv"
	`include "simpleadder_agent.sv"
	`include "simpleadder_scoreboard.sv"
	`include "simpleadder_config.sv"
	`include "simpleadder_env.sv"
	`include "simpleadder_test.sv"
endpackage: simpleadder_pkg

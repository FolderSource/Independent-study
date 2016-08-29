////////////////////////////////////////////////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////s           www.testbench.in           s////
////s                                      s////
////s        SystemVerilog Tutorial        s////
////s                                      s////
////s           gopi@testbench.in          s////
////s~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~s////
////////////////////////////////////////////////

  program testcase(intf_cnt intf);
         environment env = new(intf);
         
         initial
         begin
              $timeformat(-9,2,"ns", 16);
              env.drvr.reset();
              env.drvr.drive(10);
         end
    endprogram

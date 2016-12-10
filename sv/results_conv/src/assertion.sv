   module assertion_cov(intf_cnt intf);
       Feature_3 : cover property (@(posedge intf.clk)  (intf.din !=0)  |-> intf.reset == 1 );
    endmodule

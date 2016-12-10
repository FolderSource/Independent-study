program testcase(intf_cnt intf);
  environment env = new(intf);
  
  initial
  begin
    $timeformat(-9,2,"ns", 16);
    env.drv.reset();
    env.drv.drive(10000);
    //env.drv.reset();
    //env.drv.drive(100);
//$display("coverage:%f",env.get_coverage()); 
  end
endprogram

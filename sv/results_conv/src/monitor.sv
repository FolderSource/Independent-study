 class monitor;
          scoreboardt sb;
          virtual intf_cnt intf;
          
          function new(virtual intf_cnt intf,scoreboardt sb);
               this.intf = intf;
               this.sb = sb;
          endfunction
          
          task check();
              forever
		@(posedge intf.digit_clk)
			begin
					
					//$display ("DIGIT CLK is 1");
					if( sb.store != intf.dout)
					begin
						$display ("ERROR ERROR ERROR"); 
						 $display(" * ERROR * %t DUT out is %b :: SB store is %b ", $time, intf.dout,sb.store );
						$finish; 
					end
			end
              //if(sb.store != intf.count) // Get expected value from scoreboardt and compare with DUT output
              //    $display(" * ERROR * %t DUT count is %b :: SB count is %b ", $time, intf.count,sb.store );
              //else
              //    $display("           %t DUT count is %b :: SB count is %b ", $time, intf.count,sb.store );
		$display( "   checking    ");
		
          endtask
    endclass

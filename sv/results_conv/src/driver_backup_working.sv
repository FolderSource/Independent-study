class driver;
        stimulus sti;
        scoreboardt sb;
   	//logic [7:0] dout2;
	//logic [7:0] var3;
        covergroup cov;
             Feature_1: coverpoint sb.store ;
        //     Feature_2 :  coverpoint  sb.store  {  bins trans = ( 15 => 0) ;} 
        endgroup
        
        virtual intf_cnt intf;
        
        function  new (virtual intf_cnt intf,scoreboardt sb);
             this.intf = intf;
             this.sb = sb;
             //cov = new();
        endfunction
        
	
        task reset();  // Reset method

             intf.din = 0;
	     intf.reset = 0;
             @ (negedge intf.clk);
	     @ (negedge intf.clk);
             intf.reset = 1;
             @ (negedge intf.clk);
	     @ (negedge intf.clk);
             intf.reset = 0;
           
        endtask
        
        task drive(input integer iteration); //var input itreation is not used
		//sb.array1.push_front(0);
		reg[7:0] array1[$];
		array1.push_front(0);
		//foreach ( sb.array1[i])
		//	$display(sb.array1[i]);
		//while( dutout == modelout)
		sb.var_x = 1'b0;
		repeat(1024)
		begin
			sti = new();
			sti.randomize();
			repeat(sti.count)
			begin
				repeat(4)
				begin				
					@(posedge intf.clk);
				end
				
				@(posedge intf.clk);
				intf.address = 0;	
				intf.din = sti.din;				
				@(posedge intf.clk);
				intf.rcc_clk = 1;
				@(posedge intf.clk);
				intf.rcc_clk = 0;
				@(posedge intf.clk);
				intf.din = 'bz;				
					
				repeat(8)
				begin
					@(posedge intf.clk);
					//address1 = 0
					intf.address = intf.address +1;
					//address2 = intf.address
					sti.randomize();
					intf.din = sti.din;
					
					@(posedge intf.clk);
					intf.rcc_clk = 1;
					@(posedge intf.clk);
					intf.rcc_clk = 0;
					@(posedge intf.clk);
					intf.din = 'bz;	
				end
				
				reference_model(intf.clk, intf.reset, intf.rcc_clk, sb.var_x,intf.address,intf.din,sb.store,sb.var_z);
				//$display ( intf.address);
				//$display(sb.store);
				$display(sb.var_z);
				intf.address = 0;
				repeat(160)
				begin
					@(posedge intf.clk);	
				end
			end		

			sti.randomize();
			repeat(sti.count)
			begin
				repeat(4)
				begin				
					@(posedge intf.clk);
				end

				@(posedge intf.clk);
				intf.address = 0;	
				intf.din = 0;				
				@(posedge intf.clk);
				intf.rcc_clk = 1;
				@(posedge intf.clk);
				intf.rcc_clk = 0;
				@(posedge intf.clk);
				intf.din = 'bz;	

				repeat(8)
				begin
					@(posedge intf.clk);
					intf.address = intf.address +1;
				
					intf.din = 0;
					@(posedge intf.clk);
					intf.rcc_clk = 1;
					@(posedge intf.clk);
					intf.rcc_clk = 0;
					@(posedge intf.clk);
					intf.din = 'bz;	
				end
				

				intf.address = 0;
				repeat(160)
				begin
					@(posedge intf.clk);	
				end
			end
				
		end
  	endtask

	
   endclass
   //          repeat(iteration)
  //           begin
 //                 sti = new();
  //                @ (negedge intf.clk);
  //                if(sti.randomize()) // Generate stimulus
  //                    intf.din = sti.din; // Drive to DUT
 //                // sb.store = sb.store + sti.value;// Cal exp value and store in scoreboardt
 //                 if(sti.din )
 //                //     cov.sample();
//             end
      

class driver;
        stimulus sti;
        scoreboardt sb;
	reg [7:0] var1;   	

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
		int counter = 0;
		reg[7:0] array1[10000:0];
		array1[0] = 0
		//foreach ( sb.array1[i])
		//	$display(sb.array1[i]);
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
					intf.address = intf.address +1;
					sti.randomize();
					intf.din = sti.din;
					
					@(posedge intf.clk);
					intf.rcc_clk = 1;
					@(posedge intf.clk);
					intf.rcc_clk = 0;
					@(posedge intf.clk);
					intf.din = 'bz;	
				end
				
				//sb.store, var1 = reference_model(intf.clk, intf.reset, intf.rcc_clk, intf.address,intf.din,0, 0,  0, var1);
				//counter = counter + 1;
				
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
      

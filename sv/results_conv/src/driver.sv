class driver;
        stimulus sti;
        scoreboardt sb;	
	monitor mntr;
   	//logic [7:0] dout2;
	//logic [7:0] var3;
	logic [7:0] pre_var;
	logic [7:0] var_w;
	logic [7:0] dout1;

        covergroup cv1 @(posedge sb.digit_clk);
             //Feature_1: coverpoint sb.store ;
			
            Feature_2 :  coverpoint  sti.din; //  {  bins trans = ( 15 => 0) ;} 
        endgroup
        
	
        virtual intf_cnt intf;
        
        function  new (virtual intf_cnt intf,scoreboardt sb);
             this.intf = intf;
             this.sb = sb;
	     this.mntr = mntr;
             cv1 = new();
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
		//reg[7:0] array1[$];
		//array1.push_front(0);
		//foreach ( sb.array1[i])
		//	$display(sb.array1[i]);
		//while( dutout == modelout)
		var_w = 8'hff;
		sb.var_x = 8'hff;
		//intf.dout = 8'hff;
		pre_var = 8'hff;
		//pre_dout1 = 8'hff;
		while( iteration ) 
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
				intf.address1 = intf.address;	
				intf.din = sti.din;
				intf.din1 = sti.din;				
				@(posedge intf.clk);
				intf.rcc_clk = 1;
				@(posedge intf.clk);
				intf.rcc_clk = 0;
				@(posedge intf.clk);
				intf.din = 'bz;				
					
				
				begin

				@(posedge intf.clk);
				intf.address = intf.address +1;
				intf.address2 = intf.address;
				sti.randomize();
				intf.din = sti.din;
				intf.din2 = sti.din;					
				@(posedge intf.clk);
				intf.rcc_clk = 1;
				@(posedge intf.clk);
				intf.rcc_clk = 0;
				@(posedge intf.clk);
				intf.din = 'bz;	

				@(posedge intf.clk);
				intf.address = intf.address +1;
				intf.address3 = intf.address;
				sti.randomize();
				intf.din = sti.din;
				intf.din3 = sti.din;					
				@(posedge intf.clk);
				intf.rcc_clk = 1;
				@(posedge intf.clk);
				intf.rcc_clk = 0;
				@(posedge intf.clk);
				intf.din = 'bz;	

				@(posedge intf.clk);
				intf.address = intf.address +1;
				intf.address4 = intf.address;
				sti.randomize();
				intf.din = sti.din;
				intf.din4 = sti.din;					
				@(posedge intf.clk);
				intf.rcc_clk = 1;
				@(posedge intf.clk);
				intf.rcc_clk = 0;
				@(posedge intf.clk);
				intf.din = 'bz;	

				@(posedge intf.clk);
				intf.address = intf.address +1;
				intf.address5 = intf.address;
				sti.randomize();
				intf.din = sti.din;
				intf.din5 = sti.din;					
				@(posedge intf.clk);
				intf.rcc_clk = 1;
				@(posedge intf.clk);
				intf.rcc_clk = 0;
				@(posedge intf.clk);
				intf.din = 'bz;	

				@(posedge intf.clk);
				intf.address = intf.address +1;
				intf.address6 = intf.address;
				sti.randomize();
				intf.din = sti.din;
				intf.din6 = sti.din;					
				@(posedge intf.clk);
				intf.rcc_clk = 1;
				@(posedge intf.clk);
				intf.rcc_clk = 0;
				@(posedge intf.clk);
				intf.din = 'bz;	
				
				
				@(posedge intf.clk);
				intf.address = intf.address +1;
				intf.address7 = intf.address;
				sti.randomize();
				intf.din = sti.din;
				intf.din7 = sti.din;					
				@(posedge intf.clk);
				intf.rcc_clk = 1;
				@(posedge intf.clk);
				intf.rcc_clk = 0;
				@(posedge intf.clk);
				intf.din = 'bz;	
				
				
				@(posedge intf.clk);
				intf.address = intf.address +1;
				intf.address8 = intf.address;
				sti.randomize();
				intf.din = sti.din;
				intf.din8 = sti.din;					
				@(posedge intf.clk);
				intf.rcc_clk = 1;
				@(posedge intf.clk);
				intf.rcc_clk = 0;
				@(posedge intf.clk);
				intf.din = 'bz;	

				@(posedge intf.clk);
				intf.address = intf.address +1;
				intf.address9 = intf.address;
				sti.randomize();
				intf.din = sti.din;
				intf.din9 = sti.din;					
				@(posedge intf.clk);
				intf.rcc_clk = 1;
				@(posedge intf.clk);
				intf.rcc_clk = 0;
				@(posedge intf.clk);
				intf.din = 'bz;	
				
				
				end

				@(posedge intf.clk);
				begin
				intf.din = sti.din;
				intf.address = 4'b1000;
				end

				reference_model(intf.clk,intf.reset,intf.rcc_clk,sb.var_x,pre_var,intf.address1,intf.din1,intf.address2,intf.din2,intf.address3,intf.din3,intf.address4,intf.din4,intf.address5,intf.din5,intf.address6,intf.din6,intf.address7,intf.din7,intf.address8,intf.din8, dout1,sb.var_z);
				pre_var = sb.var_z;
				sb.var_x = sb.var_z;
				//var_w = sb.var_z;
				sb.store = dout1;
				//if( sb.var_x == pre_var)
				//	sb.store = sb.var_x;
				if ( sti.din)
					cv1.sample();
				//intf.address = 0;

				@(posedge intf.clk);
				intf.rcc_clk = 1;
				@(posedge intf.clk);
				intf.rcc_clk = 0;
				
				

				@(posedge intf.clk);
				intf.address =0;

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
				
				@(posedge intf.clk);
				begin 
					intf.din = 0;
					intf.address = 4'b1000;
				end				

				//reference_model(intf.clk, intf.reset, intf.rcc_clk, sb.var_x,intf.address1,0,intf.address2,0,
				//intf.address3,0,intf.address4,0, intf.address5,0,intf.address6,0,
				//intf.address7,0,intf.address8,0, sb.store,sb.var_z);
				
				
				//$display(intf.address);
				//$display(" store in scoreboard is %b", sb.store);
				//$display(" store in dut is %b", intf.dout);
				//$display (" var x is %b", sb.var_x);
				//$display (" var y is %b", sb.var_z);
//need this
				//if( sb.var_x == var_w)
				//	sb.store = sb.var_x;
				//sb.var_x = var_w;
				//var_w = sb.var_z;
					
				//if ( sb.var_z == dout1)
				//	pre_var = dout1;
				//$display ("******************  sb.store is %b  ", sb.store);
				// sb.store was dout

				//sb.store = sb.var_z;
				//$display("  %t DUT out is %b :: SB store is %b ", $time, intf.dout,sb.store);

				//sb.store = dout1;
				//$display("  %t DUT out is %b :: SB store is %b ", $time, intf.dout,dout1 );

				//@(posedge intf.digit_clk )
				//begin
				//	$display ( " digit_clk is 1");
				//	if( sb.store != intf.dout)
				//		$display ("ERROR ERROR ERROR"); 
					
				//end

				//if( intf.digit_clk != 0)
				//	begin
				//	$display ( " digit_clk is 1");
				//	if( dout1 != intf.dout)
				//		$display ("ERROR ERROR ERROR"); 
				//	end

				//if ( intf.dout != dout1)
					//$display ("ERROR ERROR ERROR"); 
					//$display ("GOOD GOOD GOOD");
				//$exit;
				//$display(" store in dut after time is %b", intf.dout);

				@(posedge intf.clk);
				intf.address = 0;

				repeat(160)
				begin
					@(posedge intf.clk);	
				end
			end
			
			iteration = iteration -1;	
		end
		$display("coverage:%f",cv1.get_coverage());
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
      

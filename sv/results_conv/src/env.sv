class environment;
	driver drv;
	scoreboardt sb;
	monitor mntr;
	virtual intf_cnt intf;

	function new(virtual intf_cnt intf);
		this.intf = intf;
		sb = new();
		drv = new(intf,sb);
		mntr = new (intf,sb);
		fork
			mntr.check();
		join_none
	endfunction
endclass

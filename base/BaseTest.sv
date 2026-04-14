`ifndef __BaseTest__SV__
`define __BaseTest__SV__

class CBaseTest #(type VBUS, ENV) extends CBaseComponent;
ENV env; 

    function new(CBaseComponent parrent, string strName);
		super.new(parrent, strName);
		env = new(this, "ENV");
	endfunction
	
	function void connect(virtual hostif vbus);
        env.connect(vbus);
    endfunction

	function void Init();
	    env.Init();
    endfunction

    task Start();
	    env.Start();
    endtask

    task Run();
	    env.Run();
    endtask
endclass

`endif //__BaseTest__SV
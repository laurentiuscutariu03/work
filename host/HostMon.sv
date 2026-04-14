
`ifndef __CHostMon__SV__
`define __CHostMon__SV__


class CHostMon extends CBaseMon;

    virtual hostif.MON vbus;

    function new(CBaseComponent parrent, string strName);
		super.new(parrent, strName);
    endfunction


    function void connect(virtual hostif.MON vbus);
        this.vbus = vbus;
    endfunction


    task Run();
	forever begin
          DetectActivity();
          bReady2Finish = 0;
          Collect();
          bReady2Finish = 1;
	end
    endtask

    task DetectActivity();
        #100000;
    endtask
 
    task Collect();
		#1;
    endtask



endclass   

`endif //__CHostMon__SV
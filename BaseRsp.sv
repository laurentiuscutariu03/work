`ifndef __BaseRSP__SV__
`define __BaseRSP__SV__

virtual
class CBaseRsp 
		#(type VBUS /* = virtual bus.DRV*/, 
		       MBX /*= data_mailbox*/, 
			   TR /*= CDataTransaction*/) 
		extends CBaseComponent;
		
	
    VBUS vbus;
    MBX mbx;
    event ev_go;

    function new(CBaseComponent parrent, string strName);
		super.new(parrent, strName);
    endfunction

    function void connect(VBUS vbus, MBX mbx);
        this.vbus = vbus;
        this.mbx = mbx;
    endfunction

    pure virtual function void InitSignals();

    pure virtual task Response(TR tr);	 

    task Run();
	    TR tr;
        forever begin
          mbx.get(tr);
          $display(`DISPLAY(tr.DISPLAY()));
          bReady2Finish = 0;
	  Response(tr);
          ->ev_go;
	  bReady2Finish = 1;
        end
    endtask



endclass



`endif //__BaseRSP__SV__

`ifndef __BaseDRV__SV__
`define __BaseDRV__SV__

virtual 
class CBaseDrv 
        #(type VBUS, MBX, TR) 
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

    pure virtual task Drive(TR tr);     

    task Run();
        TR tr;
        forever begin
          mbx.get(tr);
          $display(`DISPLAY(tr.DISPLAY()));
          bReady2Finish = 0;
      Drive(tr);
          ->ev_go;
      bReady2Finish = 1;
        end
    endtask

endclass



`endif //__BaseDRV__SV

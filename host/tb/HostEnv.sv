`ifndef __HostENV__SV__
`define __HostENV__SV__


class CHostEnv extends CBaseEnv #(.VBUS(virtual hostif));    
    CHostAgent#(ACTIVE) agA;
    CHostAgent#(PASIVE) agP;
    CHostAgent#(REACTIVE) agR;

    function new(CBaseComponent parrent, string strName);
        super.new(parrent, strName);
        agA = new(this, "aG_ACTIVE"); 
        agP = new(this, "aG_PASIVE");
        agR = new(this, "aG_REACTIVE");
    endfunction

    function void connect(VBUS vbus);
        agA.connect(vbus);
        agP.connect(vbus);
        agR.connect(vbus);
    endfunction

    function void Init();
        agA.Init();
        agP.Init();
        agR.Init();
    endfunction

    task Start();
        agA.Start();
        agP.Start();
        agR.Start();
    endtask

    task Run();
        agA.Run();
        agR.Run();
        agR.Run();
    endtask

endclass

`endif //__HostENV__SV

`ifndef __BaseAgent__SV__
`define __BaseAgent__SV__

typedef enum {ACTIVE, PASIVE, REACTIVE} Mode_t;

class CBaseAgent 
       #(Mode_t mode = ACTIVE, type BUS, MBX , GEN, DRV, MON) 
          extends CBaseComponent;
   MBX mbx;
   event ev_go;
   GEN mgen_sgen;
   DRV drv_rsp;
   MON mon;

   function new(CBaseComponent parrent, string strName);
        super.new(parrent, strName);
        mbx = new;
       if( mode == ACTIVE) begin 
           drv_rsp = new(this, "DRV");
           mgen_sgen = new(this, "MGEN");  
       end else if(  mode == REACTIVE ) begin
           drv_rsp = new(this, "RSP");
           mgen_sgen = new(this, "SGEN");       
       end

       mon = new(this, "MON");
    
    endfunction

    function void connect(BUS vbus);
        if( mode == ACTIVE) begin 
            drv_rsp.connect(vbus, mbx);
            mgen_sgen.connect(mbx);
        end
        if( mode == ACTIVE) begin 
            drv_rsp.ev_go = ev_go;
            mgen_sgen.ev_go = ev_go;
        end       
        
        mon.connect(vbus);

    endfunction

    function void Init();
        if( mode == ACTIVE || mode == REACTIVE) begin 
            drv_rsp.InitSignals();
        end
    endfunction

    task Start();
        fork   
            mon.Run();
            if( mode == ACTIVE) begin 
                drv_rsp.Run(); 		
            end
        join_none
    endtask

    task Run();
        fork   
            if( mode == ACTIVE) begin 
                mgen_sgen.Run();
            end
        join
    endtask
endclass	

`endif //__BaseAgent__SV

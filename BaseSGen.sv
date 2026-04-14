  
`ifndef __BaseSGen__SV__
`define __BaseSGen__SV__


class CBaseSGen
        #(type MBX, TR) 
        extends CBaseComponent;
    event ev_go;
    MBX mbx;
        function new(CBaseComponent parrent, string strName);
		super.new(parrent, strName);
	endfunction
	
    function void connect(MBX mbx);
        this.mbx = mbx;
    endfunction

    task Run();
        TR tr;
        bReady2Finish = 0;
	repeat(5) begin
		tr = new;
                assert(tr.randomize());
                $display(`DISPLAY(tr.DISPLAY()));
                mbx.put(tr);
              //  @ev_go;
        end
        bReady2Finish = 1;
    endtask
endclass


`endif //__BaseSGen__SV

`ifndef __HostTest__SV__
`define __HostTest__SV__

class CHostTest extends CBaseTest #(.VBUS (virtual hostif), .ENV(CHostEnv));

    function new(CBaseComponent parrent, string strName);
        super.new(parrent, strName);
    endfunction

endclass


`endif //__HostTest__SV
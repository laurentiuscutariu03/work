
`ifndef __CHostAgent__SV__
`define __CHostAgent__SV__


class CHostAgent  #(Mode_t mode = ACTIVE) extends CBaseAgent #(.mode(mode), .BUS(virtual hostif), .MBX(host_mailbox), .GEN(CHostMGen), .DRV(CHostDrv), .MON(CHostMon));

    function new(CBaseComponent parrent, string strName);
		super.new(parrent, strName);
    endfunction

endclass

`endif //__CHostAgent__SV
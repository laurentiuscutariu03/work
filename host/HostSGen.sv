
`ifndef __HostSGen__SV__
`define __HostSGen__SV__

class CHostSGen extends 
    CBaseSGen #(.MBX(host2_mailbox), .TR(CHostTransaction2));

    function new(CBaseComponent parrent, string strName);
	super.new(parrent, strName);
    endfunction

endclass		

`endif //__HostSGen__SV
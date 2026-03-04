
`ifndef __HostSGen__SV__
`define __HostSGen__SV__

class CHostSGen extends 
//	CSGenBase #(.MBX(data_mailbox), .TR(HostTransaction));
    CBaseSGen;

	function new(CBaseComponent parrent, string strName);
		super.new(parrent, strName);
    endfunction

endclass		

`endif //__HostSGen__SV
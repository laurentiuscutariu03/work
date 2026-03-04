
`ifndef __CHostMGen__SV__
`define __CHostMGen__SV__

class CHostMGen extends CBaseMGen #(.MBX(host_mailbox), .TR(CHostTransaction));

	function new(CBaseComponent parrent, string strName);
		super.new(parrent, strName);
    endfunction

endclass		

`endif //__CHostMGen__SV

`ifndef __BaseOBJECT_SV__
`define __BaseOBJECT_SV__

class CBaseObject;
	static int m_nClkCycle;
	static function string GetCurrentTime();
		GetCurrentTime = $psprintf("@ time: %0t ns (clk cycle: %0d)", $time/10, m_nClkCycle);
	endfunction

endclass

`endif //__BaseOBJECT_SV__	




	

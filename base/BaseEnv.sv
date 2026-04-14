`ifndef __BaseENV__SV__
`define __BaseENV__SV__

virtual
class CBaseEnv #(type VBUS) extends CBaseComponent;
        function new(CBaseComponent parrent, string strName);
		super.new(parrent, strName);
	endfunction
	
	pure virtual function void connect(VBUS vbus);

	pure virtual function void Init();

    pure virtual task Start();

    pure virtual task Run();
endclass

`endif //__BaseENV__SV
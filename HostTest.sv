`ifndef __BaseTest__SV__
`define __BaseTest__SV__

class CHostTest extends CBaseTest;
 CHostAgent#(ACTIVE) ag;

        function new(CBaseComponent parrent, string strName);
		super.new(parrent, strName);
                   ag = new(this, "AGENT");
        endfunction

function void connect(virtual bus vbus);
    ag.connect(vbus);
  endfunction

  function void Init();
    ag.Init();
  endfunction

  task Start();
    ag.Start();
  endtask

  task Run();
    ag.Run();
  endtask

endclass
 /*   CComponent t;
    t = new(null, "TEST");

/*
    CComponent t;
    CComponent e;
    HostAgent agTx;
    CRxAgent agRx;
   
    e = new(t, "ENV");
    agTx = new(e, "AGENT_TX"); 
    agRx = new(e, "AGENT_RX"); 

    agTx.connect(b_if);
    agRx.connect(b_if);

    agTx.Init();
    agRx.Init();

    $display(CComponent::DisplayTree());
    agTx.Start();
    agRx.Start();
	
	// t = 0
// ----- run -----
  fork 
    agTx.Run();
    agRx.Run();
  join


//TODO: mecanismul de adaugat in CComponent 
// folosind structura ierarhica de componente
  wait(agTx.drv.bReady2Finish & agTx.mon.bReady2Finish & agTx.gen.bReady2Finish 
        & (agTx.mbx.num()==0) &
    agRx.drv.bReady2Finish & agRx.mon.bReady2Finish & agRx.gen.bReady2Finish 
        & (agRx.mbx.num()==0) 
    )
	#1;

// ----- post-run ---
    #100;

// ----- altele -----

    $display(t.`DISPLAY("Finish!")); // $display(drv.display("Finish!", __FILE__, __LINE__));

*/

`endif //__BaseTest__SV
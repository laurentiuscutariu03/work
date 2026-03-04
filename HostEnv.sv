`ifndef __BaseENV__SV__
`define __BaseENV__SV__


class CHostEnv extends CBaseEnv;
        function new(CBaseComponent parrent, string strName);
		super.new(parrent, strName);
                 
	endfunction
	  CBAseComponent t;
          CBaseComponent e;
          HostAgent agTx;
          e = new(t, "ENV");
          agTx = new(e, "AGENT_TX"); 
          
          agTx.connect(b_if);

          agTx.Init();
          $display(CBAseComponent::DisplayTree());
         
           agTx.Start();
           
          fork 
               agTx.Run();
          join
            wait(agTx.drv.bReady2Finish & agTx.mon.bReady2Finish & agTx.gen.bReady2Finish 
        & (agTx.mbx.num()==0) 
    )
	#1;


    #100;



endclass

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

`endif //__BaseENV__SV
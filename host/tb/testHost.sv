`timescale 1ns / 100ps

import base::*;
import host::*;
import hostTB::*;


program verif(hostif hif);
    CHostTest t;
	
	initial begin
        t = new(null, "TEST");
	    t.connect(hif);
		
		t.Init();
		
		t.Start();
		
		t.Run();
//TODO: mecanismul de adaugat in CComponent 
// folosind structura ierarhica de componente
//  wait(agTx.drv.bReady2Finish & agTx.mon.bReady2Finish & agTx.gen.bReady2Finish 
//        & (agTx.mbx.num()==0) &
//    agRx.drv.bReady2Finish & agRx.mon.bReady2Finish & agRx.gen.bReady2Finish 
//        & (agRx.mbx.num()==0) 
//    )
	#1;

// ----- post-run ---
    #100;
	
	
//	$display(t.`DISPLAY("Finish!")); // $display(drv.display("Finish!", __FILE__, __LINE__));
	end

endprogram


module testHost();

    reg clock;
    reg reset;

    hostif hif(.clk(clock));
                            
    verif(.hif(hif));

    always 
        #5 clock = ~clock;


    always @(posedge clock)
	CBaseObject::m_nClkCycle++;

initial clock = 0;

initial begin
  reset = 1'b0;
  
  hif.InitDRV();
  hif.InitRSP();
  
  #5 reset = 1'b1;
  #20 reset = 1'b0;
  
  #30;
  hif.command_write(0, 2);
  hif.command_write(1, 4);
  
  hif.command_read(0);
  
#100
  $stop;

end

endmodule 
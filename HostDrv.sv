`ifndef __HostDrive__SV__
`define __HostDrive__SV__

  

class CHostDrv extends CBaseDrv #(.VBUS (virtual hostif.DRV), .MBX(host_mailbox), .TR(CHostTransaction));

    function new(CBaseComponent parrent, string strName);
		super.new(parrent, strName);
    endfunction

    function void InitSignals();
 //     vbus.data <= 8'b0;
  //    vbus.data_vld <= 1'b0;
    endfunction

    task Drive(TR tr);	 
//      wait(vbus.clk ==0);
/*      @(negedge vbus.clk);

      vbus.data_vld <= 1'b1;
      vbus.data <= {tr.Length, tr.Addr};
 
      foreach( tr.Payload[i] ) begin
        @(negedge vbus.clk);
        vbus.data <= tr.Payload[i];
      end

      @(negedge vbus.clk);
      vbus.data_vld <= 1'b0;
      vbus.data <= tr.Parity;

      @(negedge vbus.clk);
      vbus.data <= 8'b0;
*/		
    endtask

endclass

`endif

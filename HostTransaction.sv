`ifndef __HostTransaction__SV__
`define __HostTransaction__SV__


class CHostTransaction extends CBaseTransaction;
	
//       rand logic [1:0] Addr;
//       rand logic [5:0] Length;
//       rand logic [7:0] Payload[];
//	    logic [7:0] Parity;

       function new();
		  super.new();
		  strNameTransactionType = "HostTransaction";	
	  endfunction

function string DisplayExtraData();   // virtual
//   string strTemp;
//   DisplayExtraData = $psprintf("Header: 0x%h [Length= %d, Addr=%d], data length: %0d, data[0] = 0x%h, ..., Parity: 0x%h", 
//		{Length, Addr}, Length, Addr, Payload.size(), Payload[0], Parity );
endfunction

//   function void pre_randomize();
//     Payload.delete;
//   endfunction

//   function void post_randomize();
//     Parity = calc_parity();
//   endfunction

//   function logic [7:0] calc_parity();
//      calc_parity = {Length, Addr} ^ Payload.xor;
//   endfunction

/*   constraint Payload_size {
     Payload.size > 0;
     Payload.size < 10;

     Payload.size == Length;
   }
*/
endclass

typedef mailbox #(CHostTransaction) host_mailbox;

virtual
class CHostTransaction2 extends CBaseTransaction;
    function new();
        super.new();
        strNameTransactionType = "HostTransaction";	
    endfunction
endclass

typedef mailbox #(CHostTransaction2) host2_mailbox;


`endif //__HostTransaction__SV

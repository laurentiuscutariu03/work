`timescale 1ns/100ps

interface hostif(input bit clk);
	logic          hen,           //  
	               hwr_rd;        // rd = 0, wr = 1
	logic    [7:0] haddr;
	wire     [7:0] hdata; 

    // internal signals
	logic          hdata_in;
        logic    [7:0] hdata_out_DRV;
        logic    [7:0] hdata_out_RSP;
 
        logic          hdata_out_en_DRV;
        logic          hdata_out_en_RSP;

    // internal logic
	assign hdata_in = hdata;
	assign hdata = hdata_out_en_DRV ? hdata_out_DRV : 8'bz;	
	//assign hdata = hdata_out_en_RSP ? hdata_out_RSP : 8'bz;	

    function void InitDRV();
        hen <= 1'b0;
        hwr_rd <= 1'b0;
		haddr <=8'b0;
		hdata_out_en_DRV <= 1'b0;
		hdata_out_DRV <= 8'b0;
	endfunction
	
    function void InitRSP();
		hdata_out_en_RSP <= 1'b0;
		hdata_out_RSP <= 8'b0;	
	endfunction
	
	task command_write(input logic [7:0]addr, logic [7:0]data);
	   @(negedge clk);
	   hen <= 1'b1;
	   hwr_rd <= 1'b1;  // write
	   haddr <= addr;
	   hdata_out_DRV = data;
	   hdata_out_en_DRV = 1'b1;

           // finish
	   @(negedge clk);
	   hen <= 1'b0;
	   hwr_rd <= 1'b0;  
	   haddr <= 8'b0;
	   hdata_out_DRV = 8'b0;
	   hdata_out_en_DRV = 1'b0;
	endtask
	
    task command_read(input logic [7:0] addr);
	   @(negedge clk);
	   hen <= 1'b1;
	   hwr_rd <= 1'b0;  // read
	   haddr <= addr;

	   @(negedge clk);
           // read data

           // finish
	   @(negedge clk);
	   hen <= 1'b0;
	   hwr_rd <= 1'b0;  
	   haddr <= 8'b0;	
	endtask
	
    //modport
    modport SLAVE(input hen, hwr_rd, haddr, inout hdata);
    modport MASTER(output hen, hwr_rd, haddr, inout hdata);

    //DRV (aka MASTER)
    modport DRV(input clk, input hen, hwr_rd, haddr, hdata_out_DRV, hdata_out_en_DRV);

    //RSP (aka SLAVE)
    modport RSP(input clk, input hdata_out_RSP, hdata_out_en_RSP);
		
    //MON		
    modport MONITOR(input clk, input hen, hwr_rd, haddr, hdata_in);

endinterface:hostif
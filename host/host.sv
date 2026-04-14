`timescale 1ns/100ps 


package host;
    import base::*;
    `include "HostTransaction.sv"
	`include "HostDrv.sv"
	`include "HostMGen.sv"
	`include "HostMon.sv"
	`include "HostRsp.sv"
	`include "HostSGen.sv"
	`include "HostAgent.sv"

endpackage

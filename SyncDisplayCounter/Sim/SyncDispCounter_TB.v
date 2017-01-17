`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:56:18 08/21/2009
// Design Name:   SyncDisplayCounter_Top
// Module Name:   C:/CLBQWork/VerilogClass/SyncDisplayCounter/Sim/SyncDispCounter_TB.v
// Project Name:  SyncDisplayCounter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SyncDisplayCounter_Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SyncDispCounter_TB;

	// Inputs
	reg clk;
	reg btn;

	// Outputs
	wire [6:0] seg;
	wire an;

	// Instantiate the Unit Under Test (UUT)
	SyncDisplayCounter_Top uut (
		.clk(clk), 
		.btn(btn), 
		.seg(seg), 
		.an(an)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		btn = 0;

		// Wait 100 ns for global reset to finish
		#100;
		btn = 1;
		repeat (10)
		begin
			#20
			clk = ~clk;			
		end
		btn = 0;		
		forever
		begin
			#20
			clk = ~clk;			
		end
		
        
		// Add stimulus here

	end
      
endmodule


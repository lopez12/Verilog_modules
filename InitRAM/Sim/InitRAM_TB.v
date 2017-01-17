`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:43:53 09/08/2009
// Design Name:   InitRAM_Top
// Module Name:   C:/CLBQWork/VerilogClass/InitRAM/Sim/InitRAM_TB.v
// Project Name:  InitRAM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InitRAM_Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InitRAM_TB;

	// Inputs
	reg clk;
	reg btn;

	// Outputs
	wire [3:0] an;
	wire [7:0] Led;

	// Instantiate the Unit Under Test (UUT)
	InitRAM_Top uut (
		.clk(clk), 
		.btn(btn), 
		.an(an), 
		.Led(Led)
	);

	initial 
	begin
		// Initialize Inputs
		clk = 0;
		btn = 0;

		// Wait 100 ns for global reset to finish
		#50;
		btn = 1;
		#50
		btn = 0;
	end
	always
	begin
		#10
		clk = ~clk;
	end
      
endmodule


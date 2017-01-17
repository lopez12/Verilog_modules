`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:23:07 08/22/2009
// Design Name:   KnightRider_Top
// Module Name:   C:/CLBQWork/VerilogClass/KnightRider/Sim/KnightRider_TB.v
// Project Name:  KnightRider
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KnightRider_Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module KnightRider_TB;

	// Inputs
	reg clk;
	reg btn;

	// Outputs
	wire [7:0] Led;

	// Instantiate the Unit Under Test (UUT)
	KnightRider_Top uut (
		.clk(clk), 
		.btn(btn), 
		.Led(Led)
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


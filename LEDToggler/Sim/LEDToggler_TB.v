`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:16:27 08/28/2009
// Design Name:   LEDToggler_Top
// Module Name:   C:/CLBQWork/VerilogClass/LEDToggler/Sim/LEDToggler_TB.v
// Project Name:  LEDToggler
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LEDToggler_Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LEDToggler_TB;

	// Inputs
	reg clk;
	reg [3:0] btn;

	// Outputs
	wire [3:0] an;
	wire [2:0] Led;

	// Instantiate the Unit Under Test (UUT)
	LEDToggler_Top uut 
	(
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
		#100;
      btn[0] = 1;  
		#20;
		btn[0] = 0;
		// Add stimulus here
	end
	always
	begin
		repeat (1000)
		begin
			#10;
			clk	=	1;
			#10;
			clk	=	0;	
		end
		btn[1] = 1;
		repeat (1000)
		begin
			#10;
			clk	=	1;
			#10;
			clk	=	0;	
		end
		btn[1]	=	0;
	end
	
      
endmodule


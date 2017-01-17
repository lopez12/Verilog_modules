`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:16:22 08/09/2009
// Design Name:   AsyncSimpleLogic_top
// Module Name:   C:/CLBQWork/VerilogClass/AsyncSimpleLogic/Sim/AsyncSimpleLogicTB.v
// Project Name:  AsyncSimpleLogic
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AsyncSimpleLogic_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AsyncSimpleLogicTB;

	// Inputs
	reg [7:0] sw;
	reg [3:0] btn;

	// Outputs
	wire [6:0] seg;
	wire dp;
	wire [3:0] an;
	wire [7:0] Led;

	// Instantiate the Unit Under Test (UUT)
	AsyncSimpleLogic_top uut 
    (
		.seg(seg), 
		.dp(dp), 
		.an(an), 
		.Led(Led), 
		.sw(sw), 
		.btn(btn) 
	);

	initial begin
		// Initialize Inputs
		sw = 0;
		btn = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		btn[0] = 1'b0;
		btn[1] = 1'b0;
		#100;		
		btn[0] = 1'b1;
		btn[1] = 1'b0;
		#100;		
		btn[0] = 1'b0;
		btn[1] = 1'b1;
		#100;		
		btn[0] = 1'b1;
		btn[1] = 1'b1;
		#100;	
		sw		=	8'd20;
		#100;	
		sw		=	8'd55;
		#100;	
		sw		=	8'd200;
		#100;	
		sw		=	8'd180;
		#100
		sw		=	8'h55;
		btn[1:0]	=	2'b10;
		#100
		btn[1:0]	=	2'b0;
		#50
		sw		=	8'hf0;
		#50
		btn[1:0]	=	2'b11;
		#50
		btn[1:0]	=	2'd0;
		sw		=	8'd0;
		#50
		sw		=	8'h80;
		#50
		btn[1:0]	=	2'b0;
		#50
		btn[1:0]	=	2'b01;
		#50
		btn[1:0]	=	2'b10;
		#50
		btn[1:0]	=	2'b11;
		
	end
      
endmodule


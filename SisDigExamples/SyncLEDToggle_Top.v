`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:40:02 08/20/2009 
// Design Name: 
// Module Name:    SyncLEDToggle_Top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
// -----------------------------------------------------------------------------
//                        Module Function Code
// -----------------------------------------------------------------------------
module SyncLEDToggle_Top
(
  input 	clk,
  input 	btn,
  output	Led
);

	`define	DIVIDER_SIZE	4
	// --------------------------------------------------------------------------
	//                      Internal Wire/Reg Signals 
	// --------------------------------------------------------------------------
	reg	Led_d;
	reg	Led_q;

	reg	[`DIVIDER_SIZE:0]		FreqDivider_d;
	reg	[`DIVIDER_SIZE:0]		FreqDivider_q;
	
	reg				ClkEnable_d;
	reg				ClkEnable_q;
	
	// --------------------------------------------------------------------------
	//                        Continuous Assignments
	// --------------------------------------------------------------------------
	assign	Led	=	Led_q;
	// --------------------------------------------------------------------------
	//                       Sequential Blocks
	// --------------------------------------------------------------------------
	always @(posedge clk)
	begin
		if(btn == 1'b1)
		begin
			FreqDivider_q	<=	`DIVIDER_SIZE'b0;
			Led_q				<=	1'b1;
			ClkEnable_q		<=	1'b0;
		end
		else
		begin
			if(ClkEnable_q)
			begin
				Led_q				<=	Led_d;
			end
			else
			begin
				Led_q				<=	Led_q;
			end
			FreqDivider_q	<=	FreqDivider_d;
			ClkEnable_q		<=	ClkEnable_d;
		end		
	end
	// --------------------------------------------------------------------------
	//                       Always Blocks
	// --------------------------------------------------------------------------        
	always @*
	begin
		ClkEnable_d		=	&FreqDivider_q;
		Led_d				=	~Led_q;
		FreqDivider_d	=	FreqDivider_q + 1;
	end
endmodule

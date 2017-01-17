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
module FreqDivider
(
  input 	        Clk,
  input 	        Rst,
  output			  COut
);

	`define	DIVIDER_SIZE	20
	
	// --------------------------------------------------------------------------
	//                      Internal Wire/Reg Signals 
	// --------------------------------------------------------------------------
	reg	COut_d;
	reg	COut_q;
	
	reg	[`DIVIDER_SIZE:0]	FreqDivider_d;
	reg	[`DIVIDER_SIZE:0]	FreqDivider_q;
	// --------------------------------------------------------------------------
	//                        Continuous Assignments
	// --------------------------------------------------------------------------
	assign COut	= COut_q;
	// --------------------------------------------------------------------------
	//                       Sequential Blocks
	// --------------------------------------------------------------------------
	always @(posedge Clk)
	begin
		if(Rst == 1'b1)
		begin
			FreqDivider_q	<= `DIVIDER_SIZE'b0;
			COut_q			<=	1'b0;
		end
		else
			FreqDivider_q	<=	FreqDivider_d;
			COut_q			<=	COut_d;
		begin

		end		
	end
	// --------------------------------------------------------------------------
	//                       Always Blocks
	// --------------------------------------------------------------------------        
	always @*
	begin
		COut_d			=	&FreqDivider_q;
		FreqDivider_d	=	FreqDivider_q + `DIVIDER_SIZE'b1;
	end
endmodule

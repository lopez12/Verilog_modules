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
module SyncDisplayCounter_Top
(
  input 	        clk,
  input 	        btn,
  output	[6:0]   seg,
  output         an
);

	// --------------------------------------------------------------------------
	//                      Internal Wire/Reg Signals 
	// --------------------------------------------------------------------------
	wire	[3:0]		Count;
	wire				ClkEnable;
	// --------------------------------------------------------------------------
	//                        Continuous Assignments
	// --------------------------------------------------------------------------
	assign	an		=	1'b0;
	// --------------------------------------------------------------------------
	//                       Sequential Blocks
	// --------------------------------------------------------------------------

	// --------------------------------------------------------------------------
	//                       Always Blocks
	// --------------------------------------------------------------------------        
	
	
	// --------------------------------------------------------------------------
	//                       Modules Instantiation
	// --------------------------------------------------------------------------        
	
	BCD2SevenSegments BCD2SevSegs1 
	(
		 .Clk			(clk), 
		 .Rst			(btn), 
		 .BCD			(Count), 
		 .SevenSegs	(seg)
    );
	 
	FreqDivider FreqDiv1 
	(
    .Clk				(clk), 
    .Rst				(btn), 
    .COut			(ClkEnable)
	);

	Counter Counter1 
	(
    .Clk			(clk), 
    .Rst			(btn), 
	 .ClkEnable	(ClkEnable),
    .Count		(Count)
    );

endmodule

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
module InitRAM_Top
(
  input					clk,
  input					btn,
  output		[3:0]		an,
  output		[7:0]		Led
);

    // --------------------------------------------------------------------------
	//                      Internal Wire/Reg Signals 
	// --------------------------------------------------------------------------
	wire					ClkEnable_w;
	wire		[4:0]		Count_w;
	reg		[7:0]		Led_q;
	wire		[7:0]		Led_d;
	// --------------------------------------------------------------------------
	//                        Continuous Assignments
	// --------------------------------------------------------------------------
	assign	an		=	4'b1111;
	assign	Led	=	Led_q;
	// --------------------------------------------------------------------------
	//                       Sequential Blocks
	// --------------------------------------------------------------------------
	always @(posedge clk)
	begin
		Led_q	<=	Led_d;
	end

	// --------------------------------------------------------------------------
	//                       Always Blocks
	// --------------------------------------------------------------------------        
	
	
    // --------------------------------------------------------------------------
    //                       Modules Instantiation
    // --------------------------------------------------------------------------        

    FreqDivider         FreqDiv1 
    (
        .Clk            (clk), 
        .Rst            (btn), 
        .COut           (ClkEnable_w)
    );
	 
	Counter				Counter1
	(
			.Clk				(clk),
			.Rst				(btn),
			.ClkEnable		(ClkEnable_w),
			.Count			(Count_w)
	);
	
	MyROM	ROM1
	(
		.address				({6'd0,Count_w[4:0]}),
//		.address				(11'd0),
		.data					(Led_d),
		.clk					(clk)
	);
	
	
endmodule



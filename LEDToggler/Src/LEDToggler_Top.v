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
module LEDToggler_Top
(
  input             clk,
  input     [3:0]   btn,
  output		[3:0]		an,
  output    [2:0]   Led
);

    // --------------------------------------------------------------------------
	//                      Internal Wire/Reg Signals 
	// --------------------------------------------------------------------------
	wire					ClkEnable;
	wire		[2:0]		BtnToggleEnable;
	// --------------------------------------------------------------------------
	//                        Continuous Assignments
	// --------------------------------------------------------------------------
	assign	an	=	4'b1111;
	// --------------------------------------------------------------------------
	//                       Sequential Blocks
	// --------------------------------------------------------------------------

	// --------------------------------------------------------------------------
	//                       Always Blocks
	// --------------------------------------------------------------------------        
	
	
    // --------------------------------------------------------------------------
    //                       Modules Instantiation
    // --------------------------------------------------------------------------        

    ButtonDebouncer     Debouncer1 
    (
		.Clk           (clk),
		.ClkEnable		(ClkEnable),
		.Rst           (btn[0]), 
		.ButtonIn      (btn[1]), 
		.ButtonOut     (BtnToggleEnable[0])
    );

    ButtonDebouncer     Debouncer2 
    (
		.Clk           (clk),
		.ClkEnable		(ClkEnable),
		.Rst           (btn[0]), 
		.ButtonIn      (btn[2]), 
		.ButtonOut     (BtnToggleEnable[1])
    );
    ButtonDebouncer     Debouncer3 
    (
		.Clk           (clk),
		.ClkEnable		(ClkEnable),
		.Rst           (btn[0]), 
		.ButtonIn      (btn[3]), 
		.ButtonOut     (BtnToggleEnable[2])
    );


    FreqDivider         FreqDiv1 
    (
        .Clk            (clk), 
        .Rst            (btn[0]), 
        .COut           (ClkEnable)
    );

    ButtonDriver        ButtonDriver1
    (
        .Clk            (clk), 
        .Rst            (btn[0]), 
        .ToggleEnable	(BtnToggleEnable[0]),
        .ButtonOut      (Led[0])
    );

    ButtonDriver        ButtonDriver2
    (
        .Clk            (clk), 
        .Rst            (btn[0]), 
        .ToggleEnable	(BtnToggleEnable[1]),
        .ButtonOut      (Led[1])
    );
    ButtonDriver        ButtonDriver3
    (
        .Clk            (clk), 
        .Rst            (btn[0]), 
        .ToggleEnable	(BtnToggleEnable[2]),
        .ButtonOut      (Led[2])
    );

	 
endmodule

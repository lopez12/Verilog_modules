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
module Counter #(parameter COUNTER_SIZE = 16)
(
    input             Clk,
    input             Rst,
    output            COut
);

    // --------------------------------------------------------------------------
    //                      Internal Wire/Reg Signals 
    // --------------------------------------------------------------------------
    reg	COut_d;
    reg	COut_q;

    reg	[COUNTER_SIZE-1:0]	Counter_d;
    reg	[COUNTER_SIZE-1:0]	Counter_q;
    // --------------------------------------------------------------------------
    //                        Continuous Assignments
    // --------------------------------------------------------------------------
    assign COut	= Counter_q[COUNTER_SIZE-1];
    // --------------------------------------------------------------------------
    //                       Sequential Blocks
    // --------------------------------------------------------------------------
    always @(posedge Clk)
    begin
    if(Rst == 1'b1)
    begin
        Counter_q	<= 1'b0;
    end
    else
        Counter_q	<=	Counter_d;
    begin

    end		
    end
    // --------------------------------------------------------------------------
    //                       Always Blocks		Alvarez morales monica, miguel portillo alejo
    // --------------------------------------------------------------------------        
    always @*
    begin
        Counter_d   =   Counter_q + 1'b1;
    end
endmodule

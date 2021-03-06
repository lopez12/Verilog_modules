`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:40:02 08/20/2009 
// Design Name: 
// Module Name:    KnightRider_Top 
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
module ParamCounter_Top
(
    input     clk,
    input     btn,
    output    Led
);

    // --------------------------------------------------------------------------
    //                      Internal Wire/Reg Signals 
    // --------------------------------------------------------------------------


    // --------------------------------------------------------------------------
    //                        Continuous Assignments
    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
    //                       Sequential Blocks
    // --------------------------------------------------------------------------

    // --------------------------------------------------------------------------
    //                       Always Blocks
    // --------------------------------------------------------------------------        


    // --------------------------------------------------------------------------
    //                       Modules Instantiation
    // --------------------------------------------------------------------------        
    Counter #(24) Counter1 
    (
        .Clk        (clk), 
        .Rst        (btn), 
        .COut       (Led)
    );

endmodule

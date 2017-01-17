`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:19:57 06/26/2012 
// Design Name: 
// Module Name:    MemoriaM 
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
module MemoriaM(
	input iclk,
	input [10:0] ivadress,
	output [7:0] ovdata
    );
	 
	RAMB16_S9     Ram2kx8
	 (
	 .DI(8'b0),		
	 .DIP(1'b0),
	 .EN(1'b1),
	 .WE(1'b0),
	 .SSR(1'b0),
	 .CLK(iclk),
	 .ADDR(ivadress),
	 .DO(ovdata),
	 .DOP()
	 );
	 
	 defparam Ram2kx8.INIT_00=256'hFFEEDD0CBBAA99807766554433221100;

endmodule

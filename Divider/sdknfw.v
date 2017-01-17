`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:34:57 10/27/2016 
// Design Name: 
// Module Name:    sdknfw 
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
module sdknfw(
		input iClk,
		output Hertz1,
		output Hertz2,
		output .
    );
	 
	 mDivider #(25000000) Divisor1 (
		.iClk (iClk),
		.oLed (Hertz2)
	 );
	 
	 mDivider #(100000000) Divisor2 (
		.iClk (iClk),
		.oLed (HertzMedio)
	 );
	 
	 mDivider DivisoMedio (
		.iClk (iClk),
		.oLed (Hertz1)
	 );


endmodule

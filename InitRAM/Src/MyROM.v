`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:01:20 09/08/2009 
// Design Name: 
// Module Name:    MyROM 
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
module MyROM
(
	input 	[10:0]	address,
	input					clk,
	output	[7:0]		data
);

	RAMB16_S9 RAM2Kx9
	(
		.DI  (8'h00),
		.DIP  (1'b0),
		.EN (1'b1),
		.WE (1'b0),
		.SSR (1'b0),
		.CLK (clk),
		.ADDR (address),
		//.DOP (instruction[17:16]),
		.DO (data)

	);
	// Memory content initialization
	// WARNING: Data is being written from the end to the start point (backwards) (00 - 1f)
	defparam RAM2Kx9.INIT_00  = 256'h1F1E1D1C1B1A191817161514131211100F0E0D0C0B0A09080706050403020100;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:49:01 08/21/2009 
// Design Name: 
// Module Name:    BCD2SevenSegments 
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
module BCD2SevenSegments
(
	input					Clk,
	input					Rst,
	input		[3:0]		BCD,
	output	[6:0]		SevenSegs
);

	`define	SEGA				7'b1111110
	`define	SEGB				7'b1111101
	`define	SEGC				7'b1111011
	`define	SEGD				7'b1110111
	`define	SEGE				7'b1101111
	`define	SEGF				7'b1011111
	`define	SEGG				7'b0111111

	`define	ZERO				7'h7f&`SEGA&`SEGB&`SEGC&`SEGD&`SEGE&`SEGF
	`define	ONE				7'h7f&`SEGB&`SEGC
	`define	TWO				7'h7f&`SEGA&`SEGB&`SEGD&`SEGE&`SEGG
	`define	THREE				7'h7f&`SEGA&`SEGB&`SEGC&`SEGD&`SEGG
	`define	FOUR				7'h7f&`SEGB&`SEGC&`SEGF&`SEGG
	`define	FIVE				7'h7f&`SEGA&`SEGC&`SEGD&`SEGF&`SEGG
	`define	SIX				7'h7f&`SEGA&`SEGC&`SEGD&`SEGE&`SEGF&`SEGG
	`define	SEVEN				7'h7f&`SEGA&`SEGB&`SEGC
	`define	EIGHT				7'h7f&`SEGA&`SEGB&`SEGC&`SEGD&`SEGE&`SEGF&`SEGG
	`define	NINE				7'h7f&`SEGA&`SEGB&`SEGC&`SEGF&`SEGG

	reg	[6:0]	SevenSegs_d;
	reg	[6:0]	SevenSegs_q;	

	assign	SevenSegs	=	SevenSegs_q;
	
	always @(posedge Clk)
	begin
		if(Rst)
		begin
			SevenSegs_q	<=		`ZERO;
		end
		else
		begin
			SevenSegs_q	<=		SevenSegs_d;			
		end
	end
	
	always	@*
	begin
		SevenSegs_d		=	SevenSegs_q;
		case(BCD)
			1:			SevenSegs_d	=	`ONE;
			2:			SevenSegs_d	=	`TWO;
			3:			SevenSegs_d	=	`THREE;
			4:			SevenSegs_d	=	`FOUR;
			5:			SevenSegs_d	=	`FIVE;
			6:			SevenSegs_d	=	`SIX;
			7:			SevenSegs_d	=	`SEVEN;
			8:			SevenSegs_d	=	`EIGHT;
			9:			SevenSegs_d	=	`NINE;
			default:	SevenSegs_d	=	`ZERO;
		endcase
	end
endmodule

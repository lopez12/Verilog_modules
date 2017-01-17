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
module ButtonDriver
(
	input					Clk,
	input					Rst,
	input					ToggleEnable,
	output				ButtonOut
);
	
	reg	ButtonOut_q;
	reg	ButtonOut_d;

	assign ButtonOut	=	ButtonOut_q;

	
	always @(posedge Clk)
	begin
		if(Rst)
		begin
			ButtonOut_q	<=		1'b0;
		end
		else
		begin
			if(ToggleEnable)
			begin
				ButtonOut_q			<=		ButtonOut_d;
			end
			else
			begin
				ButtonOut_q			<=		ButtonOut_q;
			end
		end
	end
	
	always	@*
	begin
		ButtonOut_d	=	~ButtonOut_q;
	end
endmodule

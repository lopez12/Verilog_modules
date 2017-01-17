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
module ButtonDebouncer
(
	input					Clk,
	input					Rst,
	input					ClkEnable,
	input					ButtonIn,
	output				ButtonOut
);
	
	reg	[2:0]	ButtonOut_q;
	reg	[2:0]	ButtonOut_d;
	
	reg	[2:0]	ButtonIn_d;
	reg	[2:0]	ButtonIn_q;
	
	reg	[1:0]	ButtonDeb_d;
	reg	[1:0]	ButtonDeb_q;
	
	
	assign ButtonOut	=	ButtonOut_q[2];
	
	always @(posedge Clk)
	begin
		if(Rst)
		begin
			ButtonOut_q	<=		3'b0;
			ButtonIn_q	<=		3'b0;
			ButtonDeb_q	<=		2'b0;
		end
		else
		begin
			ButtonIn_q	<=	ButtonIn_d;
			ButtonOut_q	<=	ButtonOut_d;
			if(ClkEnable == 1'b1)
			begin
				ButtonDeb_q	<=		ButtonDeb_d;
			end
			else
			begin
				ButtonDeb_q	<=		ButtonDeb_q;
			end
		end
	end
	
	always	@*
	begin
		ButtonIn_d[2:0]	=	{ButtonIn_q[1:0],ButtonIn};
		ButtonDeb_d[1:0]	=	{ButtonDeb_q[1:0],ButtonIn_q[2]};
		ButtonOut_d[0]		=	(~ButtonDeb_q[1]&ButtonDeb_q[0]);
		ButtonOut_d[1]		=	ButtonOut_q[0];
		ButtonOut_d[2]		=	~ButtonOut_q[1]&ButtonOut_q[0];		
	end
endmodule

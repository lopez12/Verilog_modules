`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:15:47 10/10/2016 
// Design Name: 
// Module Name:    mDivider 
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
module mDivider #(parameter NUMBER_TO_COUNT = 50000000)(
			input iClk,
			output oLed
    );
	 
	 //registros
	 reg rD = 0;
	 reg rQ = 0;
	 reg [26:0]rCounterD = 0;
	 reg [26:0]rCounterQ = 0;
	 
	 //Asignacion
	 assign oLed = rQ;
	 
	 //Combinacional
	 always @*
	 begin
		if(rCounterQ == NUMBER_TO_COUNT)
		begin
			rD = ~rQ;
			rCounterD = 0;
		end
		else
		begin
			rD = rQ;
			rCounterD =  rCounterQ + 1'b1;
		end	
	 end
	 
	 //Secuencial
	 always @(posedge iClk)
	 begin
		rQ <= rD;
		rCounterQ <= rCounterD;
	 end


endmodule

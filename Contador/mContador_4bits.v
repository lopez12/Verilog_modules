`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:09:51 10/06/2016 
// Design Name: 
// Module Name:    mContador_4bits 
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
module mContador_4bits(
    input iClk,
    output [3:0] oCuenta
    );
	 
	 //Registros
	 reg [3:0]rQ = 0;
	 reg [3:0]rD = 0;
	 
	 //asignacion continua
	 assign oCuenta = rQ ;
	 
	 //bloque combinacional
	 always @*
	 begin
		rD = rQ + 1'd1;
	 end
	 
	 //bloque secuencial
	 always @(posedge iClk)
	 begin
		rQ <= rD;
	 end


endmodule

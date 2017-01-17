`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:44:44 06/26/2012
// Design Name:   MemoriaM
// Module Name:   C:/.Xilinx/Memoria/ROM.v
// Project Name:  Memoria
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MemoriaM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ROM;

	// Inputs
	reg iclk;
	reg [10:0] ivadress;
	reg [2:0]	rvcont;

	// Outputs
	wire [7:0] ovdata;

	// Instantiate the Unit Under Test (UUT)
	MemoriaM uut (
		.iclk(iclk), 
		.ivadress(ivadress), 
		.ovdata(ovdata)
	);

	initial begin
		// Initialize Inputs
		iclk = 0;
		ivadress = 0;
		rvcont = 0;

		// Wait 100 ns for global reset to finish
		#100;
	end	
	
	always
	begin
		iclk=~iclk; 
		#15;
	end
	
	always@(posedge iclk)
	begin
		rvcont = rvcont + 1'b1;
		if (&rvcont)
		begin
			ivadress = ivadress + 1'b1;
			if(ivadress == 10'h10)
			begin
				ivadress = 10'b0;
			end
		end
		if(rvcont == 3)
		begin
			if(ovdata != {ivadress[3:0],ivadress[3:0]})
			begin
				$display ("Error! @%0d", $time());
				$display ("Address: 0x%0h - Data: 0x%0h Expected: 0x%0h", ivadress, ovdata, {ivadress[3:0],ivadress[3:0]});
			end
		end
		
	end
			
        
		// Add stimulus here
      
endmodule


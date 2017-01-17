`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:40:02 08/20/2009 
// Design Name: 
// Module Name:    SyncLEDToggle_Top 
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
module Counter
(
  input 	        	Clk,
  input 	        	Rst,
  input				ClkEnable,
  output	[4:0]		Count
);
	// --------------------------------------------------------------------------
	//                      Internal Wire/Reg Signals 
	// --------------------------------------------------------------------------
	reg	[4:0]		Count_d;
	reg	[4:0]		Count_q;
	
	
	// --------------------------------------------------------------------------
	//                        Continuous Assignments
	// --------------------------------------------------------------------------
	assign	Count	=	Count_q;
	// --------------------------------------------------------------------------
	//                       Sequential Blocks
	// --------------------------------------------------------------------------
	always @(posedge Clk)
	begin
		if(Rst)
		begin
			Count_q			<=	5'b0;
		end
		else
		begin
			if(ClkEnable)
			begin
				Count_q			<=	Count_d;			
			end
			else
			begin
				Count_q			<=	Count_q;
			end
		end		
	end
	// --------------------------------------------------------------------------
	//                       Always Blocks
	// --------------------------------------------------------------------------        
	always	@*
	begin
		Count_d	=	Count_q + 5'd1;
	end

endmodule

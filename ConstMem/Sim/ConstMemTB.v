`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:07:25 02/16/2012
// Design Name:   ConstMem
// Module Name:   C:/Projects/_Arandas/ConstMem/Sim/ConstMemTB.v
// Project Name:  ConstMem
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ConstMem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ConstMemTB;

	// Inputs
	reg iClk;
	reg iRst;
	reg [5:0] ivAddress;

	// Outputs
	wire [7:0] ovData;

	// Instantiate the Unit Under Test (UUT)
	ConstMem uut (
		.iClk(iClk), 
		.iRst(iRst), 
		.ivAddress(ivAddress), 
		.ovData(ovData)
	);

	initial 
    begin
		// Initialize Inputs
		iClk = 0;
		iRst = 1;
		ivAddress = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// Add stimulus here
        iRst = 0;
        forever
        begin
            repeat(5)
            begin
                wait(iClk);
                wait(!iClk);
            end
            ivAddress = ivAddress + 1;
        end
    end
    always
    begin
        #2;
        iClk = ~iClk;
    end      
endmodule


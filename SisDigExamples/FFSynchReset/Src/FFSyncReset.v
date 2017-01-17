`timescale 1ns / 1ps
module FFSyncReset
(
	input		iClk,
	input		iRst,
	input		iD,
	output	oQ
);
reg	rFFD_d;
reg	rFFD_q;
assign	oQ = rFFD_q;
always @(posedge iClk)
begin
	if(iRst)
	begin
		rFFD_q	<=	1'b0;
	end
	else
	begin
		rFFD_q	<=	rFFD_d;
	end
end
always  @*
begin
	rFFD_d = iD;
end
endmodule

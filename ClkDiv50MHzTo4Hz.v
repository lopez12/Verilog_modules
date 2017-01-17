module ClkDiv50MHzTo4Hz
(
	input	iClk,
	input	iRst,
	output	oCE
);



reg	[23:0]	rvCnt_d;
reg	[23:0]	rvCnt_q;

reg	rCE_d;
reg	rCE_q;


assign	oCE = rCE_q;

always @(posedge iClk or posedge iRst)
begin
	if ( iRst )
	begin
		rCE_q	<=	1'b0;
		rvCnt_q	<=	24'b0;
	end
	else
	begin
		rCE_q	<=	rCE_d;
		rvCnt_q	<=	rvCnt_d;
	end
end

always @*
begin
	rvCnt_d	=	rvCnt_q + 1'b1;
	rCE_d	=	1'b0;
	if ( rvCnt_q == 24'd12_500_000 )
	begin
		rvCnt_d	=	24'd0;
		rCE_d	=	1'b1;
	end

end
endmodule

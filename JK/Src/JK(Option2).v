module JK
(
	input	iClk,
	input	iSet,
	input	iRst,
	input	iCE,
	input	iJ,
	input	iK,
	output	oQ
);
reg	Qd;
reg Qq;
assign oQ = Qq;

//Sequetial
always @(posedge iClk)
begin
	if(iRst)
	begin
		Qq	<=	0;
	end
	else
	begin
		if(iSet)
		begin
			Qq <= 1;
		end
		else
		begin
			if(iCE)
			begin
				Qq	<=	Qd;
			end
			else
			begin
				Qq	<=	Qq;
			end
		end
	end
end

always @*
begin
	if(iJ)
	begin
		if(iK)
		begin
			Qd	= ~Qq;	//11
		end
		else
		begin
			Qd = 1;		//10
		end
	end
	else
	begin
		if(iK)
		begin
			Qd = 0;		//01
		end
		else
		begin
			Qd = Qq;		//00
		end
	end
end
endmodule

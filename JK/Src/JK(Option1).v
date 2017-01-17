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
always @(posedge iClk )
begin
	Qq	<=	Qd;
end

always @*
begin
	if(iRst)
	begin
		Qd	=	0;
	end
	else
	begin
		if(iSet)
		begin
			Qd = 1;
		end
		else
		begin
			if(iCE)
			begin
				case ({iJ,iK})
					2'b00:
					begin
						Qd = Qq;
					end
					2'b01:
					begin
						Qd = 0;
					end
					2'b10:
					begin
						Qd = 1;
					end
					default:
					begin
						Qd = ~Qq;
					end
				endcase
			end
			else
			begin
				Qd = Qq;
			end
		end
	end	
end
endmodule

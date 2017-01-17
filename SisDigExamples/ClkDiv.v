module ClkDiv #(parameter TOTAL_BITS = 5, TOTAL_COUNTS = 8'd14)
(
    input   iClk,
    input   iRst,
    output  oClkDiv
);

reg [TOTAL_BITS-1:0]   rvCnt_d;
reg [TOTAL_BITS-1:0]   rvCnt_q;

reg         rClkDiv_d;
reg         rClkDiv_q;


assign  oClkDiv =   rClkDiv_q;

always @(posedge iClk or posedge iRst)
begin
    if(iRst)
    begin
        rvCnt_q     <=  {TOTAL_BITS{1'b0}};
        rClkDiv_q   <=  1'b0;
    end
    else
    begin
        rvCnt_q     <=  rvCnt_d;
        rClkDiv_q   <=  rClkDiv_d;
    end
end


always @*
begin
    rvCnt_d         =   rvCnt_q + 1'b1;
    if(rvCnt_q == (TOTAL_COUNTS - 1))
    begin
        rClkDiv_d   =   1'b1;
        rvCnt_d     =   4'b0;
    end
    else
    begin
        rClkDiv_d   =   1'b0;
        
    end
end
endmodule

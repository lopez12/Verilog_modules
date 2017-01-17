module ClkDivTop
(
    input           iClk,
    input           iRst,
    output  [3:0]   ovClkDiv
);


wire    [3:0]   wvClkDivs;


assign  ovClkDiv = wvClkDivs;

ClkDiv #(.TOTAL_BITS(4), .TOTAL_COUNTS (4'd8)) mClkDiv0
(
    .iClk           (iClk),
    .iRst           (iRst),
    .oClkDiv        (wvClkDivs[0])
);

ClkDiv #(.TOTAL_BITS(5), .TOTAL_COUNTS (5'd30)) mClkDiv1
(
    .iClk           (iClk),
    .iRst           (iRst),
    .oClkDiv        (wvClkDivs[1])
);

ClkDiv #(.TOTAL_BITS(8), .TOTAL_COUNTS (8'd128)) mClkDiv2
(
    .iClk           (iClk),
    .iRst           (iRst),
    .oClkDiv        (wvClkDivs[2])
);

ClkDiv #(.TOTAL_BITS(3), .TOTAL_COUNTS (3'd6)) mClkDiv3
(
    .iClk           (iClk),
    .iRst           (iRst),
    .oClkDiv        (wvClkDivs[3])
);


endmodule

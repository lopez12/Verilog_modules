/*
	2 to 1 Mux
	iSel | oY
	----------
	  0  | iA
	  1  | iB

    +------------+
--->| iA         |
--->| iSel    oY | --->
--->| iB         |
    +------------+
*/
module Mux2To1_cond
(
	input	iA,		// First input
	input	iB,		// Second input
	input	iSel,	// Data selection
	output	oY		// Mux output
);

assign	oY = ( iSel ) ? iB : iA ;

endmodule

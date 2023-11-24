module ALU (
	//CLOCK to bs used - 50 MHz
	input i_CLK,
	input [9:0] i_SWITCHES,
	
	//SEGMENT 7
	output [6:0] o_HEX_0,
	output [6:0] o_HEX_1,
	
	
	//LEDS
	output reg [9:0] o_LEDS
);

SEVEN_SEGMENT SEG_0 (
.i_DATA_IN (i_SWITCHES[3:0]),
.o_DATA_OUT(o_HEX_0)
);

SEVEN_SEGMENT SEG_1 (
.i_DATA_IN	(i_SWITCHES[7:4]),
.o_DATA_OUT (o_HEX_1)
);

endmodule
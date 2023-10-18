module ALU (
	//CLOCK to bs used - 50 MHz
	input i_CLK,
	input [9:0] i_SWITCHES,
	
	//SEGMENT 7
	output [6:0] o_HEX_0,
	output [6:0] o_HEX_1,
	output [6:0] o_HEX_2,
	output [6:0] o_HEX_3,
	output [6:0] o_HEX_4,
	output [6:0] o_HEX_5,
	
	
	//LEDS
	o_LEDS
);

input i_CLK;



output [9:0] o_LEDS;
reg [9:0] o_LEDS;


SEVEN_SEGMENT SEG_0 (
.i_DATA_IN (
.i_DATA_OUT(o_HEX_0)
)
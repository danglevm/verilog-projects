//7 segment display driver. Displays 4-bit number on a 7-segment
module SEVEN_SEGMENT (
	i_DATA_IN,
	o_DATA_OUT
);

input [3:0] i_DATA_IN;
output [6:0] o_DATA_OUT;
//initialize the bcd signal as registers as well rather than declaring another temp variable
reg [6:0] o_DATA_OUT;


//I personally think using blocking assignment here is the correct choice since 
//I want to produce combinational logic
always @ (i_DATA_IN) begin
	//6543210
	case (i_DATA_IN)
		4'b0000	: o_DATA_OUT = 7'b0111111; //0
		4'b0001	: o_DATA_OUT = 7'b0000110; //1
		4'b0010	: o_DATA_OUT = 7'b1011011; //2
		4'b0011	: o_DATA_OUT = 7'b1001111; //3
		4'b0100	: o_DATA_OUT = 7'b1100110; //4 
		4'b0101	: o_DATA_OUT = 7'b1101101; //5
		4'b0110	: o_DATA_OUT = 7'b1111101; //6
		4'b0111	: o_DATA_OUT = 7'b0000111; //7
		4'b1000	: o_DATA_OUT = 7'b1111111; //8
		4'b1001	: o_DATA_OUT = 7'b1101111; //9
		4'b1010	: o_DATA_OUT = 7'b1110111; //10 - A
		4'b1011	: o_DATA_OUT = 7'b1111100; //11 - b
		4'b1100	: o_DATA_OUT = 7'b1011000; //12 - c
		4'b1101	: o_DATA_OUT = 7'b1011110; //13 - d
		4'b1110	: o_DATA_OUT = 7'b1111001; //14 - E
		4'b1111	: o_DATA_OUT = 7'b1110001; //15 - F
		default  : o_DATA_OUT = 7'b0000000; //when others
	endcase

end


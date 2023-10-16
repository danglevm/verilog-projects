//7 segment display driver. Displays 4-bit number on a 7-segment
module SEVEN_SEGMENT (
	i_DATA_IN,
	o_DATA_OUT
);

input [4:0] i_DATA_IN;
output [7:0] o_DATA_OUT;

reg [7:0] r_DATA = 0;

assign o_DATA_OUT [7:0] = r_DATA [7:0];

//I personally think using blocking assignment here is the correct choice since 
//I want to produce combinational logic
always @ (i_DATA_IN) begin
	//6543210
	case (i_DATA_IN)
		4'b0000	: r_DATA = 7'b0111111; //0
		4'b0001	: r_DATA = 7'b0000110; //1
		4'b0010	: r_DATA = 7'b1011011; //2
		4'b0011	: r_DATA = 7'b1001111; //3
		4'b0100	: r_DATA = 7'b1100110; //4 
		4'b0101	: r_DATA = 7'b11; //5
		4'b0110	: ; //6
		4'b0111	: ; //7
		4'b1000	: ; //8
		4'b1001	: ; //9
		4'b1010	: ; //10 - A
		4'b1011	: ; //11 - B
		4'b1100	: ; //12 - C
		4'b1101	: ; //13 - D
		4'b1110	: ; //14 - E
		4'b1111	: ; //15 - F
	endcase

end


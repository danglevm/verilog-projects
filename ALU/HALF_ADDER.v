module HALF_ADDER (
	input i_INPUT_A,
	input i_INPUT_B,
	output o_CARRY_OUT,
	output o_SUM
);


assign o_SUM = i_INPUT_A & i_INPUT_B;
assign o_CARRY_OUT = i_INPUT_A ^ i_INPUT_B;

endmodule
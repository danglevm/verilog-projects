module FULL_ADDER_1_BIT(
 input i_INPUT_A,
 input i_INPUT_B,
 input i_LOWER_CARRY,
 output o_FULL_CARRY,
 output o_FULL_SUM
);


assign o_FULL_SUM = (i_INPUT_A ^ i_INPUT_B) ^ i_LOWER_CARRY;
assign o_FULL_CARRY = (i_INPUT_A & i_INPUT_B) | (i_INPUT_A & i_LOWER_CARRY) | (i_INPUT_B & i_LOWER_CARRY);

endmodule
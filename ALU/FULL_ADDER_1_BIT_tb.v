module FULL_ADDER_1_BIT_tb;

reg r_INPUT_A;
reg r_INPUT_B;
reg r_LC;
wire w_FC;
wire w_FS;
integer i;

FULL_ADDER_1_BIT UUT (
	.i_INPUT_A (r_INPUT_A),
	.i_INPUT_B (r_INPUT_B),
	.i_LOWER_CARRY (r_LC),
	.o_FULL_CARRY (w_FC),
	.o_FULL_SUM (w_FS)
);


initial begin
$display ("Test begins");
r_INPUT_A = 0;
r_INPUT_B = 0;
r_LC = 0;
#10


	$monitor ("r_INPUT_A=%b r_INPUT_B=%b r_LC=%b w_FC=%b w_FS=%b", r_INPUT_A, r_INPUT_B, r_LC, w_FC, w_FS);
//system task is ignored by the synthesis tool
//$monitor is a system task that displays the values of its parameters any time any of its value changes

//use a for loop to apply random values to the input
r_INPUT_A = 0;
r_INPUT_B = 0;
r_LC = 1;
#10;

r_INPUT_A = 0;
r_INPUT_B = 1;
r_LC = 0;
#10;

r_INPUT_A = 0;
r_INPUT_B = 1;
r_LC = 1;
#10;

r_INPUT_A = 1;
r_INPUT_B = 0;
r_LC = 0;
#10;

r_INPUT_A = 1;
r_INPUT_B = 0;
r_LC = 1;
#10;


end

endmodule

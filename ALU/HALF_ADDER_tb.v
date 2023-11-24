module HALF_ADDER_tb;

reg r_input_A;
reg r_input_B;

wire w_SUM;
wire w_CARRY_OUT;

HALF_ADDER UUT(
.i_INPUT_A(r_input_A),
.i_INPUT_B(r_input_B),
.o_CARRY_OUT(w_CARRY_OUT),
.o_SUM(w_SUM)
);

initial begin
$display ("TEST STARTING");
r_input_A = 1'b0;
r_input_B = 1'b0;
if (w_SUM != 0) $display ("Sum incorrect for 00");
if (w_CARRY_OUT != 0) $display("Carry out incorrect for 00");
#10

r_input_A = 1'b0;
r_input_B = 1'b1;
if (w_SUM != 1) $display ("Sum incorrect for 01");
if (w_CARRY_OUT != 0) $display ("Carry out incorrect for 01");
#10

r_input_A = 1'b1;
r_input_B = 1'b0;
if (w_SUM != 1) $display ("Sum incorrect for 10");
if (w_CARRY_OUT != 0) $display ("Carry out incorrect for 10");
#10

r_input_A = 1'b1;
r_input_B = 1'b1;
if (w_SUM != 0) $display ("Sum incorrect for 11");
if (w_CARRY_OUT != 1) $display ("Carry out incorrect for 11");
#10

$display ("Test passed");
$stop;


end

endmodule

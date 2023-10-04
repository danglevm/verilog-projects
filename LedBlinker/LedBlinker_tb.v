`include "LedBlinker.v"
//simulation-time units and precision time
//simulation time: how often to update its value
//precision time: how to round its values
//the larger the simulation time, the quicker the simulations will run.
//clock runs at like 50 MHz so very quick
`timescale 1ps/1ps

module LedBlinker_tb;

reg r_CLK = 1'b0;
reg r_SWITCH_1 = 1'b0;
reg r_SWITCH_2 = 1'b0;

wire w_LED_DRIVE;

//instantiating the unit under test
LedBlinker UUT
(
	.i_clk(r_CLK),
	.i_switch_1(r_SWITCH_1),
	.i_switch_2(r_SWITCH_2),
	.o_led(w_LED_DRIVE)
);

always #1 r_CLK <= !r_CLK;

initial begin

r_CLK <= 1'b0;
r_SWITCH_1 <= 1'b0;
r_SWITCH_2 <= 1'b0;

$display ("Test Complete");	

end

endmodule
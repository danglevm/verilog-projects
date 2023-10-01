module LedBlinker (
	i_clk,
	i_switch_1,
	i_switch_2,
	o_led
);

input i_clk, i_switch_1, i_switch_2;
output o_led;


//50 MHz or 50 000 000 HZ
parameter c_CLK_COUNT_1HZ = 50000000;

//counter
reg [31:0] r_CLK_COUNT_1HZ = 0;

reg r_en = 1'b0;

//1 HZ enable generator
//50 kHz clock
always @(posedge i_clk)
begin
	if (r_CLK_COUNT_1HZ  == (c_CLK_COUNT_1HZ - 1)) begin
		i_en <= 1'b1;
		r_CLK_COUNT_1HZ <= 0;
	end else 
		//this is sequential logic since r_CLK_COUNT_1HZ depends on the previous output so we use non-blocking assignment
		i_en <= 1'b0;
		r_CLK_COUNT_1HZ <= r_CLK_COUNT_1HZ + 1;
	end
end


//Lit up the LED when enabled
always @(posedge i_clk) begin
//if enable signal is on
	if (i_en) begin
		o_led <= 1'b1;
	end else 
		o_led <= 1'b0;
	end

endmodule
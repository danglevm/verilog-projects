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
parameter c_CLK_COUNT_10HZ = 5000000;
parameter c_CLK_COUNT_100HZ = 500000;

//counter
reg [31:0] r_CLK_COUNT_1HZ = 0;

reg r_en = 1'b0;
reg r_led_select = 1'b1;

//assign is executed continuously
assign o_led = r_led_select;


//1 HZ enable generator
//50 kHz clock
//sensitive to positive clock edge
//triggered at the condition in the parenthesis after @
always @(posedge i_clk) begin
	//this is sequential logic since r_CLK_COUNT_1HZ depends on the previous output so we use non-blocking assignment
	r_en <= 1'b0;
	r_CLK_COUNT_1HZ <= r_CLK_COUNT_1HZ + 1'd1;
	if (r_CLK_COUNT_1HZ  == (c_CLK_COUNT_1HZ - 1)) begin
		r_en <= 1'b1;
		r_CLK_COUNT_1HZ <= 0;
	end
	
end


//Lit up the LED when enabled
always @(posedge i_clk) begin
//if enable signal is on
	if (r_en) begin
		r_led_select <= !r_led_select;
	end 
	
end


endmodule
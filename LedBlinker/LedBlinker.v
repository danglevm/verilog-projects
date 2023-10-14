module LedBlinker (
	i_clk,
	i_reset,
	i_switch_1,
	i_switch_2,
	o_led
);

input i_clk, i_reset, i_switch_1, i_switch_2;
output o_led;


//50 MHz or 50 000 000 HZ
parameter c_CLK_COUNT_1HZ = 50000000;
parameter c_CLK_COUNT_10HZ = 5000000;
parameter c_CLK_COUNT_50HZ = 1000000;
parameter c_CLK_COUNT_100HZ = 500000;

//counter
reg [31:0] r_CLK_COUNT_1HZ = 0;
reg [31:0] r_CLK_COUNT_10HZ = 0;
reg [31:0] r_CLK_COUNT_50HZ = 0;
reg [31:0] r_CLK_COUNT_100HZ = 0;

//toggles
reg r_1HZ_toggle = 1'b0;
reg r_10HZ_toggle = 1'b0;
reg r_50HZ_toggle = 1'b0;
reg r_100HZ_toggle = 1'b0;

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
	r_1HZ_toggle <= 1'b0;
	r_CLK_COUNT_1HZ <= r_CLK_COUNT_1HZ + 1'd1;
	if (r_CLK_COUNT_1HZ  == (c_CLK_COUNT_1HZ - 1)) begin
		r_1HZ_toggle <= 1'b1;
		r_CLK_COUNT_1HZ <= 0;
	end
	
end
//10HZ
always @(posedge i_clk) begin
	r_10HZ_toggle <= 1'b0;
	r_CLK_COUNT_10HZ <=  r_CLK_COUNT_10HZ + 1'd1;
	if (r_CLK_COUNT_10HZ  == (c_CLK_COUNT_10HZ - 1)) begin
		r_10HZ_toggle <= 1'b1;
		r_CLK_COUNT_10HZ <= 0;
	end
	
end
//50HZ
always @(posedge i_clk) begin
	r_50HZ_toggle <= 1'b0;
	r_CLK_COUNT_50HZ <=  r_CLK_COUNT_50HZ + 1'd1;
	if (r_CLK_COUNT_50HZ  == (c_CLK_COUNT_50HZ - 1)) begin
		r_50HZ_toggle <= 1'b1;
		r_CLK_COUNT_50HZ <= 0;
	end
	
end


always @(posedge i_clk) begin
	r_100HZ_toggle <= 1'b0;
	r_CLK_COUNT_100HZ <=  r_CLK_COUNT_100HZ + 1'd1;
	if (r_CLK_COUNT_100HZ  == (c_CLK_COUNT_100HZ - 1)) begin
		r_100HZ_toggle <= 1'b1;
		r_CLK_COUNT_100HZ <= 0;
	end
	
end


//Lit up the LED when enabled
always @(posedge i_clk) begin
	
	case ({i_switch_1, i_switch_2}) //{} concatenation operator used to concatenate the bits of two or more data objects
		2'b01 	: r_en <= r_10HZ_toggle;
		2'b10	   : r_en <= r_50HZ_toggle;
		2'b11		: r_en <= r_100HZ_toggle;
		default  : r_en <= r_1HZ_toggle;
	endcase
	

	if (!i_reset) begin
		//if enable signal is on
		if (r_en) begin
			r_led_select <= !r_led_select;
		end
	else if (i_reset) begin
		r_led_select <= 0;
	end
		

	
end

end
endmodule
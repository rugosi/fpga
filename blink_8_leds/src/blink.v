`timescale 1ns / 1ps

module blink(
		input wire clk,
		input wire rst,
		output wire led,
		output wire [7:0] leds,
		output wire [7:0] pmod_leds,
		output wire [7:0] rgb_leds,

		output wire rgb_r,
		output wire rgb_b,
		output wire rgb_g
	);

	reg [27:0] counter;
    reg [7:0] sum = 8'b11111111;
    reg [1:0] color = 2'b00;

	wire clk270, clk180, clk90, clk0, usr_ref_out;
	wire usr_pll_lock_stdy, usr_pll_lock;

	CC_PLL #(
		.REF_CLK(10.0),      // reference input in MHz
		.OUT_CLK(100.0),     // pll output frequency in MHz
		.PERF_MD("SPEED"), // LOWPOWER, ECONOMY, SPEED
		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
		.CI_FILTER_CONST(2), // optional CI filter constant
		.CP_FILTER_CONST(4)  // optional CP filter constant
	) pll_inst (
		.CLK_REF(clk), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(usr_pll_lock_stdy), .USR_PLL_LOCKED(usr_pll_lock),
		.CLK270(clk270), .CLK180(clk180), .CLK90(clk90), .CLK0(clk0), .CLK_REF_OUT(usr_ref_out)
	);

	assign led = counter[27];

	assign leds = sum;

	assign pmod_leds = sum;

    assign rgb_r = color == 2'd1 || color == 2'd0 ? 0 : 1;
    assign rgb_g = color == 2'd2 || color == 2'd0 ? 0 : 1;
    assign rgb_b = color == 2'd3 || color == 2'd0 ? 0 : 1;

	assign rgb_leds = sum;

	always @(posedge clk0)
	begin
		if (!rst) begin
			counter <= 0;
		end else begin
			counter <= counter + 1'b1;
		end

        if ( &counter[22:0] ) begin
            sum <= sum - 1;
        end

        if ( &counter[22:0] ) begin
            if ( sum == 0 ) begin
                color <= color + 1'b1;
            end
        end

	end

endmodule

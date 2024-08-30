`timescale 1ns / 1ps

module blink(
		input wire clk,
		input wire rst,
		output wire led,
		output wire led0,
		output wire led1,
		output wire led2,
		output wire led3,
		output wire led4,
		output wire led5,
		output wire led6,
		output wire led7,
		output wire pmod_led1,
		output wire pmod_led2,
		output wire pmod_led3,
		output wire pmod_led4,
		output wire pmod_led5,
		output wire pmod_led6,
		output wire pmod_led7,
		output wire pmod_led8
	);

	reg [27:0] counter;
    reg [7:0] sum = 8'b11111111;

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

	assign led0 = sum[0];
	assign led1 = sum[1];
	assign led2 = sum[2];
	assign led3 = sum[3];
	assign led4 = sum[4];
	assign led5 = sum[5];
	assign led6 = sum[6];
	assign led7 = sum[7];

	assign pmod_led1 = sum[0];
	assign pmod_led2 = sum[1];
	assign pmod_led3 = sum[2];
	assign pmod_led4 = sum[3];
	assign pmod_led5 = sum[4];
	assign pmod_led6 = sum[5];
	assign pmod_led7 = sum[6];
	assign pmod_led8 = sum[7];

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
	end

endmodule

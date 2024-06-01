module lif(
	input [7:0] current,
	input clk, rst_n,
	output spike,
	output reg [7:0] state
);

	localparam timer_delay = 4'd15;

	reg [7:0] next_state, threshold;
	reg [3:0] timer = 0;
	always @(posedge clk) begin
		if (!rst_n) begin
			state <= 8'd0;
			threshold <= 8'd127;
			timer <= 4'd0;
		end else begin
			state <= next_state;
			if (timer > 0) timer <= timer - 4'd1;
		end

		if (state >= threshold) begin
			timer <= timer_delay;
		end
	end

	assign next_state = current + (beta >> 1);
	assign spike = timer == 0 && state >= threshold;
endmodule

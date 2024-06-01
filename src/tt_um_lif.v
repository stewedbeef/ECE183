module tt_um_lif(
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
	// Use bidirectional as outputs
	assign uio_oe = 8'hFF;
	assign uio_out[6:0] = 7'h0;

	// Instantiate LIF neuron
	lif lif1(.current(ui_in), .clk(clk), .rst_n(rst_n), .spike(uio_out[7]), .state(uo_out));
endmodule
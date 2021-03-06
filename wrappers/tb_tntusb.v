`timescale 100ps / 1ps

module tb(
	input clk48_host,
	input clk48_device,
	input reset,
	inout usb_d_p,
	inout usb_d_n,
	output usb_pullup,
	output usb_tx_en,
	input [4096:0] test_name,
	output clkdiff
);

assign clkdiff = clk48_host ^ clk48_device;
pulldown(usb_d_n);
pullup(usb_d_p);

dut dut (
	.clk_clk48(clk48_device),
	.reset(reset),
	.usb_d_p(usb_d_p),
	.usb_d_n(usb_d_n),
	.usb_pullup(usb_pullup),
	.usb_tx_en(usb_tx_en)
);

  // Dump waves
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end

endmodule

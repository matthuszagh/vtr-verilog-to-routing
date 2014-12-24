/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */
/* ./multBlockGen.pl 17043 -fractionalBits 0*/
module multiplier_block (
    i_data0,
    o_data0
);

  // Port mode declarations:
  input   [31:0] i_data0;
  output  [31:0]
    o_data0;

  //Multipliers:

  wire [31:0]
    w1,
    w4,
    w5,
    w4096,
    w4101,
    w160,
    w4261,
    w17044,
    w17043;

  assign w1 = i_data0;
  assign w160 = w5 << 5;
  assign w17043 = w17044 - w1;
  assign w17044 = w4261 << 2;
  assign w4 = w1 << 2;
  assign w4096 = w1 << 12;
  assign w4101 = w5 + w4096;
  assign w4261 = w4101 + w160;
  assign w5 = w1 + w4;

  assign o_data0 = w17043;

  //multiplier_block area estimate = 7095.2112472853;
endmodule //multiplier_block

module surround_with_regs(
	i_data0,
	o_data0,
	clk
);

	// Port mode declarations:
	input   [31:0] i_data0;
	output  [31:0] o_data0;
	reg  [31:0] o_data0;
	input clk;

	reg [31:0] i_data0_reg;
	wire [30:0] o_data0_from_mult;

	always @(posedge clk) begin
		i_data0_reg <= i_data0;
		o_data0 <= o_data0_from_mult;
	end

	multiplier_block mult_blk(
		.i_data0(i_data0_reg),
		.o_data0(o_data0_from_mult)
	);

endmodule
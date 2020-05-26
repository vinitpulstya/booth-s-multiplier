`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:32:42 05/26/2020
// Design Name:   multiplier
// Module Name:   C:/Users/Devender/Downloads/final keyboard/booth_multiplier/test.v
// Project Name:  booth_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg start;
	reg clk=0;
	reg [7:0] m;
	reg [7:0] q;

	// Outputs
	wire [15:0] OUT;


	// Instantiate the Unit Under Test (UUT)
	multiplier uut (
		.start(start), 
		.clk(clk), 
		.m(m), 
		.q(q), 
		.OUT(OUT)
	);
always begin #2 clk = ~ clk ;end  //clock
	initial begin
		// Initialize Inputs
		start <= 1;
		m <= 8'd7;
		q <= 8'd2;
		#5 start =0;
		#40 start <= 1;
			 m <= -8'd7;
			 q <= 8'd3;
		#3 start = 0;
		#40 start = 1;
			 m <= -8'd40;
			 q <= 8'd15;
		#3 start =0;
		#40 $stop;
		
	end
      
endmodule


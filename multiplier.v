`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:26 05/26/2020 
// Design Name: 
// Module Name:    multiplier 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module multiplier(start,clk,m,q,OUT);
input signed [7:0] m,q;				//m- multiplicand, q-multiplier
input clk,start;
output reg signed [15:0] OUT;

reg q0;
reg signed [7:0] A,n,M,Q; 

always@(posedge clk)
begin
  if (start) 
		begin
		A = 8'b0;
		q0 = 0;
		M <= m;
		Q = q;
		n = 4'd1000;
		end
	else
		begin
			if(n == 0)
				begin
					OUT = {A,Q};
				end
			else
				begin
					case({Q[0], q0})
						2'b10 : A = A - M;
						2'b01 : A = A + M;
						2'b00, 2'b11 : A = A;
					endcase
				{A[7:0],Q[7:0],q0} = $signed({A[7:0],Q[7:0],q0}) >>> 1;
				n = n-1;
				end
		end
end

endmodule

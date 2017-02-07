`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2017 04:18:42 PM
// Design Name: 
// Module Name: keypad
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_div(
	input clk_in,
	input [31:0]level,
	output reg clk_out
    );

	reg[31:0] cnt;
	always @(posedge clk_in ) begin
		cnt = cnt + 1;
		if (cnt[level]) begin
			clk_out = ~clk_out;
		end
	end
endmodule

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

  
module keypad(
	input clk,
	output reg [3:0]x,
	input [3:0]y,
	output reg [15:0]data
    );
	reg [3:0]cnt;
	initial begin
		cnt = 1'b0;
		data = 1'b0;
		x = 1'b0;
	end
	always @(posedge clk) begin
		x[cnt[3:2]] = 1'b1;
		// data = 16'b0;
		data[cnt] = y[cnt[1:0]];
		x =4'b0;
		cnt = cnt + 1;
	end
endmodule

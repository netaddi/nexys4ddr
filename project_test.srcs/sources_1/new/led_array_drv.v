`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2017 04:44:00 PM
// Design Name: 
// Module Name: led_array_drv
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


module led_array_drv(
	input clk,
	input [15:0]data,
	output clk_out,
	output reg din,
	output cs
    );
	reg [3:0] cnt;
	assign cs = 1;
	assign clk_out = clk;
	initial begin
		cnt = 32'b0;
	end

	always @(posedge clk) begin
		din = data[cnt];
		cnt = cnt + 1;
	end
endmodule

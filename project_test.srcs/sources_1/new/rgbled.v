`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2017 03:15:22 PM
// Design Name: 
// Module Name: rgbled
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


module rgbled(
    input clk,
    input [7:0] red,
    input [7:0] green,
    input [7:0] blue,
    output reg led_r,
    output reg led_g,
    output reg led_b
    );
    reg [7:0] cnt;
    initial begin
        cnt = 0;
    end
    always@(posedge clk)begin
        if (cnt < red) begin
            led_r = 1;
        end else begin
            led_r = 0;
        end
        if (cnt < green) begin
            led_g = 1;
        end else begin
            led_g = 0;
        end
        if (cnt < blue) begin
            led_b = 1;
        end else begin
            led_b = 0;
        end
        cnt = cnt + 1;
    end
    
endmodule

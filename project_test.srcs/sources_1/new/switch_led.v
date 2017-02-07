`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2017 04:13:13 PM
// Design Name: 
// Module Name: switch_led
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


module switch_led(
    input [15:0] SW,
    input clk,
    output [15:0] led,
    output [7:0] disp_seg_o,
    output [7:0] disp_an_o
    );
    
    assign led[15:0] = SW[15:0];
    segment_driver s1(
    .clk(clk),
    .data(32'hfedcba98),
    .point(SW[7:0]),
    .an(disp_an_o),
    .seg(disp_seg_o));
    
endmodule

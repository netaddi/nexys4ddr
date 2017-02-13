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
    output [3:0] keypad_x,
    input [3:0] keypad_y,
    output [15:0] led,
    output [7:0] disp_seg_o,
    output [7:0] disp_an_o,
    output rgb1_red_o,
    output rgb1_blue_o,
    output rgb1_green_o,
    output rgb2_red_o,
    output rgb2_blue_o,
    output rgb2_green_o,
    output led_clk,
    output led_din,
    output led_cs
    );

    reg [31:0]num;
    wire clk_16;
    initial begin
        num = 0;
    end
    
    // assign led[15:0] = SW[15:0];
    
    clk_div clk16(
        .clk_in(clk),
        .level(32'hFF),
        .clk_out(clk_16));

    // wire clk_8;
    // clk_div clk8()

    segment_driver s1(
        .clk(clk),
        .data({~SW, SW}),
        .point(SW[7:0]),
        .an(disp_an_o),
        .seg(disp_seg_o));

    rgbled led1(
        .clk(clk),
        .red(SW[15:12]),
        .green(SW[15:12]),
        .blue(SW[15:12]),
        .led_r(rgb1_red_o),
        .led_g(rgb1_green_o),
        .led_b(rgb1_blue_o)
        );

    rgbled led2(
        .clk(clk),
        .red(SW[3:0]),
        .green(SW[7:4]),
        .blue(SW[11:8]),
        .led_r(rgb2_red_o),
        .led_g(rgb2_green_o),
        .led_b(rgb2_blue_o)
        );

    led_array_drv la1 (
    	.clk(clk),
    	.clk_out(led_clk),
    	.data(SW[15:0]),
    	.din(led_din),
    	.cs(led_cs)
    	);
    
    keypad k1(
        .clk(clk_16),
        .x(keypad_x),
        .y(keypad_y),
        .data(led)
        );

endmodule

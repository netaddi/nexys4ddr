`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2017 05:30:20 PM
// Design Name: 
// Module Name: keyoad_sim
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


module keyoad_sim(
    );
    
    reg clk;
    reg [3:0] y;
    initial begin
        clk = 0;
        y = 4'b0;
    end
    always #1 clk = ~clk;
//    always #3 y = y + 1;
    
    
    
    wire [3:0]x;
    wire [15:0]data;
    
    keypad k1 (
    .clk(clk),
    .x(x),
    .y(y),
    .data(data)
    );
endmodule

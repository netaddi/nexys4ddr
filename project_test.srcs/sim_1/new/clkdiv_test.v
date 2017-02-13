`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2017 07:02:35 PM
// Design Name: 
// Module Name: clkdiv_test
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


module clkdiv_test(
    );
    
    reg clk = 0;
    always #1 clk = ~clk;
    
    wire out;
    
    clk_div div1 (
    .clk_in(clk),
    .level(32'h3F),
    .clk_out(out));
    
endmodule

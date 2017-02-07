`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2017 11:23:55 AM
// Design Name: 
// Module Name: sement_driver
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


module segment_driver(
    input clk,
    input [31:0] data,
    input [7:0] point,
    output reg [7:0] seg,
    output reg [7:0] an
    );
    
    reg [2:0]cnt;
    reg [31:0]clk_cnt;
    reg [3:0]digit;
    wire div_clk;
    
    assign div_clk = clk_cnt[15];
    
    initial begin
        cnt = 3'b0;
        clk_cnt = 32'b0;
    end
    
    always @ (posedge clk) begin
        clk_cnt = clk_cnt + 1;
    end
    
    always @ (posedge div_clk) begin
        an = 8'hFF;
        an[cnt] = 1'b0;
        
        digit[3:0] = (data >> (cnt * 4)) & 4'hF;
        case(digit)
            4'h0: seg[6:0] = 7'b100_0000;
            4'h1: seg[6:0] = 7'b111_1001;
            4'h2: seg[6:0] = 7'b010_0100;
            4'h3: seg[6:0] = 7'b011_0000;
            4'h4: seg[6:0] = 7'b001_1001;
            4'h5: seg[6:0] = 7'b001_0010;
            4'h6: seg[6:0] = 7'b000_0010;
            4'h7: seg[6:0] = 7'b101_1000;
            4'h8: seg[6:0] = 7'b000_0000;
            4'h9: seg[6:0] = 7'b001_0000;
            4'ha: seg[6:0] = 7'b000_1000;
            4'hb: seg[6:0] = 7'b000_0011;
            4'hc: seg[6:0] = 7'b100_0110;
            4'hd: seg[6:0] = 7'b010_0001;
            4'he: seg[6:0] = 7'b000_0110;
            4'hf: seg[6:0] = 7'b000_1110;
        endcase
        
        seg[7] = ~point[cnt];
        cnt = cnt + 1;
    end
    
    
endmodule

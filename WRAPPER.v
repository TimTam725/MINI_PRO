`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/02 13:58:23
// Design Name: 
// Module Name: WRAPPER
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


module WRAPPER(clk, rst, AN, DP, seg);
    input  clk;
    input  rst;
    output [3:0] AN;
    output DP;
    output [6:0] seg;
    
    reg  [5:0] count100m = 6'd0;
    reg  [8:0] count1m   = 6'd0;
    reg  [8:0] count1k   = 6'd0;
    reg  clk1mhz = 0;
    reg  clk1khz = 0;
    reg  clk1hz  = 0;
    reg  [3:0] AN_reg = 4'b0111;
    wire [3:0] num;
    wire [6:0] segA, segB, segC, segD;
    
    MINI_PRO mini_pro(.clk(clk1hz), .rst(~rst), .num(num));
    
    // -------------------------- clock dividers ---------------
    always @(posedge clk) begin
        count100m <= (count100m == 6'd50)? 0: count100m + 1;
        if (count100m == 6'd0)
            clk1mhz <= ~clk1mhz;
    end
    
    always @(posedge clk1mhz) begin
        count1m <= (count1m == 9'd500)? 0: count1m + 1;
        if (count1m == 9'd0)
            clk1khz <= ~clk1khz;
    end
            
    always @(posedge clk1khz) begin
        count1k <= (count1k == 9'd500)? 0: count1k + 1;
        if (count1k == 9'd0)
            clk1hz <= ~clk1hz;
        AN_reg <= {AN_reg[0],AN_reg[3:1]};
    end
    
    // ----------------------- seven segment -----------------------
    // seven segment display
    
    assign segA = ~ 7'b1111110;
    assign segB = ~ 7'b1111110;
    assign {segC, segD} = ~ bcd2sevenseg(num);
    assign seg =
    !AN_reg[3]?segA:(!AN_reg[2]?segB:(!AN_reg[1]?segC:segD));
    
    // seven segment control
    assign AN = AN_reg;
    assign DP = 1'b1;

   //    a
   //  f   b
   //    g
   //  e   c
   //    d
   //

   /* -----\/----- EXCLUDED -----\/-----
         a    b    c    d    e    f    g
    0    1    1    1    1    1    1    0
    1    0    1    1    0    0    0    0
    2    1    1    0    1    1    0    1
    3    1    1    1    1    0    0    1
    4    0    1    1    0    0    1    1
    5    1    0    1    1    0    1    1
    6    1    0    1    1    1    1    1
    7    1    1    1    0    0    0    0
    8    1    1    1    1    1    1    1
    9    1    1    1    1    0    1    1
    -----/\----- EXCLUDED -----/\----- */

    function [13:0] bcd2sevenseg;
    input [3:0] bcd;
    begin
        case (bcd)
        0:  bcd2sevenseg = 14'b1111110_1111110;
        1:  bcd2sevenseg = 14'b1111110_0110000;
        2:  bcd2sevenseg = 14'b1111110_1101101;
        3:  bcd2sevenseg = 14'b1111110_1111001;
        4:  bcd2sevenseg = 14'b1111110_0110011;
        5:  bcd2sevenseg = 14'b1111110_1011011;
        6:  bcd2sevenseg = 14'b1111110_1011111;
        7:  bcd2sevenseg = 14'b1111110_1110000;
        8:  bcd2sevenseg = 14'b1111110_1111111;
        9:  bcd2sevenseg = 14'b1111110_1111011;
        10: bcd2sevenseg = 14'b0110000_1111110;
        11: bcd2sevenseg = 14'b0110000_0110000;
        12: bcd2sevenseg = 14'b0110000_1101101;
        13: bcd2sevenseg = 14'b0110000_1111001;
        14: bcd2sevenseg = 14'b0110000_0110011;
        15: bcd2sevenseg = 14'b0110000_1011011;
        default: bcd2sevenseg = 14'b0000000_0000000;
        endcase
    end
    endfunction // bcd2sevenseg
endmodule

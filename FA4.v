`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/02 10:56:50
// Design Name: 
// Module Name: FA4
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


module FA4(a, b, s);
    input [3:0] a, b;
    output [3:0] s;
    wire [2:0] c;
    
    HA ha0(a[0], b[0], s[0], c[0]);
    FA fa1(a[1], b[1], c[0], s[1], c[1]);
    FA fa2(a[2], b[2], c[1], s[2], c[2]);
    FA fa3(a[3], b[3], c[2], s[3],);
endmodule

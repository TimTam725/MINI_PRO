`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/02 11:29:56
// Design Name: 
// Module Name: INST_MEM
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


module INST_MEM(pc, inst);
    input [3:0] pc;
    output inst;
    reg data[15:0];
//    reg [15:0] data1[3:0];
    
    assign inst = data[pc];
    
    integer i;
    initial begin
        for (i = 0; i <= 15; i = i + 1)
            data[i] <= 1'b0;
            
        data[3] <= 1'b1;
        data[7] <= 1'b1;
        data[11] <= 1'b1;
        data[15] <= 1'b1;
    end
endmodule

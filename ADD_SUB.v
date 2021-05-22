`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/02 11:51:06
// Design Name: 
// Module Name: ADD_SUB
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


module ADD_SUB(clk, rst, inst, num);
    input clk, rst, inst;
    output [3:0] num;
    
    reg [3:0] num = 4'd0;
    wire [3:0] fa4_out;
    wire [3:0] pm1;
    
    assign pm1 = (inst)? 4'b1111 : 4'b0001;
    FA4 fa4(num, pm1, fa4_out);
    
    always @(posedge clk, negedge rst) begin
        if (rst == 0)
            num <= 4'd0;
        else
            num <= fa4_out;
    end
endmodule

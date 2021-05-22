`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/02 12:11:14
// Design Name: 
// Module Name: MINI_PRO
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


module MINI_PRO(clk, rst, num);
    input clk, rst;
    output [3:0] num;
    wire [3:0] pc;
    wire inst;
    
    PC_CTRL pc_ctrl(clk, rst, pc);
    INST_MEM inst_mem(pc, inst);
    ADD_SUB add_sub(clk, rst, inst, num);
    
endmodule

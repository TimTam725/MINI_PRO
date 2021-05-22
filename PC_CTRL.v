`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/02 11:13:45
// Design Name: 
// Module Name: PC_CTRL
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


module PC_CTRL(clk, rst, pc);
    input clk, rst;
    output [3:0] pc;
    
    reg [3:0] pc = 4'b0000;
    wire [3:0] fa4_out;
    
    FA4 fa4(pc, 4'b0001, fa4_out);
    
    always @(posedge clk, negedge rst) begin
        if (rst == 0) begin
            pc <= 4'b0000;
        end else begin
            pc <= fa4_out;
        end
    end
    
endmodule

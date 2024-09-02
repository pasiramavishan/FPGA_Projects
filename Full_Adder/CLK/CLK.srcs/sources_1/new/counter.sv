`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2024 08:59:33 PM
// Design Name: 
// Module Name: counter
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


module counter #(parameter N=8)(
    input logic clk, incr, rst,
    output logic [N-1:0] count_reg
);
    always_ff @(posedge clk) begin
    if (rst) count_reg <= 0;
    else if (incr) count_reg = count_reg + 1'b1;
    
    end
    

endmodule

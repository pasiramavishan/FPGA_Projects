`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2024 11:18:49 PM
// Design Name: 
// Module Name: counter_tb
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

module counter_tb;
    timeunit 1ns;
    timeprecision 1ps;
     
    logic clk = 0;
    localparam CLK_PERIOD = 10;
    initial begin
       forever #(CLK_PERIOD/2) clk <= ~clk;
    end   
    
    localparam N = 8;
    logic clk, incr, rst;
    logic [N-1:0] count_reg;
     
    counter #(.N(N)) dut(.*);
    
    initial begin
        incr <= 0;
        rst <= 1;
    
        #(CLK_PERIOD * 2)
        incr <= 1;
        
        repeat(10) begin
            @(posedge clk);
            rst <= 0;
            incr <= 1;
        end
        
    end
     
endmodule 

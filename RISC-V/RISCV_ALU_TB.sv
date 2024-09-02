`timescale 1ns / 1ps

module RISCV_ALU_TB();
    logic [31:0] A, B;
    logic [3:0] ALUControl;
    logic Z, NZ;
    logic [31:0] result;
    logic clk;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    RISCV_ALU dut (.*);

    initial begin
        A <= 32'd5;
        B <= 32'd10;
        ALUControl <= 4'd6;

        @(posedge clk);
        A <= 32'd30;
        B <= 32'd10;
        ALUControl <= 4'd7;

        @(posedge clk);
        A <= 32'd5;
        B <= 32'd10;
        ALUControl <= 4'd8;

        @(posedge clk);
        A <= 32'd127;
        B <= 32'd1;
        ALUControl <= 4'd9;   

        @(posedge clk);
        A <= 32'd5;
        B <= 32'd10;
        ALUControl <= 4'd4;

        @(posedge clk);
        A <= 32'd10;
        B <= 32'd5;
        ALUControl <= 4'd4;
    end
endmodule


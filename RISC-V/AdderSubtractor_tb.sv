`timescale 1ns / 1ps

module AdderSubtractor_tb();
    logic A, B;
    logic op, cin;
    logic result, cout;
    logic clk;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    AdderSubtractor dut (.*);

    initial begin
        A <= 0'b1;
        B <= 0'b1;
        op <= 0'b1;

        @(posedge clk);
        A <= 0'b0;
        B <= 0'b1;
        op <= 0'b1;

        @(posedge clk);
        A <= 0'b0;
        B <= 0'b1;
        op <= 0'b0;

    end
endmodule


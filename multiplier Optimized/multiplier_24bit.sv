module multiplier_24bit (
    input logic [23:0] num1, num2,
    input logic clk, rstn,
    output logic [47:0] result
);

    logic [47:0] reg1 = 0, reg2 = 0, reg3 = 0, reg4 = 0;


    multiplier_12bit dut1 (
        .num1(num1[11:0]),
        .num2(num2[11:0]),
        .clk(clk), 
        .rstn(rstn),
        .result(reg1[23:0])
    );
    
    
    multiplier_12bit dut2 (
        .num1(num1[23:12]),
        .num2(num2[11:0]),
        .clk(clk), 
        .rstn(rstn),
        .result(reg2[23:0])
    );

    multiplier_12bit dut3 (
        .num1(num1[11:0]),
        .num2(num2[23:12]),
        .clk(clk), 
        .rstn(rstn),
        .result(reg3[23:0])
    );

    multiplier_12bit dut4 (
        .num1(num1[23:12]),
        .num2(num2[23:12]),
        .clk(clk), 
        .rstn(rstn),
        .result(reg4[23:0])
    );

    assign result = reg1 + (reg2 << 12) + (reg3 << 12) + (reg4 << 24);
    
endmodule
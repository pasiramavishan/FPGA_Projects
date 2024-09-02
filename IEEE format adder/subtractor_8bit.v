module subtractor_8bit (reg1, reg2, result, cout);
    input [23:0] reg1, reg2;
    output [23:0] result;
    output cout;

    wire op = 1;
    
    wire [24:0] c;

    assign c[0] = op;

    genvar i;
    
    for (i = 0; i < 24; i = i + 1) begin
        AdderSubtractor addSub(
            .A(reg1[i]),
            .B(reg2[i]),
            .result(result[i]),
            .op(op),
            .cin(c[i]),
            .cout(c[i+1])
        );
    end

    assign cout = c[24];
    
endmodule
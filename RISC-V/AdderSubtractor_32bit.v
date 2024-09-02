module AdderSubtractor_32bit (reg1, reg2, result, op, cout);
    input [31:0] reg1, reg2;
    input op;
    output [31:0] result;
    output cout;

    wire [32:0] c;

    assign c[0] = op;

    genvar i;
    
    for (i = 0; i < 32; i = i + 1) begin
        AdderSubtractor addSub(
            .A(reg1[i]),
            .B(reg2[i]),
            .result(result[i]),
            .op(op),
            .cin(c[i]),
            .cout(c[i+1])
        );
    end

    assign cout = c[32];


endmodule
module IEEE_multiplier (
    input [31:0] number1, number2,
    output [31:0] result
);
    logic [23:0] reg1, reg2;
    logic [7:0] exponentDifference;
    logic cout, cout1;


    assign result[31] = number1[31] ^ number2[31];
    assign reg1 = {1'b1, number1[22:0]};
    assign reg2 = {1'b1, number2[22:0]};

    subtractor_8bit smallALU(
            .reg1(number1[30:23] - 8'd127),
            .reg2(number2[30:23]),
            .result(exponentDifference),
            .cout(cout1)
        );
    

    genvar i;

    generate
        for (i = 0; i < 23; i = i + 1) begin : adder_gen

            AdderSubtractor_24bit BigALU (
                .reg1(reg1 >> 1), 
                .reg2(reg1 * number2[i]), 
                .result(reg1), 
                .op(0), 
                .cout(cout)
            );

        end
    endgenerate


    assign result[30:23] = exponentDifference;
    
endmodule
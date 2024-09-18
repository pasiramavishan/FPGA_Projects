module IEEE_multiplier (
    input [31:0] number1, number2,
    output [31:0] result
);
    logic [23:0] reg1, reg2, reg3, reg4, adder_result, product, adding;
    logic [7:0] exponentDifference;
    logic cout, cout1;

    assign product = 24'd0;
    assign result[31] = number1[31] ^ number2[31];
    assign reg1 = {1'b1, number1[22:0]};
    assign reg2 = {1'b1, number2[22:0]};

    subtractor_8bit Adder_8bit(
            .reg1(number1[30:23] - 8'd127),
            .reg2(number2[30:23]),
            .result(exponentDifference),
        );


    AdderSubtractor_24bit adder (
            .reg1(product), 
            .reg2(adding), 
            .result(product), 
            .op(1'b0), // 0 for addition
            .cout(cout)
        );




    assign result[30:23] = exponentDifference;
    assign result[22:0] = product[22:0];




    
endmodule
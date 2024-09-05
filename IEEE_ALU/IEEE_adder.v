module IEEE_adder (number1, number2, op, result);
    input [31:0] number1, number2;
    input op;
    output [31:0] result;

    wire signed [7:0] exponentDifference;
    reg [7:0] exponent;
    wire [23:0] intermediate, reg3;
    reg sign;
    wire [7:0] incr;
    reg [23:0] reg1, reg2; 
    wire cout, cout1;
    wire op_;

    assign op_ = op ^ number1[31] ^ number2[31];

    subtractor_8bit smallALU(
            .reg1(number1[30:23]),
            .reg2(number2[30:23]),
            .result(exponentDifference),
            .cout(cout1)
        );
always @(*) begin
    if (exponentDifference>0) begin
        sign = number1[31];
        exponent = number1[30:23];
        
    end

    else if (exponentDifference<0) begin
        sign = number2[31];
        exponent = number2[30:23];
    end

    else if (exponentDifference==0) begin
        if (number2[22:0] > number1[22:0]) begin
            sign = number2[31];
            exponent = number2[30:23];
        end

        else begin
            sign = number1[31];
            exponent = number1[30:23];
        end
    end

end
    // else begin
    //     sign = number1[31];
    //     if (exponentDifference>0) begin
    //         exponent = number1[30:23];
    //     end

    //     else if (exponentDifference<0) begin
    //         exponent = number2[30:23];
    //     end

    //     else if (exponentDifference==0) begin
    //         if (number2[22:0] > number1[22:0]) begin
    //             exponent = number2[30:23];
    //         end

    //         else begin
    //             exponent = number1[30:23];
    //         end
    //     end
        
    // end
    // end
    always @(*) begin
        if (exponentDifference > 0) begin
            reg1 = {1'b1, number1[22:0]};
            reg2 = {1'b1, number2[22:0]} >> exponentDifference;

        end

        else if (exponentDifference < 0) begin
            reg1 = {1'b1, number2[22:0]};
            reg2 = {1'b1, number1[22:0]} >> -exponentDifference;     
            
        end

        else begin
            if (number2[22:0] > number1[22:0]) begin
                reg1 = {1'b1, number2[22:0]};
                reg2 = {1'b1, number1[22:0]};  
            end
            else begin
                reg1 = {1'b1, number1[22:0]};
                reg2 = {1'b1, number2[22:0]};      
            end
        end
    end



    AdderSubtractor_24bit BigALU (
        .reg1(reg1), 
        .reg2(reg2), 
        .result(intermediate), 
        .op(op_), 
        .cout(cout)
    );

    approximate aprx(
        .reg1(intermediate),
        .cout(cout), 
        .op(op_),
        .incr(incr),
        .reg1_(reg3)
    );

    assign result = {sign, exponent + incr ,reg3[22:0]};

    
endmodule
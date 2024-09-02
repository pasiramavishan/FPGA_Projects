module IEEE_adder (number1, number2, op, result);
    input [31:0] number1, number2;
    input op;
    output [31:0] result;

    wire [7:0] exponentDifference;
    wire [23:0] intermediate, reg3;
    reg sign;
    wire [4:0] incr;
    reg [23:0] reg1, reg2; 
    wire cout;
    wire op_;

    assign op_ = op ^ number1[31] ^ number2[31];

    subtractor_8bit smallALU(
            .reg1(number1[30:23]),
            .reg2(number2[30:23]),
            .result(exponentDifference),
            .cout(cout)
        );
        always @(*) begin
    if (op_) begin
        if (exponentDifference>0) begin
            sign = 0;
        end

        else if (exponentDifference<0) begin
            sign = 1;
        end

        else if (exponentDifference==0) begin
            if (number2[22:0] > number1[22:0]) begin
                sign = 0;
            end

            else begin
                sign = 1;
            end
        end
    end

    else begin
        sign = 0;
    end
    end
    always @(*) begin
        if (exponentDifference > 0) begin
            reg1 = {1'b1, number1[22:0]};
            reg2 = {1'b1, number2[22:0]} >> exponentDifference;

        end

        else if (exponentDifference < 0) begin
            reg1 = {1'b1, number2[22:0]};
            reg2 = {1'b1, number1[22:0]} >> exponentDifference;     
            
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

    //     if (~(number2[31] ^ op)) begin
    //         reg2_ = reg1; 
    //         reg1_ = reg2;
    //     end

    //     else begin
    //         reg1_ = reg1;
    //         reg2_ = reg2;
    //     end
    // end

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

    assign result = {sign, exponentDifference + incr + 127 ,reg3[22:0]};

    
endmodule
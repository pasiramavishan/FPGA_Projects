module IEEE(
    input logic clk,
//    input logic rstn,
    input logic command,
    input logic [31:0] number1,
    input logic [31:0] number2,
    //output logic [31:0] sum,
    output logic sum1,
    output logic [7:0] sum2,
    output logic [22:0] sum3
);

    logic [23:0] shiftAdder1 = 0;
    logic [23:0] shiftAdder2 = 0;
    logic [23:0] shiftAdded = 0;
    logic [23:0] shiftAdded1 = 0;
    logic [8:0] shiftAmount = 0;
    logic c, sign, cout=0;
    logic [7:0] exponent;
    logic [7:0] temp_count = 0;


    always_ff @( posedge clk ) begin

        c <=  (number1[31] ^ number2[31] ^ command); 
        if (number1[30:23] > number2[30:23]) begin
            shiftAdder1[23:0] <= {1'b1, number1[22:0]};
            shiftAdder2[23:0] <= {1'b1, number2[22:0]};
            exponent <= number1[30:23];
            
            shiftAmount <= number1[30:23] - number2[30:23];
            sum1 <= number1[31];
        end
        else if (number1[30:23] < number2[30:23]) begin
            shiftAdder2[23:0] <= {1'b1, number1[22:0]};
            shiftAdder1[23:0] <= {1'b1, number2[22:0]}; 
            shiftAmount <= -number1[30:23] + number2[30:23];
            exponent <= number2[30:23];
            sum1 <= number2[31];
        end
        else begin
            if (number1[22:0] > number2[22:0]) begin
                shiftAdder1[23:0] <= {1'b1, number1[22:0]};
                shiftAdder2[23:0] <= {1'b1, number2[22:0]};
                shiftAmount <= 0;
                exponent <= number2[30:23];
                sum1 <= number1[31];
            end
            else if (number1[22:0] < number2[22:0]) begin
                shiftAdder2[23:0] <= {1'b1, number1[22:0]};
                shiftAdder1[23:0] <= {1'b1, number2[22:0]};
                shiftAmount <= 0;
                exponent <= number2[30:23];

                sum1 <= number2[31];
            end
        end
    end    
        

    always_comb begin
        if (c==0) begin
            {cout, shiftAdded} = shiftAdder1 + (shiftAdder2 >> shiftAmount);
            if (cout == 1) begin
                // exponent = exponent + 1;
                sum2 = exponent + 1;
            end
            if (cout == 0) begin
                shiftAdded = shiftAdded << 1;
                sum2 = exponent;
            end

            
        end 
        else if (c==1) begin
            shiftAdded = shiftAdder1 - (shiftAdder2 >> shiftAmount);
            temp_count = 0;
            if (number1[30:23] == number2[30:23]) begin
                if (shiftAdded[23] == 0) begin
                    for(int i=0; i<23; i++) begin
                        if (!shiftAdded[23]) begin
                            shiftAdded = shiftAdded << 1;
                            temp_count = temp_count + 1;
                        end
                    end
                shiftAdded = shiftAdded << 1;
                //exponent = 127 - temp_count;
                sum2 = 127 - temp_count;
                end    
            end
            
            else begin
                shiftAdded = shiftAdded << 1;
                sum2 = exponent;
                if (number1[30:23] == number2[30:23]) begin
                    //exponent = 127 - temp_count;
                    sum2 = 127 - temp_count;
                end
                
            end
            
        end
        
    end

    always_ff @( posedge clk ) begin
        // sum2 <= exponent;
        sum3 <= shiftAdded[23:1];
    end
    
endmodule
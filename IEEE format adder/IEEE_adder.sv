module IEEE_adder (
    input logic clk,
    input logic command,
    input logic [31:0] number1,
    input logic [31:0] number2,
    output logic [31:0] sum
);
    logic [23:0] shiftAdder1 = 0;
    logic [23:0] shiftAdder2 = 0;
    logic [23:0] shiftAdded = 0;
    logic [8:0] shiftAmount = 0;
    logic c, sign, cout=0;
    logic [5:0] temp_count = 0;
    

    always_ff @( posedge clk ) begin

        c <=  (number1[31] ^ number2[31] ^ command);

        
        shiftAdder1[23:0] <= {1'b1, number1[22:0]};
        shiftAdder2[23:0] <= {1'b1, number2[22:0]};
        if (number1[30:23] > number2[30:23]) begin
            shiftAmount[8:0] <= {1'b0,number1[30:23] - number2[30:23]};
        end
            
        else begin
            shiftAmount[8:0] <= {1'b0,number2[30:23] - number1[30:23]};
        end
    end

    
    always_comb begin
        if (number1[30:23] > number2[30:23]) begin
            if (c==0) begin
                {cout, shiftAdded} = (shiftAdder2 >> (shiftAmount)) + shiftAdder1;; //adding
            end

            if (c==1) begin
                shiftAdded = -(shiftAdder2 >> (shiftAmount)) + shiftAdder1; //subrtacting
                cout = 0;
            end
        end
        else if (number1[30:23] > number2[30:23]) begin

            if (c==0) begin
                {cout, shiftAdded} = (shiftAdder1 >> (shiftAmount)) + shiftAdder2; //adding
            end
            if (c==1) begin
                shiftAdded = -(shiftAdder1 >> (shiftAmount)) + shiftAdder2; //subtracting
                cout = 0;
                
            end
        end

        else if (number1[30:23] == number2[30:23]) begin
            if (c==0) begin
                {cout, shiftAdded} = shiftAdder1 + shiftAdder2; //adding
            end
            if (c==1) begin
                if (number1[22:0] > number2[22:0]) begin
                    shiftAdded = shiftAdder1 - shiftAdder2; //subtracting
                    sign = 0;
                end

                else begin
                    shiftAdded = -shiftAdder1 + shiftAdder2; //subtracting
                    cout = 0;
                    sign = 1;
                end   
                    
            end
        end
        
    end

    always_ff @( posedge clk ) begin
        if (number1[30:23] > number2[30:23]) begin
            if (cout == 0) begin
                sum[31] <= number1[31];
                sum[30:23] <= number1[30:23];
                sum[22:0] <= shiftAdded[22:0];
            end

            else begin
                sum[31] <= number1[31];
                sum[30:23] <= number1[30:23] + 1;
                sum[22:0] <= shiftAdded[23:1];
                
            end
        end

        else if (number1[30:23] < number2[30:23])begin
            if (cout == 0)begin
                sum[31] <= number2[31];
                sum[30:23] <= number2[30:23];
                sum[22:0] <= shiftAdded[22:0];
            end

            else begin
                sum[31] <= number2[31];
                sum[30:23] <= number2[30:23] + 1;
                sum[22:0] <= shiftAdded[23:1];
                
            end
        end

        else if (number1[30:23] == number2[30:23]) begin
            temp_count = 0;
            if (cout==0) begin
                for(int i=0; i<23; i++) begin
                    if (!shiftAdded[23]) begin
                            shiftAdded = shiftAdded << 1;
                            temp_count = temp_count + 1;
                            
                    end


                    else begin
                        sum[31] <= sign;
                        sum[22:0] <= {shiftAdded[22:0]};
                        sum[30:23] <= -temp_count + 127;

                    end
                end
            end

            else begin
                sum[31] <= number2[31];
                sum[30:23] <= number2[30:23] + 1;
                sum[22:0] <= shiftAdded[22:0];

                
            end
            
        end

    end


endmodule
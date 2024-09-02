module ALU #(
    parameter WIDTH = 16
)(
    input logic [2:0] sel,
    input logic signed [WIDTH-1:0] A,
    input logic signed [WIDTH-1:0] B, //if signed used it automatically fill negative numbers with leading zeros
    output logic signed [WIDTH-1:0] C,
    output logic Z
);
    // always_comb begin   //multiplexer //with always_comb we can put if else
    //     if (sel == 3'b000) C = A + B;  //priroty. First check first condition and then second 
    //     else if (sel == 3'b001) C = A - B;
    //     else if (sel == 3'b010) C = A * B;
    //     else if (sel == 3'b011) C = A / B;
    //     else if (sel == 3'b100) C = A % B;
    //     else C = A;
        
    // end

    always_comb begin   //multiplexer //with always_comb we can put if else
        unique case (sel)       //this is unique case. If sel if matching it will do that
            3'b000 : C = A + B;   //not a goof ALU, when u add two 8 bit you will get 9 bit , which will lose information (truncate data)
            3'b001 : C = A - B;
            3'b010 : C = A * B;
            3'b011 : C = A / B;
            3'b100 : C = A % B;
            default: C = A;
        endcase    
    end



    assign Z = (C == 0);

endmodule
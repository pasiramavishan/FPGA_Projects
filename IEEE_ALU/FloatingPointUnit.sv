module FloatingPointUnit (
    input logic clk, rstn, rstn_number, enter,
    input logic [2:0] partition,
    input logic [1:0] operation,
    input logic [7:0] number,
    // output logic [31:0] result,
	 output logic [6:0] seg_out1, seg_out2, seg_out3, seg_out4, seg_out5, seg_out6, seg_out7, seg_out8 
);

    logic [31:0] result_adder, result_mult, result_div, result_subtractor, number1, number2;
	 logic [23:0] remainder;
	 logic [31:0] result;

    inputNumber takingInput(
        .number(number),
        .clk(clk), 
        .rstn(rstn_number), 
        .enter(enter),
        .partition(partition),
        .num1(number1), 
        .num2(number2) 
    );
	 
    always_ff @( posedge clk or negedge rstn ) begin : main
        
        if(!rstn) begin
            result <= 0;
        end

        else begin
            case (operation)
                2'b00: result <= result_adder;
                2'b01: result <= result_subtractor;
                2'b10: result <= result_mult;
                2'b11: result <= result_div;
            endcase
        end
    end


    IEEE_multiplier multiplier(
        .number1(number1),
        .number2(number2),
        .rstn(rstn),
        .clk(clk),
        .result(result_mult)
    );

    IEEE_adder AdderSubtractor (
        .number1(number1),
        .number2(number2),
        .op(1'b0),
        .clk(clk), 
        .rstn(rstn),
        .result(result_adder)
    );

	IEEE_adder AdderSubtractor2 (
			  .number1(number1),
			  .number2(number2),
			  .op(1'b1),
			  .clk(clk), 
			  .rstn(rstn),
			  .result(result_subtractor)
		 );

    IEEE_divider divider (
        .num1(number1), 
        .num2(number2),
        .clk(clk), 
        .rstn(rstn),
        .result(result_div),
        .remainder(remainder)
    );
	 
	 /* genvar i;
    generate
        for (i = 0; i < 8; i++) begin : display
            seven_segment_display u_seven_segment (
                .num(result[i * 4 +: 4]),  
                .seg(seg_out[i])              
            );
        end
    endgenerate */
	 
					 seven_segment_display segA (
                .num(result[3 : 0]),  
                .seg(seg_out1)              
            );
					 seven_segment_display segB (
                .num(result[7 : 4]),  
                .seg(seg_out2)              
            );
					 seven_segment_display segC (
                .num(result[11 : 8]),  
                .seg(seg_out3)              
            );
					 seven_segment_display segD (
                .num(result[15 : 12]),  
                .seg(seg_out4)              
            );
					 seven_segment_display segE (
                .num(result[19 : 16]),  
                .seg(seg_out5)              
            );
					 seven_segment_display segF (
                .num(result[23 : 20]),  
                .seg(seg_out6)              
            );
					 seven_segment_display segG (
                .num(result[27 : 24]),  
                .seg(seg_out7)              
            );
					 seven_segment_display segH (
                .num(result[31 : 28]),  
                .seg(seg_out8)              
            );
    
endmodule

// non restoring

module divider (
    input logic [7:0] num1, 
    input logic [3:0] num2, //divisor
    input logic clk, rstn,
  	output logic [4:0] quotient,
    output logic normalize
);
    logic [8:0] aq, d;
    logic [3:0] c_bits;
    logic [3:0] subt;
    logic overflow;
    enum logic [1:0] {START, SUB, FINAL} state;
    
    
    always_ff @( posedge clk or negedge rstn ) begin : divisor

        if (!rstn) begin

            c_bits <= 0;
            aq <= {1'b0, num1};
            d <= {1'b0, num2, 4'b0};
            {overflow, subt} = num1[7:4] - num2;
            state <= START;
            
        end

        else begin
            
            case (state)
                START: begin
                    if (overflow) begin
                        state <= SUB;    
                    end

                    if (!overflow) begin
                        aq <= aq + d;
                        state <= SUB;
                    end
                    
                end  

                SUB: begin
                    c_bits <= c_bits + 1;
                    if (aq[8] == 0) begin
                        aq <= ( aq << 1) - d;
                        quotient[4-c_bits] <= 1; 

                    end

                    else begin
                        aq <= (aq << 1) + d;
                        quotient[4-c_bits] <= 0; 
                    end

                    if (c_bits == 4) begin
                        state <= FINAL;
                    end
                
                end

                FINAL: begin
                  if (quotient[3] == 1) begin
                    normalize <= 1'b1;
                   end

                  else begin
                       normalize <= 1'b0;
                    end
                end 
            endcase

        end        
    end
endmodule

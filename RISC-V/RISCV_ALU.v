//module RISCV_ALU(A, B, cout, ALUControl, result, Z, NZ);
//    input [31:0] A, B;
//    input [3:0] ALUControl;
//    output [31:0] result;
//    output cout, Z, NZ;

//    assign Z = (result == 0);

//    always @(ALUControl, A, B) begin
//        case (ALUControl)
//            4'b0000: result <= A + B;
//            4'b0001: result <= A - B;
//            4'b0010: result <= A | B;
//            4'b0011: result <= A | B;
//            4'b0100: result <= A ^ B;
//            4'b0101: result <= A << B;
//            4'b0110: result <= A >> B;
//            4'b0111: result <= A >>> B;
//            4'b1000: result <= (A < B)? 1:0;
//            4'b1001: result <= (A < B)? 1:0; 
//        endcase
        
//    end
//endmodule

module RISCV_ALU(
    input signed [31:0] A, B,
    input [3:0] ALUControl,
    output reg [31:0] result,
    output Z,
    output NZ
);

    // Zero flag (Z)
    assign Z = (result == 0);
    
    // Negative flag (NZ) - if the result is negative (i.e., the MSB is 1)
    assign NZ = result[31];

    always @(ALUControl, A, B) begin
        case (ALUControl)
            4'b0000: result <= A + B;          // ADD 0
            4'b0001: result <= A - B;          // SUB 1
            4'b0010: result <= A | B;          // OR  2
            4'b0011: result <= A & B;          // AND 3
            4'b0100: result <= A ^ B;          // XOR 4
            4'b0101: result <= A << B[4:0];    // Shift left logical  5
            4'b0110: result <= A >> B[4:0];    // Shift right logical 6
            4'b0111: result <= A >>> B[4:0];   // Shift right arithmetic 7
            4'b1000: result <= (A < B) ? 1 : 0; // Set less than 8
            4'b1001: result <= (A < B) ? 1 : 0; // Set less than (unsigned comparison might be intended here) 9
            default: result <= 32'b0;           // Default case to avoid latches
        endcase
    end

endmodule

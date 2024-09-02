//`timescale 1ns / 1ps

//module alu(
//    input logic clk,
//    input logic [2:0] sel,
//    input logic signed [7:0] A,
//    input logic signed [7:0] B,
//    output logic signed [7:0] C,
//    output logic Z
    


//    );
//    logic [2:0] sel_delay;
//    logic [7:0] add_sub_out;
    
//    c_addsub_0 as (
//        .A(A),      // input wire [7 : 0] A
//        .B(B),      // input wire [7 : 0] B
//        .CLK(CLK),  // input wire CLK
//        .ADD(sel_delay == 0),  // input wire ADD
//        .S(add_sub_out)      // output wire [7 : 0] S
//    );
    
    
//    logic signed [7:0] A_delay;
    
//    always_ff @(posedge clk) begin
//        sel_delay <= sel;
//        A_delay <= A;
//    end
    
//    logic [7:0] div_out;
    
//    div_gen_1 div (
//        .aclk(clk),                                      // input wire aclk
//        .s_axis_divisor_tvalid(1),    // input wire s_axis_divisor_tvalid
//        .s_axis_divisor_tdata(B),      // input wire [7 : 0] s_axis_divisor_tdata
//        .s_axis_dividend_tvalid(1),  // input wire s_axis_dividend_tvalid
//        .s_axis_dividend_tdata(A),    // input wire [7 : 0] s_axis_dividend_tdata
//        //.m_axis_dout_tvalid(1),          // output wire m_axis_dout_tvalid
//        .m_axis_dout_tdata(div_out)            // output wire [15 : 0] m_axis_dout_tdata
//    );
    
//    logic [7:0] quotient, modulo;
//    assign {quotient, modulo} = div_out;   //vivado divider with latency = 1
    
//    logic [15:0] mul_out;
//    mult_gen_0 mul (
//        .CLK(clk),  // input wire CLK
//        .A(A),      // input wire [7 : 0] A
//        .B(B),      // input wire [7 : 0] B
//        .P(mul_out)      // output wire [15 : 0] P
//    );
    
//    logic signed [7:0] C_next;
//    logic Z_next;

//    always_comb begin
//        unique case (sel_delay)
//            3'b000 : C_next = signed'(add_sub_out);
//            3'b000 : C_next = signed'(add_sub_out);
//            3'b000 : C_next = signed'(8'(mul_out));
//            3'b000 : C_next = signed'(quotient);
//            3'b000 : C_next = signed'(modulo);
//            default: C_next = A_delay;
//        endcase
        
//     Z_next = (C_next == 0);  
//     end
      
     
//     always_ff @(posedge clk) begin
//         C <= C_next;
//         Z <= Z_next;
//     end
//endmodule

module alu_ip (
  input  logic       clk,
  input  logic [2:0] sel,
  input  logic signed [7:0] A,
  input  logic signed [7:0] B,
  output logic signed [7:0] C,
  output logic              Z
);
  logic [7:0] add_sub_out;
  c_addsub_0 as (
    .A   (A          ),
    .B   (B          ),
    .CLK (clk        ),
    .ADD (sel  == 0  ),
    .S   (add_sub_out)      
  );

  logic [15:0] mul_out;
  mult_gen_0 mul (
    .CLK(  clk  ),
    .A  (  A    ),
    .B  (  B    ),
    .P  (mul_out)
  );

  logic        [2:0]   sel_delay;
  logic signed [7:0]   A_delay  ;
  always_ff @(posedge clk) begin
    sel_delay <= sel ;
    A_delay   <=   A ;
  end

  logic [15:0] div_out;
  div_gen_0 div (
    .aclk                   (  clk  ),
    .s_axis_divisor_tvalid  (  1    ),
    .s_axis_divisor_tdata   (  B    ),
    .s_axis_dividend_tvalid (  1    ),
    .s_axis_dividend_tdata  (  A    ),
    .m_axis_dout_tdata      (div_out)
  );
  logic  [7:0] quotient, modulo;
  assign {quotient, modulo}  = div_out;

  logic signed [7:0] C_next;
  logic              Z_next;
  always_comb begin
    unique case(sel_delay)
      3'b000 : C_next = signed'(add_sub_out);
      3'b001 : C_next = signed'(add_sub_out);
      3'b010 : C_next = signed'(8'(mul_out));
      3'b011 : C_next = signed'(quotient   );
      3'b100 : C_next = signed'(modulo     );
      default: C_next = A_delay;
    endcase
    Z_next = (C==0);
  end

  always_ff @(posedge clk) begin
    C   <= C_next;
    Z   <= Z_next;
  end
endmodule

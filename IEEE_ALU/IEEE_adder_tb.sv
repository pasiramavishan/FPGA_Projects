module IEEE_adder_tb();

    logic [31:0] number1, number2;
    logic op;
    logic [31:0] result;
    logic clk;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    IEEE_adder dut (.*);

    initial begin
    
//        #50;


//        //0b00111010010100011100000000000000

        
//        @(posedge clk);
//        number1 <= 32'b01000000111100010111100011010101;
//        number2 <= 32'b00111111111111111011111001110111;
//        op <= 0;
        
       #50;
        
        @(posedge clk);
        
        number1 <= 32'b01000000110010110000111100101000;
        number2 <= 32'b01000000110010110000100010011010;
        op <= 1;
        
//        #50;
        
//        @(posedge clk);
//        number1 <= 32'b01000000111100010111100011010101;
//        number2 <= 32'b00111111111111111011111001110111;
//        op <= 0;
        
        
//        #50
        
//        @(posedge clk);
//        number1 <= 32'b11000000110110000010000011000101;
//        number2 <= 32'b11000000110101111110111110011110;
//        op <= 1;
        
        
//        #50
        
//        @(posedge clk);
//        number1 <= 32'b11000000100100010111100011010101;
//        number2 <= 32'b01000000100100010100011110101110;
//        op <= 0;
        
//        @(posedge clk);
//        number1 <= 32'b01000000111000000000000000000000;
//        number2 <= 32'b01000000000000000000000000000000;
//        op <= 0;

    end
    
endmodule
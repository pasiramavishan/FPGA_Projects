module divider_24bit_A_tb ();
    localparam N = 24;
    localparam CLK_PERIOD = 10;
    logic [N-1:0] num1;
    logic [N-1:0] num2;
    logic clk, rstn=0;
    logic [N:0] quotient;
    logic normalize;
    logic divisionReady;

    
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end


    divider_24bit_A dut(.*);

    initial begin
        // num1 <= 24'b110101101001011110001101;
        // num2 <= 24'b100110110101110000101001;
        // num1 <= 24'b100001110111000010100100;
        // num2 <= 24'b101100100101110000101001;
        num1 <= 24'b111101111000010100011111;
        num2 <= 24'b100110001111010111000011;       
        // num1 <= 4'b1100; 000000000000000000000000000000000000000000000000
        // num2 <= 4'b0011; 000000000000000000000001010000000000000000000000

        @(posedge clk);

        rstn <= 1;

        #300
        rstn <= 0;
        #20
        @(posedge clk);
        
        num1 <= 24'b100001110111000010100100;
        num2 <= 24'b101100100101110000101001;
        // repeat (10)
        @(posedge clk);
        rstn <=1; 
        #1500 check_output(quotient, 24'b0); 

    end

    task check_output;
        input [23:0] actual;
        input [23:0] expected;
        if (actual !== expected) begin
        $display("Test Failed: Expected %h, but got %h", expected, actual);
        end else begin
        $display("Test Passed: Output %h matches expected %h", actual, expected);
        end
    endtask
endmodule
module IEEE_multiplier_tb ();
    logic [31:0] number1, number2;
    logic [31:0] result;
    logic clk;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    IEEE_multiplier dut (.*);

    initial begin

        
    @(posedge clk);
    
    number1 <= 32'b01000000101011011101001011110010;
    number2 <= 32'b01000000000101100001010001111011;

    #10 check_output(result, 32'b01000001010010111100111100000100);       

    end

    
    task check_output;
        input [31:0] actual;
        input [31:0] expected;
        if (actual !== expected) begin
            $display("Test Failed: Expected %h, but got %h", expected, actual);
        end else begin
            $display("Test Passed: Output %h matches expected %h", actual, expected);
        end
    endtask
endmodule
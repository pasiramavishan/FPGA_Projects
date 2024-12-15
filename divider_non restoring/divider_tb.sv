module divider_tb ();
    localparam CLK_PERIOD = 10;
    logic [7:0] num1; 
    logic [3:0] num2;
    logic clk, rstn=0;
    logic [4:0] quotient;
    logic normalize;

    
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end


    divider dut(.*);

    initial begin
        // num1 <= 24'b110101101001011110001101;
        // num2 <= 24'b100110110101110000101001;
        num1 <= 8'b01110101;
        num2 <= 4'b1010;
        
        // num1 <= 4'b1100; 000000000000000000000000000000000000000000000000
        // num2 <= 4'b0011; 000000000000000000000001010000000000000000000000

        @(posedge clk);

        rstn <= 1;

        @(posedge clk);
        rstn <=1;

        // repeat (10) 
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
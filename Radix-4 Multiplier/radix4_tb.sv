module radix4_tb();
    localparam CLK_PERIOD = 10;
    localparam N = 24;
    // localparam N = 8;
    logic [N-1:0] num1, num2;
    // logic [N-1:0] num1, num2;
    
    logic clk = 0;
    logic rstn = 0;
    logic [2*N-1:0] FinalResult;
    

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end



    radix4 dut(.*);

    initial begin
        num1 <= 24'b010110101010011010000101;
        num2 <= 24'b011010101011110101000101;

        // num1 <= 8'b00101101;
        // num2 <= 8'b01011010;

        @(posedge clk);

        rstn <= 1;

        @(posedge clk);
        rstn <=1;

        repeat (10) 
        #15 check_output(FinalResult, 48'b010010111001011111110000111000100010010110110010); 
    end

    task check_output;
         input [47:0] actual;
         input [47:0] expected;
         if (actual !== expected) begin
            $display("Test Failed: Expected %h, but got %h", expected, actual);
         end else begin
            $display("Test Passed: Output %h matches expected %h", actual, expected);
         end
    endtask
    //0100101110010111111100001110001000100101101100100
endmodule
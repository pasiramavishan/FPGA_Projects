module moduleName();
    logic [3:0] digit;  // 4-bit input for the digit (0-9)
    logic [6:0] seg;   // 7-segment output
    logic clk;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    seven_segment dut (.*);

    initial begin
        
        @(posedge clk);

        digit <= 4'd9;

        
        @(posedge clk);

        digit <= 4'd3;

        
        @(posedge clk);

        digit <= 4'd2;
    end
    
    
endmodule
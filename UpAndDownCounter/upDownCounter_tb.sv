module upDownCounter_tb ();
    logic push;
    logic [6:0] display;
    logic clk;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    upDownCounter dut (.*);

    initial begin
        
        @(posedge clk);

        push <= 1;

        
        @(posedge clk);

        push <= 1;

        
        @(posedge clk);

        push <= 1;
    end
endmodule

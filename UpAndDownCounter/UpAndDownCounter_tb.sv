module UpAndDownCounter_tb ();
    logic push1, push2;
    logic [2:0] result;

    logic clk;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    UpAndDownCounter dut (.*);
    
    initial begin
        push1 <= 1;
        
    


        @(posedge clk);
        push1 <= 0;
    


        @(posedge clk);
        push1 <= 1;
    

        @(posedge clk);
        push1 <= 0;
    


        @(posedge clk);
        push2 <= 1;
    


        @(posedge clk);
        push2 <= 0;

        @(posedge clk);
        push1 <= 1;
        
        @(posedge clk);
        push1 <= 0;
    

    end


    
endmodule
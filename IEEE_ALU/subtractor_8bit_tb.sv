module subtractor_8bit_tb ();
    logic [7:0] reg1, reg2;
    logic [7:0] result;
    logic cout;
    logic clk;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    subtractor_8bit dut (.*);

    initial begin
        reg1 <= 8'd30;
        reg2 <= 8'd10;


        @(posedge clk);
        reg1 <= 8'd10;
        reg2 <= 8'd20;


        @(posedge clk);
        reg1 <= 8'd5;
        reg2 <= 8'd10;

        @(posedge clk);
        reg1 <= 8'd30;
        reg2 <= 8'd10;


        @(posedge clk);
        reg1 <= 8'd5;
        reg2 <= 8'd10;


        @(posedge clk);
        reg1 <= 8'd30;
        reg2 <= 8'd10;

    end
endmodule
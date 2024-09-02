module AdderSubtractor_32bit_tb ();
    logic [31:0] reg1, reg2;
    logic op;
    logic [31:0] result;
    logic cout;
    logic clk;

    localparam CLK_PERIOD = 10;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    AdderSubtractor_32bit dut (.*);

    initial begin
        reg1 <= 32'd30;
        reg2 <= 32'd10;
        op <= 0;

        @(posedge clk);
        reg1 <= 32'd10;
        reg2 <= 32'd20;
        op <= 0;

        @(posedge clk);
        reg1 <= 32'd5;
        reg2 <= 32'd10;
        op <= 1;

        @(posedge clk);
        reg1 <= 32'd30;
        reg2 <= 32'd10;
        op <= 0;   

        @(posedge clk);
        reg1 <= 32'd5;
        reg2 <= 32'd10;
        op <= 1;

        @(posedge clk);
        reg1 <= 32'd30;
        reg2 <= 32'd10;
        op <= 1;
    end
endmodule


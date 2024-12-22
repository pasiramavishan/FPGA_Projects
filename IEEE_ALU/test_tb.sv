/* module test_tb ();


    logic clk, rstn=0, rstn_number=0, enter;
	logic [7:0] number;
	logic [2:0] partition;
    logic [1:0] operation;
	// logic [31:0] result;
	logic [6:0] seg_out1, seg_out2, seg_out3, seg_out4, seg_out5, seg_out6, seg_out7, seg_out8; 

    localparam CLK_PERIOD = 4;

    initial begin
        #2000 $finish;
    end

    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end

    FloatingPointUnit dut (.*);

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(3); 
	
		  #10;
		  rstn <= 1;	
		
			@(posedge clk);
        enter <= 1;
			rstn_number <= 1; 
        #10;
        @(posedge clk);  //15.47         9.56
        number <= 8'b00011111;
        partition <= 3'b000;
        enter <= 0;
        #10;

        enter <= 1;
        #10;
        @(posedge clk);
        number <= 8'b10000101;
        partition <= 3'b001;
        enter <= 0;
        #10;

        enter <= 1;
        #10;
        @(posedge clk);
        number <= 8'b01110111;
        partition <= 3'b010;
        enter <= 0;
        #10;

        enter <= 1;
        #10;
        @(posedge clk);
        number <= 8'b01000001;
        partition <= 3'b011;
        enter <= 0;
        #10;

        enter <= 1;     
        #10;
        @(posedge clk);  
        number <= 8'b11000011;
        partition <= 3'b100;
        enter <= 0;
        #10;

        enter <= 1;
        #10;
        @(posedge clk);
        number <= 8'b11110101;
        partition <= 3'b101;
        enter <= 0;
        #10;

        enter <= 1;
        #10;
        @(posedge clk);
        number <= 8'b00011000;
        partition <= 3'b110;
        enter <= 0;
        #10;

        enter <= 1;
        #10;
        @(posedge clk);
        number <= 8'b01000001;
        partition <= 3'b111;
        enter <= 0;
        #10;
		  

        operation <= 2'b10;
        
        @(posedge clk);
        operation <= 2'b00;

        @(posedge clk);
        operation <= 2'b11;

        @(posedge clk);
        operation <= 2'b01;
        
		  // #10;
		  // rstn <= 1;
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

*/
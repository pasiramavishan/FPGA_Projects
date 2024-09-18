module digital_clock_tb ();
    logic clk=0;     // 1 Hz clock input
    logic reset;     // Reset signal
    // output logic [5:0] sec,   // Seconds (0 to 59)
    // output logic [5:0] min,   // Minutes (0 to 59)
    // output logic [4:0] hour   // Hours (0 to 23)
    logic [2:0] CLOCK;
    logic [6:0] minuteDisp1, minuteDisp2;
    logic [6:0] hourDisp1, hourDisp2;
     
    localparam CLK_PERIOD = 10ns;
	 
	 digital_clock dut(.*);
    initial begin
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end
endmodule
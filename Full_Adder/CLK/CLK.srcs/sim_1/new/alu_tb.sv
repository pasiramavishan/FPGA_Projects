//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 06/28/2024 12:22:37 PM
//// Design Name: 
//// Module Name: alu_tb
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


//module alu_tb();
//    timeunit 1ns;
//    timeprecision 1ps;

//    logic clk;
//    localparam CLK_PERIOD = 10;

//    initial begin
//        clk = 0;
//        forever begin
//            #(CLK_PERIOD/2) clk <= ~clk;
//        end
//    end

//    localparam N = 8;

//    logic [2:0] sel;
//    logic signed [N-1:0] A, B, C;
//    logic Z;

//    alu dut (.*);


//    int status, file_out, file_in;

//    string path_in = "C:/Users/pasir/Desktop/FPGA_Projects/Full_Adder/CLK/Data/input_data.txt";
//    string path_out = "Data/output_data.txt";


//    initial begin
//        file_in = $fopen(path_in, "r");
//        file_out = $fopen(path_out, "w");

//        while (!$feof(file_in)) begin
//            @(posedge clk) #1;
//            status = $fscanf(file_in, "%d\r", A);
//            status = $fscanf(file_in, "%d\r", B); //status can be used for error control
//            status = $fscanf(file_in, "%d\r", sel);
//        end
    

//        #(CLK_PERIOD*3);
//        $fclose(file_in);
//        $fclose(file_out);

//    end

//    initial begin
//        forever begin
//            @(posedge clk); #1;
//            $fdisplay(file_out, "%d", C);
            
//        end
//    end


//endmodule


module alu_ip_tb();
  timeunit      1ns;
  timeprecision 1ps;

  logic clk;
  localparam CLK_PERIOD = 10;
  initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk <= ~clk;
  end

  logic        [2:0] sel;
  logic signed [7:0] A, B, C;
  logic              Z  ;

  alu_ip    dut (.*);

  int status, file_out, file_in;
  /* paths W.R.T to "project.sim/sim_1/behav/xsim" folder */
  string path_in  = "C:/Users/pasir/Desktop/FPGA_Projects/Full_Adder/CLK/Data/input_data.txt";
  string path_out = "C:/Users/pasir/Desktop/FPGA_Projects/Full_Adder/CLK/Data/output_data.txt";
// string path_in  ="U:/aba/Desktop_Win/missing_semester/systemverilog/data/data_input.txt";
// string path_out ="U:/aba/Desktop_Win/missing_semester/systemverilog/data/data_output.txt";

  initial begin
    file_in  = $fopen(path_in, "r");
    file_out = $fopen(path_out, "w");

    while(!$feof(file_in)) begin
      @(posedge clk); #1;
      status = $fscanf(file_in,"%d\r", A  );
      status = $fscanf(file_in,"%d\r", B  );
      status = $fscanf(file_in,"%d\r", sel);
    end

    #(CLK_PERIOD*3);
    $fclose(file_in);
    $fclose(file_out);
  end

  initial begin
    forever begin
      @(posedge clk); #1;
      $fdisplay(file_out, "%d", C);
    end
  end
endmodule
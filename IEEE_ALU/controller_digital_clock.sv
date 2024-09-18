module controller_digital_clock();
    input logic [5:0] number;
    input logic controller
    input logic push;
    output logic [5:0] minute;
    output logic [4:0] hour;

    if (controller == 1 and push == 1)
        minute = number;
    else if (controller == 0 and push == 1)
        hour = number;

    
endmodule
module digital_clock(
    input logic clk,       // 1 Hz clock input
    input logic reset,     // Reset signal
    // output logic [5:0] sec,   // Seconds (0 to 59)
    // output logic [5:0] min,   // Minutes (0 to 59)
    // output logic [4:0] hour   // Hours (0 to 23)
    output logic CLOCK,
    output logic [6:0] minuteDisp1, minuteDisp2,
    output logic [6:0] hourDisp1, hourDisp2
);
    logic [3:0] CLOCK_ = 0;
    logic [5:0] sec_reg = 0, min_reg = 0;
    logic [4:0] hour_reg = 0;
    

    // Seconds counter
    // always_ff @( posedge clk ) begin
    //     CLOCK_ <= CLOCK_ + 1;        
    // end
    assign CLOCK = 0;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            CLOCK_ <= 6'd0;
        end else if (CLOCK_ == 4'b1111) begin
            CLOCK_ <= 6'd0;
            CLOCK <= ~CLOCK;
        end else begin
            CLOCK_ <= CLOCK_ + 1;
        end
    end
    always_ff @(posedge clk or posedge reset) begin
        // if (reset) begin
        //     sec_reg <= 6'd0;
        // end else if (sec_reg == 6'd59) begin
        //     sec_reg <= 6'd0;
        // end else begin
        //     sec_reg <= sec_reg + 1;
        // end

        if (reset) begin
            sec_reg <= 6'd0;
        end else if (CLOCK_ == 4'b1111) begin
            if (sec_reg == 6'd59) begin
                sec_reg <= 6'd0;
            end else begin
                sec_reg <= sec_reg + 1;
            end
        end
    end

    // Minutes counter
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            min_reg <= 6'd0;
        end else if (CLOCK_ == 4'b1111 && sec_reg == 6'd59) begin
            if (min_reg == 6'd59) begin
                min_reg <= 6'd0;
            end else begin
                min_reg <= min_reg + 1;
            end
        end
    end

    // Hours counter
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            hour_reg <= 5'd0;
        end else if (CLOCK_ == 4'b1111 && sec_reg == 6'd59 && min_reg == 6'd59) begin
            if (hour_reg == 5'd23) begin
                hour_reg <= 5'd0;
            end else begin
                hour_reg <= hour_reg + 1;
            end
        end
    end

    // Output assignments

    seven_segment seg1(
        .digit(min_reg % 10),  // 4-bit input for the digit (0-9)
        .seg(minuteDisp1)    // 7-segment output
    );
    seven_segment seg2(
        .digit(min_reg / 10),  // 4-bit input for the digit (0-9)
        .seg(minuteDisp2)    // 7-segment output
    );
    seven_segment seg3(
        .digit(hour_reg % 10),  // 4-bit input for the digit (0-9)
        .seg(hourDisp1)    // 7-segment output
    );
    seven_segment seg4(
        .digit(hour_reg / 10),  // 4-bit input for the digit (0-9)
        .seg(hourDisp2)    // 7-segment output
    );

endmodule

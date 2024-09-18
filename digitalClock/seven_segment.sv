module seven_segment(
    input logic [3:0] digit,  // 4-bit input for the digit (0-9)
    output logic [6:0] seg    // 7-segment output
);

    always_comb begin
        case(digit)
            4'd0: seg = 7'b0000001; // Display 0
            4'd1: seg = 7'b1001111; // Display 1
            4'd2: seg = 7'b0010010; // Display 2
            4'd3: seg = 7'b0000110; // Display 3
            4'd4: seg = 7'b1001100; // Display 4
            4'd5: seg = 7'b0100100; // Display 5
            4'd6: seg = 7'b0100000; // Display 6
            4'd7: seg = 7'b0001111; // Display 7
            4'd8: seg = 7'b0000000; // Display 8
            4'd9: seg = 7'b0000100; // Display 9
            default: seg = 7'b1111111; // Turn off all segments (blank display)
        endcase
    end
endmodule

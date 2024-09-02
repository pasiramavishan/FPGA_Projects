module UpAndDownCounter (
    input push1, 
    input push2, 
    input clk,
    output reg [2:0] result
);

    // Initialize result to 0
    initial begin
        result = 3'b000;
    end

    // Sequential logic for the up and down counter
    always @ (posedge clk) begin
        if (push1) begin
            if (result == 7)
                result <= 0;
            else
                result <= result + 1;
        end
        else if (push2) begin
            if (result == 0)
                result <= 7;
            else
                result <= result - 1;
        end
    end

endmodule

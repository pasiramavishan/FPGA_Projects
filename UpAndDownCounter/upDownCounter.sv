module upDownCounter (
    input logic clk;
    input logic push,
    output logic [6:0] display
);
    logic [3:0] counter = 0;

    always_ff @( posedge clk or posedge push ) begin : blockName
        if (counter == 10) begin
            counter = 0;
        end

        else begin
            couter = counter + 1;         
        end
    end
    
endmodule
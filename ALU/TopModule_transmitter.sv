module TopModule_transmitter (
    input  logic [7:0] data_in,
    input  logic wr_en_in, clk,
    output logic Tx, Tx_busy
);

    logic Txclk_en, Rxclk_en;

    // Transmitter module instance
    transmitter UART_Transmitter (
        .data_in(32'h13245AFD),   // Example hardcoded 32-bit data
        .wr_en(wr_en_in),        // Enable wire to start 
        .clk_50m(clk),        
        .clken(Txclk_en),         // Clock signal for the transmitter
        .Tx(Tx),                  // Single 1-bit register variable to hold transmitting bit
        .Tx_busy(Tx_busy)         // Transmitter busy signal 
    );

    // Baudrate generator instance
    baudrate Baudrate (
        .clk_50m(clk),
        .Rxclk_en(Rxclk_en),
        .Txclk_en(Txclk_en)
    );

endmodule

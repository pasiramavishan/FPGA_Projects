//AXI stream is most popular bus architecture, Mobile tablet contain this. AXI uses AXI stream
//s_data is one bit
//parallel data send one by one (here 8 paralle bits in to serial bit stream)
//when p_data receive data p_valid indicate whether this data is valid
//AXI stream is coming p_valid, is coming from protocol
//p_ready indicates that whether data can be send in to it or not (unit is idle)
//when both p_ready and p_valid is high, it means that data is transfering
//shift register is used, parallel data copied to shift register and data is shift one by one(data is send to other side)
//while this happening s_valid = 1, indicating that sending data is valid. While this happening p_ready = 0, indicating that more data cannot be send
//After shifting is done (after data done sending serially), p_ready = 1 indicatin that data is ready to recieved into unit.
//p_ready indicates whether unit is busy ir idle, at busy time data cannot be send in to unit
//transferrin data to other side is happening when both s_valid and s_reasy is high
//if s_ready is not one, then data cannot be send to other side

module p2s #(N = 8)
(
    input  logic clk, rstn, ser_ready, par_valid, 
    input  logic [N-1:0] par_data,
    output logic par_ready, ser_data, ser_valid
);
    localparam N_BITS = $clog2(N);
    enum logic {RX=0, TX=1} next_state, state; //= RX;
    logic [N_BITS-1:0] count; // = 0; // Initial values when FPGA powers up
    logic [N     -1:0] shift_reg;

    always_comb
    unique case (state)
        RX: next_state = par_valid               ? TX : RX;
        TX: next_state = ser_ready && count==N-1 ? RX : TX;
    endcase

    always_ff @(posedge clk or negedge rstn)
    state <= !rstn ? RX : next_state;

    assign ser_data  = shift_reg[0];
    assign par_ready = (state == RX);
    assign ser_valid = (state == TX);

    always_ff @(posedge clk or negedge rstn)
        if (!rstn) count    <= '0;
    else 
        unique case (state)
        RX: begin  
            shift_reg <= par_data;
            count     <= '0;
            end
        TX: if (ser_ready) begin
            shift_reg <= shift_reg >> 1;
            count     <= count + 1'd1;
            end 
    endcase
endmodule
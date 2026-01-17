module debouncer_pause (
    input wire clk,
    input wire rst,
    input wire btn_pause,       //noisy input
    output reg btn_pause_clean  //Cleaned output
);
    //20ms Debounce Time
    //50MHz to 20ms / 20ns = 1,000,000 ticks
    localparam LIMIT = 1000000;
    localparam BITS  = 20;
    wire tick_20ms;
    wire [BITS-1:0] count_val; 
    reg current_state;
    wire next_state;    
    //timer Instantiation
    gen_mod_counter #(.N(BITS), .M(LIMIT)) timer_inst (
        .clk(clk),
        .reset(rst),
        .max_tick(tick_20ms),
        .q(count_val)
    );
    //Current State logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= 1'b0;
        else
            current_state <= next_state;
    end
    //nsl
    assign next_state = (tick_20ms) ? btn_pause : current_state;
    //opl
    always @(*) begin
        btn_pause_clean = current_state;
    end
endmodule

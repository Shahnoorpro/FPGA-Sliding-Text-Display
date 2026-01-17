module debouncer_select (
    input wire clk,
    input wire rst,
    input wire sw_select,       //noisy input
    output reg sw_select_clean  //cleaned Output
);
    // 20ms Debounce Time 
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
    //csl
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= 1'b0;
        else
            current_state <= next_state;
    end
    //nsl
    assign next_state = (tick_20ms) ? sw_select : current_state;
    //opl
    always @(*) begin
        sw_select_clean = current_state;
    end

endmodule

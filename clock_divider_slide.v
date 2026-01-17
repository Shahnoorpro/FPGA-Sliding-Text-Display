module clock_divider_slide (
    input wire clk,      
    input wire rst,      
    output wire tick_slide 
);
    localparam LIMIT = 16666666;
    localparam BITS  = 25;
    wire [BITS-1:0] count_val;
    //Instantiation
    gen_mod_counter #(.N(BITS), .M(LIMIT)) timer_inst (
        .clk(clk),
        .reset(rst),
        .max_tick(tick_slide),
        .q(count_val)          
    );

endmodule


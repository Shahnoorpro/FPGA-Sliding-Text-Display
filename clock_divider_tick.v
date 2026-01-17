module clock_divider_scan (
    input wire clk,      
    input wire rst,     
    output wire tick_scan 
);
    localparam LIMIT = 50000;
    localparam BITS  = 16;
    wire [BITS-1:0] count_val;
    //Instantiation mod counter
    gen_mod_counter #(
        .N(BITS), 
        .M(LIMIT)
    ) scan_timer (
        .clk(clk),
        .reset(rst),
        .max_tick(tick_scan), 
        .q(count_val)        
    );
endmodule
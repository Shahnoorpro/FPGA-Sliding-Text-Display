module window_counter (
    input wire clk,
    input wire rst,
    input wire tick_slide,    
    input wire scroll_en,     
    output wire [3:0] win_idx 
);
    localparam MSG_LEN = 12;
    //CSL
    reg [3:0] r_reg;
    wire [3:0] r_next;
    // Sequential Logic
    always @(posedge clk, posedge rst) begin
        if (rst) 
            r_reg <= 0;
        else 
            r_reg <= r_next;
    end
    //NSL
    assign r_next = (tick_slide && scroll_en) ? 
                    ((r_reg == MSG_LEN - 1) ? 4'd0 : r_reg + 1) : 
                    r_reg;
    //OPL
    assign win_idx = r_reg;
endmodule

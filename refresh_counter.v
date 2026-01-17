module refresh_counter (
    input wire clk,
    input wire rst,
    input wire tick_scan,
    output wire [1:0] scan_sel //2 bit selector 00,01,10,11
);
    //CSL
    reg [1:0] r_reg;
    wire [1:0] r_next;
    //Sequential Logic 
    always @(posedge clk, posedge rst) begin
        if (rst) 
            r_reg <= 2'b00;
        else 
            r_reg <= r_next;
    end
    //NSL    
    assign r_next = (tick_scan) ? (r_reg + 1'b1) : r_reg;
    //OPL
    assign scan_sel = r_reg;
endmodule

module anode_logic (
    input wire [1:0] scan_sel, // 00, 01, 10, 11
    output wire [3:0] an       
);
    assign an = (scan_sel == 2'b00) ? 4'b1110 : // Digit 0 (Right)
                (scan_sel == 2'b01) ? 4'b1101 : // Digit 1
                (scan_sel == 2'b10) ? 4'b1011 : // Digit 2
                                      4'b0111;  // Digit 3 (Left)
endmodule

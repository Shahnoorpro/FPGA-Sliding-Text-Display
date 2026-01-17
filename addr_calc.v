module addr_calc (
    input wire [3:0] win_idx,  
    input wire [1:0] scan_sel,
    output wire [3:0] char_addr 
);  
    wire [3:0] sum; // 4 bit Wire
    assign sum = win_idx + (3 - scan_sel);
    //Comparator (Checks if sum >= 12)
    //Subtractor (Calc sum - 12)
    //Mux (2 to 1 MUX) to select btw original or subtracted val
    assign char_addr = (sum >= 12) ? (sum - 4'd12) : sum;
endmodule

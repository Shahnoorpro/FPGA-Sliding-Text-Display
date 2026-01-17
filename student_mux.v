module student_mux (
    input wire [3:0] code_std1,      // Input A (4-bit)
    input wire [3:0] code_std2,      // Input B (4-bit)
    input wire sel,                  // Selector
    output wire [3:0] final_char_code // Output (4-bit)
);

    // If sel is 1 pick Std2. If sel is 0 pick Std1.
    assign final_char_code = (sel == 1'b1) ? code_std2 : code_std1;

endmodule

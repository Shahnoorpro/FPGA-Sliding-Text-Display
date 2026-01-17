module rom_student_1 (
    input wire [3:0] addr,      // address 0-11
    output reg [3:0] char_code  // 4 bit Output
);
    localparam CHAR_E    = 4'd10; // Hex A
    localparam CHAR_L    = 4'd11; // Hex B
    localparam CHAR_C    = 4'd12; // Hex C
    localparam CHAR_P    = 4'd13; // Hex D
    localparam CHAR_S    = 4'd14; // Hex E
    localparam CHAR_DASH = 4'd15; // Hex F
    always @(*) begin
        case (addr)
            // "SP24"
            4'd0:  char_code = CHAR_S;
            4'd1:  char_code = CHAR_P;
            4'd2:  char_code = 4'd2;
            4'd3:  char_code = 4'd4;
            // "-"
            4'd4:  char_code = CHAR_DASH;            
            // "ELC"
            4'd5:  char_code = CHAR_E;
            4'd6:  char_code = CHAR_L;
            4'd7:  char_code = CHAR_C;           
            // "-"
            4'd8:  char_code = CHAR_DASH;            
            // "068"
            4'd9:  char_code = 4'd0;
            4'd10: char_code = 4'd6;
            4'd11: char_code = 4'd8;            
            default: char_code = CHAR_DASH;
        endcase
    end
endmodule
 
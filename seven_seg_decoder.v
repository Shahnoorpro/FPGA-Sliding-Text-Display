module seven_seg_decoder (
    input wire [3:0] char_code, 
    output reg [6:0] seg        
);
    localparam CHAR_E    = 4'd10;
    localparam CHAR_L    = 4'd11;
    localparam CHAR_C    = 4'd12;
    localparam CHAR_P    = 4'd13;
    localparam CHAR_S    = 4'd14;
    localparam CHAR_DASH = 4'd15;

    always @(*) begin
        case (char_code)
            // Numbers 0-9 (Standard)
            4'd0: seg = 7'h40; // 0
            4'd1: seg = 7'h79; // 1
            4'd2: seg = 7'h24; // 2
            4'd3: seg = 7'h30; // 3
            4'd4: seg = 7'h19; // 4
            4'd5: seg = 7'h12; // 5
            4'd6: seg = 7'h02; // 6
            4'd7: seg = 7'h78; // 7
            4'd8: seg = 7'h00; // 8
            4'd9: seg = 7'h10; // 9
            CHAR_E:    seg = 7'h06; // Shows 'E'
            CHAR_L:    seg = 7'h47; // Shows 'L'
            CHAR_C:    seg = 7'h46; // Shows 'C'
            CHAR_P:    seg = 7'h0C; // Shows 'P'
            CHAR_S:    seg = 7'h12; // Shows 'S' 
            CHAR_DASH: seg = 7'h3F; // Shows '-'
            
            //default all Off
            default:   seg = 7'h7F; 
        endcase
    end
endmodule

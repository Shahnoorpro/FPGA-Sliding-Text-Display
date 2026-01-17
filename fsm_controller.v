`timescale 1ns / 1ps

module fsm_controller (
    input wire clk,
    input wire rst,
    input wire pulse_pause,   // From e3dge Detector
    input wire sw_student,    // from Debouncer
    output wire scroll_en,    // controls counter
    output wire sel_student   // controls MUX
);
    //CSL
    reg cs;
    wire ns;

    localparam STOP = 1'b0;
    localparam RUN  = 1'b1;
    // Sequential Logic
    always @(posedge clk, posedge rst) begin
        if (rst) 
            cs <= RUN; // Start in RUN mode
        else 
            cs <= ns;
    end
    //NSL
    assign ns = (pulse_pause) ? ~cs : cs;
    //OPL    
    // Output 1 by above logic
    assign scroll_en = (cs == RUN);

    // Output 2 bypass 
    assign sel_student = sw_student;
endmodule

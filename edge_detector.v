module edge_detector_rise_moore (
    input wire clk,
    input wire rst,
    input wire sig_in,
    output wire edge_pulse 
);
    //csl
    reg [1:0] cs, ns;
    
    localparam [1:0]
        S_IDLE_0 = 2'b00,
        S_PULSE  = 2'b01,
        S_WAIT_1 = 2'b10;
    always @(posedge clk, posedge rst) begin
        if (rst)
            cs <= S_IDLE_0;
        else
            cs <= ns;
    end
    //nsl
    always @(*) begin
        ns = cs; 
        case (cs)
            S_IDLE_0: begin
                if (sig_in == 1'b1) ns = S_PULSE;
                else ns = S_IDLE_0;
            end
            S_PULSE: begin
                if (sig_in == 1'b1) ns = S_WAIT_1;
                else ns = S_IDLE_0;
            end
            S_WAIT_1: begin
                if (sig_in == 1'b0) ns = S_IDLE_0;
                else ns = S_WAIT_1;
            end
            default: ns = S_IDLE_0;
        endcase
    end
    //opl   
    assign edge_pulse = (cs == S_PULSE) ? 1'b1 : 1'b0;
endmodule

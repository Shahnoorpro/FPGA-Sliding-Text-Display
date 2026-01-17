`timescale 1ns / 1ps

module top_scrolling_display (
    input wire clk,         // 1-bit
    input wire rst,         // 1-bit
    input wire btn_pause,   // 1-bit
    input wire sw_select,   // 1-bit
    output wire [3:0] an,   // 4-bit
    output wire [6:0] seg   // 7-bit
);
    wire btn_pause_clean, sw_select_clean, pulse_pause;
    wire tick_slide, tick_scan;
    wire scroll_en, sel_student;
    wire [3:0] win_idx;     // 4-bit Index
    wire [1:0] scan_sel;    // 2-bit Scan Selector
    wire [3:0] char_addr;   // 4-bit Memory Address
    wire [3:0] code_std1;   // 4-bit ROM Data 1
    wire [3:0] code_std2;   // 4-bit ROM Data 2
    wire [3:0] final_char;  // 4-bit MUX Output
	 
    debouncer_pause db_p (
        .clk(clk), .rst(rst), .btn_pause(btn_pause), .btn_pause_clean(btn_pause_clean)
    );
    edge_detector_rise_moore ed (
        .clk(clk), .rst(rst), .sig_in(btn_pause_clean), .edge_pulse(pulse_pause)
    );
    debouncer_select db_s (
        .clk(clk), .rst(rst), .sw_select(sw_select), .sw_select_clean(sw_select_clean)
    );
    fsm_controller ctrl (
        .clk(clk), .rst(rst), .pulse_pause(pulse_pause), .sw_student(sw_select_clean),
        .scroll_en(scroll_en), .sel_student(sel_student)
    );
    clock_divider_slide clk_slide (
        .clk(clk), .rst(rst), .tick_slide(tick_slide)
    );
    
    clock_divider_scan clk_scan (
        .clk(clk), .rst(rst), .tick_scan(tick_scan)
    );
    window_counter win_cnt (
        .clk(clk), .rst(rst), .tick_slide(tick_slide), .scroll_en(scroll_en), .win_idx(win_idx)
    );
    
    refresh_counter ref_cnt (
        .clk(clk), .rst(rst), .tick_scan(tick_scan), .scan_sel(scan_sel)
    );
    anode_logic anode (
        .scan_sel(scan_sel), .an(an)
    );
    addr_calc calculator (
        .win_idx(win_idx), .scan_sel(scan_sel), .char_addr(char_addr)
    );
    rom_student_1 rom1 (
        .addr(char_addr), .char_code(code_std1)
    );
    rom_student_2 rom2 (
        .addr(char_addr), .char_code(code_std2)
    );
    student_mux mux (
        .code_std1(code_std1), .code_std2(code_std2), .sel(sel_student), .final_char_code(final_char)
    );
    seven_seg_decoder decoder (
        .char_code(final_char), .seg(seg)
    );
endmodule
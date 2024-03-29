// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="max_three,hls_ip_2018_3,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xa7a12tcsg325-1q,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.178000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=150,HLS_VERSION=2018_3}" *)

module max_three (
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a,
        b,
        c,
        ap_return
);


input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] a;
input  [31:0] b;
input  [31:0] c;
output  [31:0] ap_return;

wire   [0:0] tmp_1_fu_40_p2;
wire   [0:0] tmp_1_fu_40_p2_temp;
wire   [0:0] tmp_2_fu_54_p2;
wire   [0:0] tmp_fu_34_p2;
wire   [0:0] tmp_fu_34_p2_temp;
wire   [31:0] a_assign_fu_46_p3;
wire   [31:0] max_fu_60_p3;

assign a_assign_fu_46_p3 = ((tmp_1_fu_40_p2_temp) ? a : c);

assign tmp_1_fu_40_p2_temp = tmp_1_fu_40_p2 & 1'd1;

assign ap_done = ap_start;

assign ap_idle = 1'b1;

assign ap_ready = ap_start;

assign ap_return = ((tmp_fu_34_p2_temp) ? a_assign_fu_46_p3 : max_fu_60_p3);

assign tmp_fu_34_p2_temp = tmp_fu_34_p2 & 1'd1;

assign max_fu_60_p3 = ((tmp_2_fu_54_p2_temp) ? c : b);

assign tmp_2_fu_54_p2_temp = tmp_2_fu_54_p2 & 1'd1;

assign tmp_1_fu_40_p2 = (($signed(a) > $signed(c)) ? 1'b1 : 1'b0);

assign tmp_2_fu_54_p2 = (($signed(c) > $signed(b)) ? 1'b1 : 1'b0);

assign tmp_fu_34_p2 = (($signed(a) > $signed(b)) ? 1'b1 : 1'b0);

endmodule //max_three

// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="hls_macc_motion,hls_ip_2018_3,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xa7a12tcsg325-1q,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.470000,HLS_SYN_LAT=3,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=42,HLS_SYN_FF=580,HLS_SYN_LUT=722,HLS_VERSION=2018_3}" *)

module hls_macc_motion (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        in1,
        in2,
        in3,
        in4,
        in5,
        in6,
        in7,
        in8,
        in9,
        in10,
        out1,
        out1_ap_vld,
        out2,
        out2_ap_vld,
        out3,
        out3_ap_vld
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] in1;
input  [31:0] in2;
input  [31:0] in3;
input  [31:0] in4;
input  [31:0] in5;
input  [31:0] in6;
input  [31:0] in7;
input  [31:0] in8;
input  [31:0] in9;
input  [31:0] in10;
output  [31:0] out1;
output   out1_ap_vld;
output  [31:0] out2;
output   out2_ap_vld;
output  [31:0] out3;
output   out3_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg out1_ap_vld;
reg out2_ap_vld;
reg out3_ap_vld;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [31:0] mult10_fu_123_p2;
reg   [31:0] mult10_reg_287;
wire   [31:0] add3_fu_129_p2;
reg   [31:0] add3_reg_292;
wire   [31:0] add5_fu_135_p2;
reg   [31:0] add5_reg_297;
wire    ap_CS_fsm_state2;
wire   [31:0] mult2_fu_141_p2;
reg   [31:0] mult2_reg_329;
wire  signed [31:0] tmp1_fu_147_p2;
reg  signed [31:0] tmp1_reg_334;
wire  signed [31:0] tmp_fu_152_p2;
reg  signed [31:0] tmp_reg_339;
wire  signed [31:0] tmp4_fu_157_p2;
reg  signed [31:0] tmp4_reg_344;
wire  signed [31:0] add4_s_fu_162_p2;
reg  signed [31:0] add4_s_reg_349;
wire  signed [31:0] tmp6_fu_167_p2;
reg  signed [31:0] tmp6_reg_354;
wire   [31:0] mult7_fu_171_p2;
reg   [31:0] mult7_reg_359;
wire    ap_CS_fsm_state3;
wire   [31:0] mult11_fu_175_p2;
reg   [31:0] mult11_reg_364;
wire   [31:0] mult13_fu_179_p2;
reg   [31:0] mult13_reg_369;
wire   [31:0] add2_fu_183_p2;
reg   [31:0] add2_reg_374;
wire  signed [31:0] add1_s_fu_187_p2;
reg  signed [31:0] add1_s_reg_379;
wire   [31:0] tmp3_fu_191_p2;
reg   [31:0] tmp3_reg_384;
wire   [31:0] tmp5_fu_195_p2;
reg   [31:0] tmp5_reg_389;
wire   [31:0] add13_fu_199_p2;
reg   [31:0] add13_reg_394;
wire   [31:0] tmp7_fu_203_p2;
reg   [31:0] tmp7_reg_399;
wire    ap_CS_fsm_state4;
wire  signed [31:0] mult10_fu_123_p0;
wire  signed [31:0] mult10_fu_123_p1;
wire  signed [31:0] add3_fu_129_p0;
wire  signed [31:0] add3_fu_129_p1;
wire  signed [31:0] add5_fu_135_p0;
wire  signed [31:0] add5_fu_135_p1;
wire  signed [31:0] mult2_fu_141_p0;
wire  signed [31:0] mult2_fu_141_p1;
wire  signed [31:0] tmp1_fu_147_p0;
wire  signed [31:0] tmp1_fu_147_p1;
wire  signed [31:0] tmp4_fu_157_p0;
wire  signed [31:0] add4_s_fu_162_p0;
wire  signed [31:0] tmp6_fu_167_p0;
wire  signed [31:0] mult7_fu_171_p0;
wire  signed [31:0] mult7_fu_171_p1;
wire  signed [31:0] mult11_fu_175_p0;
wire  signed [31:0] mult11_fu_175_p1;
wire  signed [31:0] mult13_fu_179_p0;
wire  signed [31:0] mult13_fu_179_p1;
wire  signed [31:0] add2_fu_183_p0;
wire  signed [31:0] tmp3_fu_191_p0;
wire  signed [31:0] tmp5_fu_195_p0;
wire  signed [31:0] add13_fu_199_p0;
wire  signed [31:0] tmp7_fu_203_p0;
wire  signed [31:0] add6_fu_207_p0;
wire   [31:0] add9_fu_212_p2;
wire   [31:0] shf1_fu_216_p2;
wire   [31:0] tmp2_fu_222_p2;
wire   [31:0] add14_fu_233_p2;
wire   [28:0] shf2_fu_237_p4;
wire   [31:0] shf2_1_fu_247_p1;
wire   [31:0] tmp8_fu_251_p2;
reg   [3:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        add13_reg_394 <= add13_fu_199_p2;
        add1_s_reg_379 <= add1_s_fu_187_p2;
        add2_reg_374 <= add2_fu_183_p2;
        mult11_reg_364 <= mult11_fu_175_p2;
        mult13_reg_369 <= mult13_fu_179_p2;
        mult7_reg_359 <= mult7_fu_171_p2;
        tmp3_reg_384 <= tmp3_fu_191_p2;
        tmp5_reg_389 <= tmp5_fu_195_p2;
        tmp7_reg_399 <= tmp7_fu_203_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        add3_reg_292 <= add3_fu_129_p2;
        add5_reg_297 <= add5_fu_135_p2;
        mult10_reg_287 <= mult10_fu_123_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add4_s_reg_349 <= add4_s_fu_162_p2;
        mult2_reg_329 <= mult2_fu_141_p2;
        tmp1_reg_334 <= tmp1_fu_147_p2;
        tmp4_reg_344 <= tmp4_fu_157_p2;
        tmp6_reg_354 <= tmp6_fu_167_p2;
        tmp_reg_339 <= tmp_fu_152_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        out1_ap_vld = 1'b1;
    end else begin
        out1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        out2_ap_vld = 1'b1;
    end else begin
        out2_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        out3_ap_vld = 1'b1;
    end else begin
        out3_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add13_fu_199_p0 = in4;

assign add13_fu_199_p2 = ($signed(add13_fu_199_p0) * $signed(add4_s_reg_349));

assign add14_fu_233_p2 = (tmp7_reg_399 + mult13_reg_369);

assign add1_s_fu_187_p2 = (in2 + mult2_reg_329);

assign add2_fu_183_p0 = in4;

assign add2_fu_183_p2 = ($signed(add2_fu_183_p0) * $signed(tmp1_reg_334));

assign add3_fu_129_p0 = in7;

assign add3_fu_129_p1 = in4;

assign add3_fu_129_p2 = ($signed(add3_fu_129_p0) * $signed(add3_fu_129_p1));

assign add4_s_fu_162_p0 = in8;

assign add4_s_fu_162_p2 = ($signed(add4_s_fu_162_p0) + $signed(mult10_reg_287));

assign add5_fu_135_p0 = in10;

assign add5_fu_135_p1 = in10;

assign add5_fu_135_p2 = ($signed(add5_fu_135_p0) * $signed(add5_fu_135_p1));

assign add6_fu_207_p0 = in1;

assign add9_fu_212_p2 = (tmp3_reg_384 + mult7_reg_359);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign mult10_fu_123_p0 = in9;

assign mult10_fu_123_p1 = in6;

assign mult10_fu_123_p2 = ($signed(mult10_fu_123_p0) * $signed(mult10_fu_123_p1));

assign mult11_fu_175_p0 = in8;

assign mult11_fu_175_p1 = in6;

assign mult11_fu_175_p2 = ($signed(mult11_fu_175_p0) * $signed(mult11_fu_175_p1));

assign mult13_fu_179_p0 = in8;

assign mult13_fu_179_p1 = in7;

assign mult13_fu_179_p2 = ($signed(mult13_fu_179_p0) * $signed(mult13_fu_179_p1));

assign mult2_fu_141_p0 = in3;

assign mult2_fu_141_p1 = in1;

assign mult2_fu_141_p2 = ($signed(mult2_fu_141_p0) * $signed(mult2_fu_141_p1));

assign mult7_fu_171_p0 = in6;

assign mult7_fu_171_p1 = in3;

assign mult7_fu_171_p2 = ($signed(mult7_fu_171_p0) * $signed(mult7_fu_171_p1));

assign out1 = ($signed(add6_fu_207_p0) * $signed(add1_s_reg_379));

assign out2 = (add2_reg_374 + tmp2_fu_222_p2);

assign out3 = (mult11_reg_364 + tmp8_fu_251_p2);

assign shf1_fu_216_p2 = add9_fu_212_p2 << 32'd3;

assign shf2_1_fu_247_p1 = shf2_fu_237_p4;

assign shf2_fu_237_p4 = {{add14_fu_233_p2[31:3]}};

assign tmp1_fu_147_p0 = in5;

assign tmp1_fu_147_p1 = in4;

assign tmp1_fu_147_p2 = ($signed(tmp1_fu_147_p0) * $signed(tmp1_fu_147_p1));

assign tmp2_fu_222_p2 = (shf1_fu_216_p2 + tmp5_reg_389);

assign tmp3_fu_191_p0 = in5;

assign tmp3_fu_191_p2 = ($signed(tmp3_fu_191_p0) * $signed(tmp_reg_339));

assign tmp4_fu_157_p0 = in7;

assign tmp4_fu_157_p2 = ($signed(tmp4_fu_157_p0) + $signed(in2));

assign tmp5_fu_195_p0 = in3;

assign tmp5_fu_195_p2 = ($signed(tmp5_fu_195_p0) * $signed(tmp4_reg_344));

assign tmp6_fu_167_p0 = in7;

assign tmp6_fu_167_p2 = ($signed(tmp6_fu_167_p0) + $signed(add5_reg_297));

assign tmp7_fu_203_p0 = in9;

assign tmp7_fu_203_p2 = ($signed(tmp7_fu_203_p0) * $signed(tmp6_reg_354));

assign tmp8_fu_251_p2 = (shf2_1_fu_247_p1 + add13_reg_394);

assign tmp_fu_152_p2 = (in2 + add3_reg_292);

endmodule //hls_macc_motion

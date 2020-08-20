// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="diff,hls_ip_2018_3,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xa7a12tcsg325-1q,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.470000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=12,HLS_SYN_FF=326,HLS_SYN_LUT=348,HLS_VERSION=2018_3}" *)

module diff (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        x,
        dx,
        u,
        a,
        y,
        ap_return
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] x;
input  [31:0] dx;
input  [31:0] u;
input  [31:0] a;
input  [31:0] y;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire  signed [31:0] tmp_fu_87_p2;
reg  signed [31:0] tmp_reg_163;
wire  signed [31:0] tmp1_fu_98_p2;
reg  signed [31:0] tmp1_reg_172;
wire    ap_CS_fsm_state2;
wire   [0:0] tmp_1_fu_93_p2;
wire   [31:0] x_assign_fu_103_p2;
reg   [31:0] x_assign_reg_177;
wire   [31:0] tmp_3_fu_108_p2;
reg   [31:0] tmp_3_reg_182;
wire    ap_CS_fsm_state3;
wire   [31:0] tmp_5_fu_113_p2;
reg   [31:0] tmp_5_reg_187;
wire  signed [31:0] u_assign_fu_123_p2;
reg  signed [31:0] u_assign_reg_192;
wire    ap_CS_fsm_state4;
wire   [31:0] tmp_7_fu_128_p2;
reg   [31:0] tmp_7_reg_198;
wire    ap_CS_fsm_state5;
wire   [31:0] y_assign_fu_132_p2;
wire    ap_CS_fsm_state6;
reg  signed [31:0] p_s_reg_52;
reg  signed [31:0] p_1_reg_62;
reg  signed [31:0] p_0_reg_72;
wire  signed [31:0] tmp_2_fu_81_p0;
wire   [31:0] tmp_2_fu_81_p2;
wire  signed [31:0] tmp_fu_87_p1;
wire  signed [31:0] x_assign_fu_103_p1;
wire   [31:0] tmp_4_fu_118_p2;
wire  signed [31:0] tmp_7_fu_128_p1;
reg   [5:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        p_0_reg_72 <= x_assign_reg_177;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        p_0_reg_72 <= x;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        p_1_reg_62 <= y_assign_fu_132_p2;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        p_1_reg_62 <= y;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        p_s_reg_52 <= u_assign_reg_192;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        p_s_reg_52 <= u;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_1_fu_93_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp1_reg_172 <= tmp1_fu_98_p2;
        x_assign_reg_177 <= x_assign_fu_103_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        tmp_3_reg_182 <= tmp_3_fu_108_p2;
        tmp_5_reg_187 <= tmp_5_fu_113_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        tmp_7_reg_198 <= tmp_7_fu_128_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        tmp_reg_163 <= tmp_fu_87_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        u_assign_reg_192 <= u_assign_fu_123_p2;
    end
end

always @ (*) begin
    if (((tmp_1_fu_93_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((tmp_1_fu_93_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((tmp_1_fu_93_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_return = p_1_reg_62;

assign tmp1_fu_98_p2 = ($signed(tmp_reg_163) * $signed(p_0_reg_72));

assign tmp_1_fu_93_p2 = (($signed(p_0_reg_72) < $signed(a)) ? 1'b1 : 1'b0);

assign tmp_2_fu_81_p0 = dx;

assign tmp_2_fu_81_p2 = tmp_2_fu_81_p0 << 32'd2;

assign tmp_3_fu_108_p2 = ($signed(tmp1_reg_172) * $signed(p_s_reg_52));

assign tmp_4_fu_118_p2 = ($signed(p_s_reg_52) - $signed(tmp_3_reg_182));

assign tmp_5_fu_113_p2 = ($signed(p_1_reg_62) * $signed(tmp_reg_163));

assign tmp_7_fu_128_p1 = dx;

assign tmp_7_fu_128_p2 = ($signed(u_assign_reg_192) * $signed(tmp_7_fu_128_p1));

assign tmp_fu_87_p1 = dx;

assign tmp_fu_87_p2 = ($signed(tmp_2_fu_81_p2) - $signed(tmp_fu_87_p1));

assign u_assign_fu_123_p2 = (tmp_4_fu_118_p2 - tmp_5_reg_187);

assign x_assign_fu_103_p1 = dx;

assign x_assign_fu_103_p2 = ($signed(p_0_reg_72) + $signed(x_assign_fu_103_p1));

assign y_assign_fu_132_p2 = ($signed(tmp_7_reg_198) + $signed(p_1_reg_62));

endmodule //diff

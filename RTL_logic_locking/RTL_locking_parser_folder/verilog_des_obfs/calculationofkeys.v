// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module calculationofkeys (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        L,
        R,
        sub_key_address0,
        sub_key_ce0,
        sub_key_q0,
        ap_return
);

parameter    ap_ST_fsm_state1 = 16'd1;
parameter    ap_ST_fsm_state2 = 16'd2;
parameter    ap_ST_fsm_state3 = 16'd4;
parameter    ap_ST_fsm_state4 = 16'd8;
parameter    ap_ST_fsm_state5 = 16'd16;
parameter    ap_ST_fsm_state6 = 16'd32;
parameter    ap_ST_fsm_state7 = 16'd64;
parameter    ap_ST_fsm_state8 = 16'd128;
parameter    ap_ST_fsm_state9 = 16'd256;
parameter    ap_ST_fsm_state10 = 16'd512;
parameter    ap_ST_fsm_state11 = 16'd1024;
parameter    ap_ST_fsm_state12 = 16'd2048;
parameter    ap_ST_fsm_state13 = 16'd4096;
parameter    ap_ST_fsm_state14 = 16'd8192;
parameter    ap_ST_fsm_state15 = 16'd16384;
parameter    ap_ST_fsm_state16 = 16'd32768;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] L;
input  [31:0] R;
output  [3:0] sub_key_address0;
output   sub_key_ce0;
input  [63:0] sub_key_q0;
output  [63:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg sub_key_ce0;
reg[63:0] ap_return;

(* fsm_encoding = "none" *) reg   [15:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [5:0] E_address0;
reg    E_ce0;
wire   [5:0] E_q0;
wire   [8:0] S_address0;
reg    S_ce0;
wire   [3:0] S_q0;
wire   [4:0] P_address0;
reg    P_ce0;
wire   [5:0] P_q0;
wire   [5:0] PI_address0;
reg    PI_ce0;
wire   [6:0] PI_q0;
wire   [4:0] i_5_fu_301_p2;
reg   [4:0] i_5_reg_734;
wire    ap_CS_fsm_state2;
wire   [63:0] pre_output_fu_307_p3;
reg   [63:0] pre_output_reg_739;
wire   [0:0] exitcond4_fu_295_p2;
wire   [5:0] j_4_fu_321_p2;
reg   [5:0] j_4_reg_747;
wire    ap_CS_fsm_state3;
wire   [0:0] exitcond3_fu_315_p2;
reg   [5:0] E_load_reg_762;
wire    ap_CS_fsm_state4;
wire   [62:0] tmp_41_fu_337_p1;
reg   [62:0] tmp_41_reg_767;
wire   [63:0] s_input_1_fu_360_p3;
wire    ap_CS_fsm_state5;
wire   [46:0] s_input_1_cast6_fu_383_p2;
reg   [46:0] s_input_1_cast6_reg_777;
wire    ap_CS_fsm_state6;
wire   [47:0] s_input_1_cast_fu_389_p2;
reg   [47:0] s_input_1_cast_reg_782;
wire   [3:0] j_5_fu_401_p2;
reg   [3:0] j_5_reg_790;
wire    ap_CS_fsm_state7;
wire   [6:0] tmp_15_fu_433_p2;
reg   [6:0] tmp_15_reg_795;
wire   [0:0] exitcond2_fu_395_p2;
wire   [6:0] tmp_19_fu_439_p2;
reg   [6:0] tmp_19_reg_800;
wire   [6:0] tmp_21_fu_445_p2;
reg   [6:0] tmp_21_reg_805;
wire   [8:0] tmp_30_fu_566_p2;
reg   [8:0] tmp_30_reg_810;
wire    ap_CS_fsm_state8;
wire    ap_CS_fsm_state9;
wire   [5:0] j_6_fu_621_p2;
reg   [5:0] j_6_reg_823;
wire    ap_CS_fsm_state11;
wire   [0:0] exitcond_fu_615_p2;
wire   [30:0] tmp_49_fu_632_p1;
reg   [30:0] tmp_49_reg_833;
wire   [31:0] R1_fu_636_p2;
reg   [5:0] P_load_reg_843;
wire    ap_CS_fsm_state12;
wire   [31:0] f_function_res_1_fu_661_p3;
wire    ap_CS_fsm_state13;
wire   [6:0] i_4_fu_674_p2;
reg   [6:0] i_4_reg_856;
wire    ap_CS_fsm_state14;
wire   [0:0] exitcond_i_fu_668_p2;
wire   [62:0] tmp_16_fu_685_p1;
reg   [62:0] tmp_16_reg_866;
reg   [6:0] PI_load_reg_871;
wire    ap_CS_fsm_state15;
wire   [63:0] inv_init_perm_res_fu_707_p3;
wire    ap_CS_fsm_state16;
reg   [4:0] i_reg_175;
reg   [31:0] L1_reg_187;
reg   [31:0] temp_reg_197;
reg   [5:0] j_reg_208;
reg   [63:0] s_input_reg_219;
reg   [3:0] j_1_reg_231;
wire    ap_CS_fsm_state10;
reg   [5:0] j_2_reg_243;
reg   [31:0] f_function_res_reg_254;
reg   [6:0] i_i_reg_265;
reg   [63:0] inv_init_perm_res_i_reg_276;
wire   [63:0] tmp_11_fu_327_p1;
wire   [63:0] tmp_s_fu_332_p1;
wire  signed [63:0] tmp_12_cast_fu_593_p1;
wire   [63:0] tmp_31_fu_627_p1;
wire   [63:0] tmp_i_fu_680_p1;
reg   [31:0] s_output_fu_94;
wire   [31:0] s_output_1_fu_602_p3;
wire   [5:0] tmp_13_fu_341_p2;
wire   [31:0] tmp_24_cast_fu_346_p1;
wire   [31:0] tmp_14_fu_350_p2;
wire   [0:0] tmp_40_fu_356_p1;
wire   [46:0] tmp_36_fu_379_p1;
wire   [46:0] tmp_35_fu_375_p1;
wire   [47:0] tmp_27_fu_371_p1;
wire   [47:0] tmp_20_fu_367_p1;
wire   [2:0] tmp_42_fu_407_p1;
wire   [5:0] p_shl2_fu_411_p3;
wire   [3:0] tmp_43_fu_423_p2;
wire   [6:0] p_shl2_cast_fu_419_p1;
wire   [6:0] p_shl3_cast_fu_429_p1;
wire  signed [31:0] tmp_27_cast_fu_451_p1;
wire   [47:0] tmp_28_cast_fu_458_p1;
wire   [47:0] tmp_17_fu_462_p2;
wire  signed [31:0] tmp_32_cast_fu_473_p1;
wire   [47:0] tmp_18_fu_468_p2;
wire   [47:0] tmp_33_cast_fu_476_p1;
wire   [47:0] tmp_22_fu_480_p2;
wire   [0:0] tmp_45_fu_490_p3;
wire   [0:0] tmp_44_fu_486_p1;
wire   [46:0] tmp_28_cast3_fu_454_p1;
wire   [46:0] tmp_25_fu_514_p2;
wire   [6:0] tmp_28_fu_525_p2;
wire  signed [31:0] tmp_37_cast_fu_530_p1;
wire   [46:0] tmp_26_fu_520_p2;
wire   [46:0] tmp_38_cast_fu_534_p1;
wire   [2:0] tmp_24_fu_504_p4;
wire   [0:0] tmp_23_fu_498_p2;
wire   [7:0] tmp_9_fu_544_p4;
wire   [46:0] tmp_29_fu_538_p2;
wire   [7:0] tmp_46_fu_558_p1;
wire  signed [8:0] tmp_42_cast_cast_fu_562_p1;
wire  signed [8:0] tmp_41_cast_cast_fu_554_p1;
wire   [9:0] tmp_10_fu_575_p3;
wire  signed [10:0] tmp_35_cast_fu_572_p1;
wire   [10:0] tmp_11_cast_fu_583_p1;
wire   [10:0] tmp_12_fu_587_p2;
wire   [27:0] tmp_47_fu_598_p1;
wire   [5:0] tmp_32_fu_642_p2;
wire   [31:0] tmp_50_cast_fu_647_p1;
wire   [31:0] tmp_33_fu_651_p2;
wire   [0:0] tmp_48_fu_657_p1;
wire   [6:0] tmp_30_i_fu_689_p2;
wire   [63:0] tmp_31_i_fu_694_p1;
wire   [63:0] tmp_32_i_fu_698_p2;
wire   [0:0] tmp_fu_703_p1;
reg   [63:0] ap_return_preg;
reg   [15:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 16'd1;
#0 ap_return_preg = 64'd0;
end

calculationofkeys_E #(
    .DataWidth( 6 ),
    .AddressRange( 48 ),
    .AddressWidth( 6 ))
E_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(E_address0),
    .ce0(E_ce0),
    .q0(E_q0)
);

calculationofkeys_S #(
    .DataWidth( 4 ),
    .AddressRange( 512 ),
    .AddressWidth( 9 ))
S_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(S_address0),
    .ce0(S_ce0),
    .q0(S_q0)
);

calculationofkeys_P #(
    .DataWidth( 6 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
P_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(P_address0),
    .ce0(P_ce0),
    .q0(P_q0)
);

calculationofkeysbkb #(
    .DataWidth( 7 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
PI_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(PI_address0),
    .ce0(PI_ce0),
    .q0(PI_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 64'd0;
    end else begin
        if (((exitcond_i_fu_668_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state14))) begin
            ap_return_preg <= inv_init_perm_res_i_reg_276;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_615_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        L1_reg_187 <= temp_reg_197;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        L1_reg_187 <= L;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond2_fu_395_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state7))) begin
        f_function_res_reg_254 <= 32'd0;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        f_function_res_reg_254 <= f_function_res_1_fu_661_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        i_i_reg_265 <= i_4_reg_856;
    end else if (((exitcond4_fu_295_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        i_i_reg_265 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_615_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        i_reg_175 <= i_5_reg_734;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_reg_175 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        inv_init_perm_res_i_reg_276 <= inv_init_perm_res_fu_707_p3;
    end else if (((exitcond4_fu_295_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        inv_init_perm_res_i_reg_276 <= 64'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        j_1_reg_231 <= j_5_reg_790;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        j_1_reg_231 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond2_fu_395_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state7))) begin
        j_2_reg_243 <= 6'd0;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        j_2_reg_243 <= j_6_reg_823;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond4_fu_295_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        j_reg_208 <= 6'd0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        j_reg_208 <= j_4_reg_747;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond4_fu_295_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        s_input_reg_219 <= 64'd0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        s_input_reg_219 <= s_input_1_fu_360_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        s_output_fu_94 <= s_output_1_fu_602_p3;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        s_output_fu_94 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_615_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
        temp_reg_197 <= R1_fu_636_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        temp_reg_197 <= R;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        E_load_reg_762 <= E_q0;
        tmp_41_reg_767 <= tmp_41_fu_337_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state15)) begin
        PI_load_reg_871 <= PI_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        P_load_reg_843 <= P_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        i_4_reg_856 <= i_4_fu_674_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_5_reg_734 <= i_5_fu_301_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        j_4_reg_747 <= j_4_fu_321_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        j_5_reg_790 <= j_5_fu_401_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        j_6_reg_823 <= j_6_fu_621_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond4_fu_295_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        pre_output_reg_739 <= pre_output_fu_307_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        s_input_1_cast6_reg_777 <= s_input_1_cast6_fu_383_p2;
        s_input_1_cast_reg_782 <= s_input_1_cast_fu_389_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state7) & (exitcond2_fu_395_p2 == 1'd0))) begin
        tmp_15_reg_795[6 : 1] <= tmp_15_fu_433_p2[6 : 1];
        tmp_19_reg_800[6 : 1] <= tmp_19_fu_439_p2[6 : 1];
        tmp_21_reg_805[6 : 1] <= tmp_21_fu_445_p2[6 : 1];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state14) & (exitcond_i_fu_668_p2 == 1'd0))) begin
        tmp_16_reg_866 <= tmp_16_fu_685_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        tmp_30_reg_810 <= tmp_30_fu_566_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state11) & (exitcond_fu_615_p2 == 1'd0))) begin
        tmp_49_reg_833 <= tmp_49_fu_632_p1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        E_ce0 = 1'b1;
    end else begin
        E_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        PI_ce0 = 1'b1;
    end else begin
        PI_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        P_ce0 = 1'b1;
    end else begin
        P_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        S_ce0 = 1'b1;
    end else begin
        S_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | ((exitcond_i_fu_668_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state14)))) begin
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
    if (((exitcond_i_fu_668_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state14))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_i_fu_668_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state14))) begin
        ap_return = inv_init_perm_res_i_reg_276;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        sub_key_ce0 = 1'b1;
    end else begin
        sub_key_ce0 = 1'b0;
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
            if (((exitcond4_fu_295_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state14;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((exitcond3_fu_315_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            if (((exitcond2_fu_395_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state7))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state11 : begin
            if (((exitcond_fu_615_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state11))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state14 : begin
            if (((exitcond_i_fu_668_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state14))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state15;
            end
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign E_address0 = tmp_11_fu_327_p1;

assign PI_address0 = tmp_i_fu_680_p1;

assign P_address0 = tmp_31_fu_627_p1;

assign R1_fu_636_p2 = (f_function_res_reg_254 ^ L1_reg_187);

assign S_address0 = tmp_12_cast_fu_593_p1;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign exitcond2_fu_395_p2 = ((j_1_reg_231 == 4'd8) ? 1'b1 : 1'b0);

assign exitcond3_fu_315_p2 = ((j_reg_208 == 6'd48) ? 1'b1 : 1'b0);

assign exitcond4_fu_295_p2 = ((i_reg_175 == 5'd16) ? 1'b1 : 1'b0);

assign exitcond_fu_615_p2 = ((j_2_reg_243 == 6'd32) ? 1'b1 : 1'b0);

assign exitcond_i_fu_668_p2 = ((i_i_reg_265 == 7'd64) ? 1'b1 : 1'b0);

assign f_function_res_1_fu_661_p3 = {{tmp_49_reg_833}, {tmp_48_fu_657_p1}};

assign i_4_fu_674_p2 = (i_i_reg_265 + 7'd1);

assign i_5_fu_301_p2 = (i_reg_175 + 5'd1);

assign inv_init_perm_res_fu_707_p3 = {{tmp_16_reg_866}, {tmp_fu_703_p1}};

assign j_4_fu_321_p2 = (j_reg_208 + 6'd1);

assign j_5_fu_401_p2 = (j_1_reg_231 + 4'd1);

assign j_6_fu_621_p2 = (j_2_reg_243 + 6'd1);

assign p_shl2_cast_fu_419_p1 = p_shl2_fu_411_p3;

assign p_shl2_fu_411_p3 = {{tmp_42_fu_407_p1}, {3'd0}};

assign p_shl3_cast_fu_429_p1 = tmp_43_fu_423_p2;

assign pre_output_fu_307_p3 = {{temp_reg_197}, {L1_reg_187}};

assign s_input_1_cast6_fu_383_p2 = (tmp_36_fu_379_p1 ^ tmp_35_fu_375_p1);

assign s_input_1_cast_fu_389_p2 = (tmp_27_fu_371_p1 ^ tmp_20_fu_367_p1);

assign s_input_1_fu_360_p3 = {{tmp_41_reg_767}, {tmp_40_fu_356_p1}};

assign s_output_1_fu_602_p3 = {{tmp_47_fu_598_p1}, {S_q0}};

assign sub_key_address0 = tmp_s_fu_332_p1;

assign tmp_10_fu_575_p3 = {{j_1_reg_231}, {6'd0}};

assign tmp_11_cast_fu_583_p1 = tmp_10_fu_575_p3;

assign tmp_11_fu_327_p1 = j_reg_208;

assign tmp_12_cast_fu_593_p1 = $signed(tmp_12_fu_587_p2);

assign tmp_12_fu_587_p2 = ($signed(tmp_35_cast_fu_572_p1) + $signed(tmp_11_cast_fu_583_p1));

assign tmp_13_fu_341_p2 = ($signed(6'd32) - $signed(E_load_reg_762));

assign tmp_14_fu_350_p2 = temp_reg_197 >> tmp_24_cast_fu_346_p1;

assign tmp_15_fu_433_p2 = (p_shl2_cast_fu_419_p1 - p_shl3_cast_fu_429_p1);

assign tmp_16_fu_685_p1 = inv_init_perm_res_i_reg_276[62:0];

assign tmp_17_fu_462_p2 = 48'd145135534866432 >> tmp_28_cast_fu_458_p1;

assign tmp_18_fu_468_p2 = (tmp_17_fu_462_p2 & s_input_1_cast_reg_782);

assign tmp_19_fu_439_p2 = (p_shl3_cast_fu_429_p1 - p_shl2_cast_fu_419_p1);

assign tmp_20_fu_367_p1 = s_input_reg_219[47:0];

assign tmp_21_fu_445_p2 = (7'd42 + tmp_19_fu_439_p2);

assign tmp_22_fu_480_p2 = tmp_18_fu_468_p2 >> tmp_33_cast_fu_476_p1;

assign tmp_23_fu_498_p2 = (tmp_45_fu_490_p3 | tmp_44_fu_486_p1);

assign tmp_24_cast_fu_346_p1 = tmp_13_fu_341_p2;

assign tmp_24_fu_504_p4 = {{tmp_22_fu_480_p2[7:5]}};

assign tmp_25_fu_514_p2 = 47'd131941395333120 >> tmp_28_cast3_fu_454_p1;

assign tmp_26_fu_520_p2 = (tmp_25_fu_514_p2 & s_input_1_cast6_reg_777);

assign tmp_27_cast_fu_451_p1 = $signed(tmp_15_reg_795);

assign tmp_27_fu_371_p1 = sub_key_q0[47:0];

assign tmp_28_cast3_fu_454_p1 = $unsigned(tmp_27_cast_fu_451_p1);

assign tmp_28_cast_fu_458_p1 = $unsigned(tmp_27_cast_fu_451_p1);

assign tmp_28_fu_525_p2 = (7'd43 + tmp_19_reg_800);

assign tmp_29_fu_538_p2 = tmp_26_fu_520_p2 >> tmp_38_cast_fu_534_p1;

assign tmp_30_fu_566_p2 = ($signed(tmp_42_cast_cast_fu_562_p1) + $signed(tmp_41_cast_cast_fu_554_p1));

assign tmp_30_i_fu_689_p2 = ($signed(7'd64) - $signed(PI_load_reg_871));

assign tmp_31_fu_627_p1 = j_2_reg_243;

assign tmp_31_i_fu_694_p1 = tmp_30_i_fu_689_p2;

assign tmp_32_cast_fu_473_p1 = $signed(tmp_21_reg_805);

assign tmp_32_fu_642_p2 = ($signed(6'd32) - $signed(P_load_reg_843));

assign tmp_32_i_fu_698_p2 = pre_output_reg_739 >> tmp_31_i_fu_694_p1;

assign tmp_33_cast_fu_476_p1 = $unsigned(tmp_32_cast_fu_473_p1);

assign tmp_33_fu_651_p2 = s_output_fu_94 >> tmp_50_cast_fu_647_p1;

assign tmp_35_cast_fu_572_p1 = $signed(tmp_30_reg_810);

assign tmp_35_fu_375_p1 = s_input_reg_219[46:0];

assign tmp_36_fu_379_p1 = sub_key_q0[46:0];

assign tmp_37_cast_fu_530_p1 = $signed(tmp_28_fu_525_p2);

assign tmp_38_cast_fu_534_p1 = $unsigned(tmp_37_cast_fu_530_p1);

assign tmp_40_fu_356_p1 = tmp_14_fu_350_p2[0:0];

assign tmp_41_cast_cast_fu_554_p1 = $signed(tmp_9_fu_544_p4);

assign tmp_41_fu_337_p1 = s_input_reg_219[62:0];

assign tmp_42_cast_cast_fu_562_p1 = $signed(tmp_46_fu_558_p1);

assign tmp_42_fu_407_p1 = j_1_reg_231[2:0];

assign tmp_43_fu_423_p2 = j_1_reg_231 << 4'd1;

assign tmp_44_fu_486_p1 = tmp_22_fu_480_p2[0:0];

assign tmp_45_fu_490_p3 = tmp_22_fu_480_p2[32'd4];

assign tmp_46_fu_558_p1 = tmp_29_fu_538_p2[7:0];

assign tmp_47_fu_598_p1 = s_output_fu_94[27:0];

assign tmp_48_fu_657_p1 = tmp_33_fu_651_p2[0:0];

assign tmp_49_fu_632_p1 = f_function_res_reg_254[30:0];

assign tmp_50_cast_fu_647_p1 = tmp_32_fu_642_p2;

assign tmp_9_fu_544_p4 = {{{tmp_24_fu_504_p4}, {tmp_23_fu_498_p2}}, {4'd0}};

assign tmp_fu_703_p1 = tmp_32_i_fu_698_p2[0:0];

assign tmp_i_fu_680_p1 = i_i_reg_265;

assign tmp_s_fu_332_p1 = i_reg_175;

always @ (posedge ap_clk) begin
    tmp_15_reg_795[0] <= 1'b0;
    tmp_19_reg_800[0] <= 1'b0;
    tmp_21_reg_805[0] <= 1'b0;
end

endmodule //calculationofkeys

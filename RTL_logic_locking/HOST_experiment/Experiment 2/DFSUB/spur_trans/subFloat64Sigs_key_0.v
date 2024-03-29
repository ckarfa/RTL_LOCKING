
module subFloat64Sigs
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  a,
  b,
  zSign,
  ap_return,
  working_key
);

  parameter ap_ST_fsm_state1 = 12'd1;
  parameter ap_ST_fsm_state2 = 12'd2;
  parameter ap_ST_fsm_state3 = 12'd4;
  parameter ap_ST_fsm_state4 = 12'd8;
  parameter ap_ST_fsm_state5 = 12'd16;
  parameter ap_ST_fsm_state6 = 12'd32;
  parameter ap_ST_fsm_state7 = 12'd64;
  parameter ap_ST_fsm_state8 = 12'd128;
  parameter ap_ST_fsm_state9 = 12'd256;
  parameter ap_ST_fsm_state10 = 12'd512;
  parameter ap_ST_fsm_state11 = 12'd1024;
  parameter ap_ST_fsm_state12 = 12'd2048;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [63:0] a;
  input [63:0] b;
  input [0:0] zSign;
  output [63:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [63:0] ap_return;
  reg [11:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  reg [31:0] float_exception_flag;
  wire [7:0] countLeadingZerosHig_address0;
  reg countLeadingZerosHig_ce0;
  wire [3:0] countLeadingZerosHig_q0;
  wire [10:0] aExp_fu_352_p4;
  reg [10:0] aExp_reg_1355;
  wire [10:0] bExp_fu_368_p4;
  reg [10:0] bExp_reg_1361;
  wire [11:0] expDiff_fu_382_p2;
  reg [11:0] expDiff_reg_1366;
  wire [51:0] tmp_14_fu_392_p1;
  reg [51:0] tmp_14_reg_1372;
  wire [62:0] aSig_cast1_cast_fu_404_p1;
  reg [62:0] aSig_cast1_cast_reg_1378;
  wire [51:0] tmp_18_fu_408_p1;
  reg [51:0] tmp_18_reg_1385;
  wire [62:0] bSig_cast1_cast_fu_420_p1;
  wire [0:0] tmp_fu_424_p2;
  reg [0:0] tmp_reg_1396;
  wire [0:0] tmp_24_fu_430_p3;
  reg [0:0] tmp_24_reg_1400;
  wire [0:0] grp_fu_288_p2;
  reg [0:0] tmp_s_reg_1404;
  wire [10:0] p_s_fu_438_p3;
  wire [10:0] p_2_fu_446_p3;
  wire [0:0] tmp_13_fu_454_p2;
  reg [0:0] tmp_13_reg_1418;
  wire [0:0] tmp_21_fu_460_p2;
  reg [0:0] tmp_21_reg_1422;
  wire [63:0] b1_2_mux_fu_556_p3;
  wire [0:0] tmp_11_fu_472_p2;
  wire [63:0] a1_5_fu_564_p3;
  wire [0:0] tmp_22_fu_550_p2;
  wire [0:0] tmp_9_fu_572_p2;
  reg [0:0] tmp_9_reg_1442;
  wire [63:0] b1_1_mux_fu_662_p3;
  wire [0:0] tmp_3_fu_578_p2;
  wire [63:0] a1_4_fu_670_p3;
  wire [0:0] tmp_19_fu_656_p2;
  wire [63:0] tmp_74_i_fu_686_p2;
  reg [0:0] tmp_5_reg_1467;
  wire [62:0] bSig_2_fu_714_p3;
  reg [62:0] bSig_2_reg_1471;
  wire [10:0] expDiff_1_fu_722_p3;
  reg [10:0] expDiff_1_reg_1479;
  wire [0:0] icmp9_fu_744_p2;
  reg [0:0] icmp9_reg_1485;
  wire [5:0] tmp_31_i_fu_750_p2;
  reg [5:0] tmp_31_i_reg_1490;
  wire [63:0] b1_mux_fu_840_p3;
  wire [0:0] tmp_7_fu_756_p2;
  wire [63:0] a1_3_fu_848_p3;
  wire [0:0] tmp_15_fu_834_p2;
  wire [62:0] aSig_3_fu_870_p3;
  reg [62:0] aSig_3_reg_1511;
  wire ap_CS_fsm_state2;
  wire [11:0] count_assign_1_fu_892_p2;
  reg [11:0] count_assign_1_reg_1518;
  wire [0:0] tmp_i6_15_fu_898_p2;
  reg [0:0] tmp_i6_15_reg_1523;
  wire [0:0] icmp_fu_914_p2;
  reg [0:0] icmp_reg_1529;
  wire [0:0] tmp_35_i_fu_930_p2;
  reg [0:0] tmp_35_i_reg_1534;
  wire [62:0] z_4_fu_998_p3;
  wire ap_CS_fsm_state3;
  wire [62:0] bSig_4_fu_1004_p4;
  wire [63:0] zSig_1_fu_1021_p2;
  wire ap_CS_fsm_state4;
  wire [0:0] grp_fu_346_p2;
  wire [62:0] z_5_fu_1114_p3;
  wire ap_CS_fsm_state5;
  wire [62:0] aSig_1_fu_1121_p4;
  wire [63:0] zSig_fu_1138_p2;
  wire ap_CS_fsm_state6;
  wire [0:0] icmp1_fu_1154_p2;
  reg [0:0] icmp1_reg_1574;
  wire ap_CS_fsm_state7;
  wire [0:0] icmp2_fu_1192_p2;
  reg [0:0] icmp2_reg_1579;
  reg [7:0] tmp_54_reg_1585;
  reg [7:0] tmp_39_reg_1590;
  reg [7:0] tmp_40_reg_1595;
  wire [0:0] icmp3_fu_1242_p2;
  reg [0:0] icmp3_reg_1600;
  wire ap_CS_fsm_state8;
  wire signed [6:0] shiftCount_1_fu_1304_p2;
  reg signed [6:0] shiftCount_1_reg_1610;
  wire ap_CS_fsm_state9;
  wire [11:0] tmp_i5_21_fu_1326_p2;
  reg [11:0] tmp_i5_21_reg_1616;
  wire ap_CS_fsm_state10;
  wire [63:0] tmp_76_i_fu_1337_p2;
  reg [63:0] tmp_76_i_reg_1621;
  wire [63:0] grp_roundAndPackFloat64_fu_278_ap_return;
  reg [63:0] tmp_77_i_reg_1626;
  wire ap_CS_fsm_state11;
  wire grp_roundAndPackFloat64_fu_278_ap_ready;
  wire grp_roundAndPackFloat64_fu_278_ap_done;
  wire grp_roundAndPackFloat64_fu_278_ap_start;
  wire grp_roundAndPackFloat64_fu_278_ap_idle;
  wire [31:0] grp_roundAndPackFloat64_fu_278_float_exception_flag_o;
  wire grp_roundAndPackFloat64_fu_278_float_exception_flag_o_ap_vld;
  reg [62:0] aSig_s_reg_159;
  reg [62:0] tmp_23_reg_168;
  reg [10:0] zExp_1_reg_177;
  reg [62:0] bSig_s_reg_187;
  reg [62:0] tmp_20_reg_196;
  reg [10:0] zExp_reg_205;
  reg [63:0] zSig_assign_reg_215;
  reg [10:0] zExp2_reg_225;
  reg [0:0] zSign_assign_1_reg_237;
  reg [63:0] ap_phi_mux_p_0_phi_fu_252_p22;
  reg [63:0] p_0_reg_247;
  wire ap_CS_fsm_state12;
  reg grp_roundAndPackFloat64_fu_278_ap_start_reg;
  wire [63:0] tmp_85_i_i_i_fu_1253_p1;
  wire [31:0] grp_fu_334_p2;
  reg [10:0] grp_fu_293_p0;
  wire [11:0] aExp_cast_fu_364_p1;
  wire [11:0] bExp_cast_fu_378_p1;
  wire [61:0] aSig_fu_396_p3;
  wire [61:0] bSig_fu_412_p3;
  wire [0:0] grp_fu_293_p2;
  wire [61:0] tmp_10_fu_466_p2;
  wire [11:0] grp_fu_298_p4;
  wire [62:0] tmp_i5_fu_478_p3;
  wire [50:0] tmp_47_fu_492_p1;
  wire [0:0] tmp_i6_fu_486_p2;
  wire [0:0] tmp_56_i_fu_496_p2;
  wire [63:0] tmp_48_fu_508_p2;
  wire [11:0] grp_fu_308_p4;
  wire [62:0] tmp_i9_fu_520_p3;
  wire [50:0] tmp_49_fu_534_p1;
  wire [0:0] tmp_i10_fu_528_p2;
  wire [0:0] tmp_56_i5_fu_538_p2;
  wire [0:0] tmp_57_i5_fu_544_p2;
  wire [0:0] tmp_57_i_fu_502_p2;
  wire [63:0] grp_fu_324_p2;
  wire [63:0] grp_fu_318_p2;
  wire [0:0] tmp_i4_fu_514_p2;
  wire [62:0] tmp_i8_fu_584_p3;
  wire [50:0] tmp_44_fu_598_p1;
  wire [0:0] tmp_i_fu_592_p2;
  wire [0:0] tmp_56_i3_fu_602_p2;
  wire [63:0] tmp_45_fu_614_p2;
  wire [62:0] tmp_i1_fu_626_p3;
  wire [50:0] tmp_46_fu_640_p1;
  wire [0:0] tmp_i9_14_fu_634_p2;
  wire [0:0] tmp_56_i4_fu_644_p2;
  wire [0:0] tmp_57_i4_fu_650_p2;
  wire [0:0] tmp_57_i3_fu_608_p2;
  wire [0:0] tmp_i3_fu_620_p2;
  wire [63:0] tmp_i2_fu_678_p3;
  wire [10:0] tmp_6_fu_388_p1;
  wire [0:0] tmp_8_fu_692_p2;
  wire [62:0] bSig_1_fu_704_p4;
  wire [10:0] expDiff_2_cast_fu_698_p2;
  wire [4:0] tmp_27_fu_734_p4;
  wire [5:0] tmp_25_fu_730_p1;
  wire [62:0] tmp_i2_16_fu_762_p3;
  wire [50:0] tmp_33_fu_776_p1;
  wire [0:0] tmp_i7_fu_770_p2;
  wire [0:0] tmp_56_i1_fu_780_p2;
  wire [63:0] tmp_35_fu_792_p2;
  wire [62:0] tmp_i7_18_fu_804_p3;
  wire [50:0] tmp_38_fu_818_p1;
  wire [0:0] tmp_i8_19_fu_812_p2;
  wire [0:0] tmp_56_i2_fu_822_p2;
  wire [0:0] tmp_57_i2_fu_828_p2;
  wire [0:0] tmp_57_i1_fu_786_p2;
  wire [0:0] tmp_i1_17_fu_798_p2;
  wire [62:0] aSig_2_fu_861_p4;
  wire [11:0] expDiff_2_fu_856_p2;
  wire [11:0] expDiff_3_fu_881_p3;
  wire [5:0] tmp_42_fu_904_p4;
  wire [5:0] tmp_41_fu_888_p1;
  wire [63:0] aSig_3_cast_fu_877_p1;
  wire [63:0] tmp_33_i_fu_920_p1;
  wire [63:0] tmp_34_i_fu_924_p2;
  wire [62:0] tmp_29_i_cast_fu_936_p1;
  wire [62:0] tmp_30_i_fu_939_p2;
  wire [0:0] tmp_43_fu_944_p1;
  wire [61:0] tmp_16_fu_953_p4;
  wire [0:0] tmp_2_i_fu_948_p2;
  wire [0:0] tmp_36_i_fu_971_p2;
  wire [0:0] sel_tmp_i_fu_980_p2;
  wire [0:0] sel_tmp1_i_fu_985_p2;
  wire [62:0] tmp_17_fu_963_p3;
  wire [62:0] z_5_cast_fu_976_p1;
  wire [62:0] z_2_fu_990_p3;
  wire [63:0] tmp_23_cast_fu_1017_p1;
  wire [63:0] aSig_cast_fu_1013_p1;
  wire [62:0] tmp_29_i43_cast_fu_1035_p1;
  wire [63:0] bSig_2_cast_fu_1027_p1;
  wire [63:0] tmp_33_i1_fu_1043_p1;
  wire [63:0] tmp_34_i1_fu_1046_p2;
  wire [62:0] tmp_30_i1_fu_1038_p2;
  wire [0:0] tmp_30_fu_1058_p1;
  wire [0:0] tmp_35_i1_fu_1052_p2;
  wire [61:0] tmp_2_fu_1068_p4;
  wire [0:0] tmp_2_i1_fu_1062_p2;
  wire [0:0] tmp_36_i1_fu_1086_p2;
  wire [0:0] tmp_i_20_fu_1030_p2;
  wire [0:0] sel_tmp_i1_fu_1095_p2;
  wire [0:0] sel_tmp1_i1_fu_1101_p2;
  wire [62:0] tmp_1_fu_1078_p3;
  wire [62:0] z_1_cast_fu_1091_p1;
  wire [62:0] z_fu_1106_p3;
  wire [63:0] tmp_20_cast_fu_1134_p1;
  wire [63:0] bSig_cast_fu_1130_p1;
  wire [31:0] tmp_50_fu_1144_p4;
  wire [31:0] tmp_51_fu_1160_p1;
  wire [31:0] tmp_36_fu_1164_p4;
  wire [31:0] tmp_37_fu_1174_p3;
  wire [15:0] tmp_52_fu_1182_p4;
  wire [31:0] tmp_53_fu_1198_p2;
  wire [31:0] p_a_i_i_i_fu_1204_p3;
  wire [7:0] p_v_fu_1247_p3;
  wire [4:0] shiftCount_fu_1265_p3;
  wire [4:0] p_i_i_i_fu_1258_p3;
  wire [4:0] shiftCount_1_i_i_i_fu_1272_p3;
  wire [5:0] shiftCount_1_i_i_i_c_fu_1279_p1;
  wire [5:0] countLeadingZerosHig_3_fu_1283_p1;
  wire [5:0] tmp26_fu_1287_p2;
  wire [6:0] tmp63_cast_fu_1293_p1;
  wire [6:0] tmp64_cast_cast_fu_1297_p3;
  wire [11:0] zExp2_cast_fu_1310_p1;
  wire [11:0] zExp_2_fu_1314_p2;
  wire signed [11:0] shiftCount_3_cast_fu_1323_p1;
  wire signed [31:0] shiftCount_3_cast1_fu_1320_p1;
  wire [63:0] tmp_75_i_fu_1333_p1;
  reg [63:0] ap_return_preg;
  reg [11:0] ap_NS_fsm;
  input [6:0] working_key;

  initial begin
    #0 ap_CS_fsm = 12'd1;
    #0 float_exception_flag = 32'd0;
    #0 grp_roundAndPackFloat64_fu_278_ap_start_reg = 1'b0;
    #0 ap_return_preg = 64'd0;
  end


  subFloat64Sigs_cobkb
  #(
    .DataWidth(4),
    .AddressRange(256),
    .AddressWidth(8)
  )
  countLeadingZerosHig_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(countLeadingZerosHig_address0),
    .ce0(countLeadingZerosHig_ce0),
    .q0(countLeadingZerosHig_q0)
  );


  roundAndPackFloat64
  grp_roundAndPackFloat64_fu_278
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_roundAndPackFloat64_fu_278_ap_start),
    .ap_done(grp_roundAndPackFloat64_fu_278_ap_done),
    .ap_idle(grp_roundAndPackFloat64_fu_278_ap_idle),
    .ap_ready(grp_roundAndPackFloat64_fu_278_ap_ready),
    .zSign(zSign_assign_1_reg_237),
    .zExp(tmp_i5_21_reg_1616),
    .zSig(tmp_76_i_reg_1621),
    .float_exception_flag_i(float_exception_flag),
    .float_exception_flag_o(grp_roundAndPackFloat64_fu_278_float_exception_flag_o),
    .float_exception_flag_o_ap_vld(grp_roundAndPackFloat64_fu_278_float_exception_flag_o_ap_vld),
    .ap_return(grp_roundAndPackFloat64_fu_278_ap_return),
    .working_key(working_key)
  );


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_return_preg <= 64'd0;
    end else begin
      if(1'b1 == ap_CS_fsm_state12) begin
        ap_return_preg <= ap_phi_mux_p_0_phi_fu_252_p22;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      grp_roundAndPackFloat64_fu_278_ap_start_reg <= 1'b0;
    end else begin
      if(1'b1 == ap_CS_fsm_state10) begin
        grp_roundAndPackFloat64_fu_278_ap_start_reg <= 1'b1;
      end else if(grp_roundAndPackFloat64_fu_278_ap_ready == 1'b1) begin
        grp_roundAndPackFloat64_fu_278_ap_start_reg <= 1'b0;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if((tmp_21_fu_460_p2 == 1'd1) & (tmp_13_fu_454_p2 == 1'd0) & (grp_fu_288_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      aSig_s_reg_159 <= aSig_cast1_cast_fu_404_p1;
    end else if(1'b1 == ap_CS_fsm_state3) begin
      aSig_s_reg_159 <= z_4_fu_998_p3;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_13_fu_454_p2 == 1'd1) & (grp_fu_288_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      bSig_s_reg_187 <= bSig_cast1_cast_fu_420_p1;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      bSig_s_reg_187 <= z_5_fu_1114_p3;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_15_fu_834_p2 == 1'd1) & (grp_fu_288_p2 == 1'd1) & (tmp_7_fu_756_p2 == 1'd0) & (tmp_fu_424_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) | (tmp_22_fu_550_p2 == 1'd1) & (grp_fu_288_p2 == 1'd1) & (tmp_11_fu_472_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) | (tmp_11_fu_472_p2 == 1'd1) & (grp_fu_288_p2 == 1'd1) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) | (tmp_19_fu_656_p2 == 1'd1) & (tmp_9_fu_572_p2 == 1'd1) & (tmp_3_fu_578_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd1) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      float_exception_flag <= grp_fu_334_p2;
    end else if((grp_roundAndPackFloat64_fu_278_float_exception_flag_o_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state11)) begin
      float_exception_flag <= grp_roundAndPackFloat64_fu_278_float_exception_flag_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_21_fu_460_p2 == 1'd0) & (tmp_13_fu_454_p2 == 1'd0) & (grp_fu_288_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_247 <= 64'd0;
    end else if((tmp_15_fu_834_p2 == 1'd1) & (grp_fu_288_p2 == 1'd1) & (tmp_7_fu_756_p2 == 1'd0) & (tmp_fu_424_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_247 <= b1_mux_fu_840_p3;
    end else if((tmp_7_fu_756_p2 == 1'd1) & (grp_fu_288_p2 == 1'd1) & (tmp_fu_424_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_247 <= a;
    end else if((tmp_19_fu_656_p2 == 1'd1) & (tmp_9_fu_572_p2 == 1'd1) & (tmp_3_fu_578_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd1) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_247 <= b1_1_mux_fu_662_p3;
    end else if((tmp_22_fu_550_p2 == 1'd1) & (grp_fu_288_p2 == 1'd1) & (tmp_11_fu_472_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_247 <= b1_2_mux_fu_556_p3;
    end else if((grp_fu_288_p2 == 1'd1) & (tmp_15_fu_834_p2 == 1'd0) & (tmp_7_fu_756_p2 == 1'd0) & (tmp_fu_424_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_247 <= a1_3_fu_848_p3;
    end else if((tmp_9_fu_572_p2 == 1'd1) & (tmp_19_fu_656_p2 == 1'd0) & (tmp_3_fu_578_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd1) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_247 <= a1_4_fu_670_p3;
    end else if((grp_fu_288_p2 == 1'd1) & (tmp_11_fu_472_p2 == 1'd0) & (tmp_22_fu_550_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_247 <= a1_5_fu_564_p3;
    end else if((tmp_11_fu_472_p2 == 1'd1) & (grp_fu_288_p2 == 1'd1) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_247 <= 64'd9223372036854775807;
    end else if((tmp_3_fu_578_p2 == 1'd1) & (tmp_9_fu_572_p2 == 1'd1) & (tmp_24_fu_430_p3 == 1'd1) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_247 <= tmp_74_i_fu_686_p2;
    end else if((1'b1 == ap_CS_fsm_state12) & ((tmp_9_reg_1442 == 1'd0) & (tmp_24_reg_1400 == 1'd1) & (tmp_reg_1396 == 1'd0) | (tmp_5_reg_1467 == 1'd0) & (tmp_reg_1396 == 1'd1) | (tmp_21_reg_1422 == 1'd1) & (tmp_s_reg_1404 == 1'd0) & (tmp_24_reg_1400 == 1'd0) & (tmp_reg_1396 == 1'd0) | (tmp_13_reg_1418 == 1'd1) & (tmp_s_reg_1404 == 1'd0) & (tmp_24_reg_1400 == 1'd0) & (tmp_reg_1396 == 1'd0))) begin
      p_0_reg_247 <= tmp_77_i_reg_1626;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_13_fu_454_p2 == 1'd1) & (grp_fu_288_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      tmp_20_reg_196[62:10] <= aSig_cast1_cast_fu_404_p1[62:10];
    end else if(1'b1 == ap_CS_fsm_state5) begin
      tmp_20_reg_196[62:10] <= aSig_1_fu_1121_p4[62:10];
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_21_fu_460_p2 == 1'd1) & (tmp_13_fu_454_p2 == 1'd0) & (grp_fu_288_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      tmp_23_reg_168[62:10] <= bSig_cast1_cast_fu_420_p1[62:10];
    end else if(1'b1 == ap_CS_fsm_state3) begin
      tmp_23_reg_168[62:10] <= bSig_4_fu_1004_p4[62:10];
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      zExp2_reg_225 <= zExp_1_reg_177;
    end else if(1'b1 == ap_CS_fsm_state6) begin
      zExp2_reg_225 <= zExp_reg_205;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_21_fu_460_p2 == 1'd1) & (tmp_13_fu_454_p2 == 1'd0) & (grp_fu_288_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      zExp_1_reg_177 <= p_s_fu_438_p3;
    end else if(1'b1 == ap_CS_fsm_state3) begin
      zExp_1_reg_177 <= bExp_reg_1361;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_13_fu_454_p2 == 1'd1) & (grp_fu_288_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      zExp_reg_205 <= p_2_fu_446_p3;
    end else if(1'b1 == ap_CS_fsm_state5) begin
      zExp_reg_205 <= aExp_reg_1355;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      zSig_assign_reg_215 <= zSig_1_fu_1021_p2;
    end else if(1'b1 == ap_CS_fsm_state6) begin
      zSig_assign_reg_215 <= zSig_fu_1138_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      zSign_assign_1_reg_237 <= grp_fu_346_p2;
    end else if(1'b1 == ap_CS_fsm_state6) begin
      zSign_assign_1_reg_237 <= zSign;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      aExp_reg_1355 <= { { a[62:52] } };
      aSig_cast1_cast_reg_1378[61:10] <= aSig_cast1_cast_fu_404_p1[61:10];
      bExp_reg_1361 <= { { b[62:52] } };
      expDiff_reg_1366 <= expDiff_fu_382_p2;
      tmp_14_reg_1372 <= tmp_14_fu_392_p1;
      tmp_18_reg_1385 <= tmp_18_fu_408_p1;
      tmp_reg_1396 <= tmp_fu_424_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      aSig_3_reg_1511[62:10] <= aSig_3_fu_870_p3[62:10];
      count_assign_1_reg_1518 <= count_assign_1_fu_892_p2;
      icmp_reg_1529 <= icmp_fu_914_p2;
      tmp_35_i_reg_1534 <= tmp_35_i_fu_930_p2;
      tmp_i6_15_reg_1523 <= tmp_i6_15_fu_898_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((grp_fu_288_p2 == 1'd0) & (tmp_fu_424_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      bSig_2_reg_1471[62:10] <= bSig_2_fu_714_p3[62:10];
      expDiff_1_reg_1479 <= expDiff_1_fu_722_p3;
      icmp9_reg_1485 <= icmp9_fu_744_p2;
      tmp_31_i_reg_1490 <= tmp_31_i_fu_750_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state7) begin
      icmp1_reg_1574 <= icmp1_fu_1154_p2;
      icmp2_reg_1579 <= icmp2_fu_1192_p2;
      tmp_39_reg_1590 <= { { p_a_i_i_i_fu_1204_p3[23:16] } };
      tmp_40_reg_1595 <= { { p_a_i_i_i_fu_1204_p3[31:24] } };
      tmp_54_reg_1585 <= { { p_a_i_i_i_fu_1204_p3[31:24] } };
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      icmp3_reg_1600 <= icmp3_fu_1242_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      shiftCount_1_reg_1610 <= shiftCount_1_fu_1304_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((grp_fu_288_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      tmp_13_reg_1418 <= tmp_13_fu_454_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_13_fu_454_p2 == 1'd0) & (grp_fu_288_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      tmp_21_reg_1422 <= tmp_21_fu_460_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      tmp_24_reg_1400 <= expDiff_fu_382_p2[32'd11];
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_fu_424_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      tmp_5_reg_1467 <= grp_fu_288_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state10) begin
      tmp_76_i_reg_1621 <= tmp_76_i_fu_1337_p2;
      tmp_i5_21_reg_1616 <= tmp_i5_21_fu_1326_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((grp_roundAndPackFloat64_fu_278_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state11)) begin
      tmp_77_i_reg_1626 <= grp_roundAndPackFloat64_fu_278_ap_return;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_24_fu_430_p3 == 1'd1) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      tmp_9_reg_1442 <= tmp_9_fu_572_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      tmp_s_reg_1404 <= grp_fu_288_p2;
    end 
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state12) | (ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) begin
      ap_done = 1'b1;
    end else begin
      ap_done = 1'b0;
    end
  end


  always @(*) begin
    if((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) begin
      ap_idle = 1'b1;
    end else begin
      ap_idle = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state12) & ((tmp_9_reg_1442 == 1'd0) & (tmp_24_reg_1400 == 1'd1) & (tmp_reg_1396 == 1'd0) | (tmp_5_reg_1467 == 1'd0) & (tmp_reg_1396 == 1'd1) | (tmp_21_reg_1422 == 1'd1) & (tmp_s_reg_1404 == 1'd0) & (tmp_24_reg_1400 == 1'd0) & (tmp_reg_1396 == 1'd0) | (tmp_13_reg_1418 == 1'd1) & (tmp_s_reg_1404 == 1'd0) & (tmp_24_reg_1400 == 1'd0) & (tmp_reg_1396 == 1'd0))) begin
      ap_phi_mux_p_0_phi_fu_252_p22 = tmp_77_i_reg_1626;
    end else begin
      ap_phi_mux_p_0_phi_fu_252_p22 = p_0_reg_247;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state12) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state12) begin
      ap_return = ap_phi_mux_p_0_phi_fu_252_p22;
    end else begin
      ap_return = ap_return_preg;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      countLeadingZerosHig_ce0 = 1'b1;
    end else begin
      countLeadingZerosHig_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      grp_fu_293_p0 = aExp_reg_1355;
    end else if(1'b1 == ap_CS_fsm_state1) begin
      grp_fu_293_p0 = { { a[62:52] } };
    end else begin
      grp_fu_293_p0 = 'bx;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((grp_fu_288_p2 == 1'd0) & (tmp_fu_424_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end else if((tmp_9_fu_572_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd1) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & ((grp_fu_288_p2 == 1'd1) & (tmp_fu_424_p2 == 1'd1) | (tmp_9_fu_572_p2 == 1'd1) & (tmp_24_fu_430_p3 == 1'd1) & (tmp_fu_424_p2 == 1'd0) | (tmp_21_fu_460_p2 == 1'd0) & (tmp_13_fu_454_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) | (grp_fu_288_p2 == 1'd1) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0))) begin
          ap_NS_fsm = ap_ST_fsm_state12;
        end else if((tmp_21_fu_460_p2 == 1'd1) & (tmp_13_fu_454_p2 == 1'd0) & (grp_fu_288_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end else if((tmp_13_fu_454_p2 == 1'd1) & (grp_fu_288_p2 == 1'd0) & (tmp_24_fu_430_p3 == 1'd0) & (tmp_fu_424_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        ap_NS_fsm = ap_ST_fsm_state3;
      end
      ap_ST_fsm_state3: begin
        ap_NS_fsm = ap_ST_fsm_state4;
      end
      ap_ST_fsm_state4: begin
        begin
          if(working_key[2] == 1'b0 & bSig_2_reg_1471[1:0] == 2'b10) begin
            ap_NS_fsm = ap_ST_fsm_state11;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state7;
          end
        end
      end
      ap_ST_fsm_state5: begin
        begin
          if(working_key[3] == 1'b1 & bSig_2_reg_1471[3:2] == 2'b10) begin
            ap_NS_fsm = ap_ST_fsm_state8;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state6;
          end
        end
      end
      ap_ST_fsm_state6: begin
        begin
          if(working_key[4] == 1'b1 & bSig_2_reg_1471[5:4] == 2'b10) begin
            ap_NS_fsm = ap_ST_fsm_state12;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state7;
          end
        end
      end
      ap_ST_fsm_state7: begin
        ap_NS_fsm = ap_ST_fsm_state8;
      end
      ap_ST_fsm_state8: begin
        ap_NS_fsm = ap_ST_fsm_state9;
      end
      ap_ST_fsm_state9: begin
        ap_NS_fsm = ap_ST_fsm_state10;
      end
      ap_ST_fsm_state10: begin
        ap_NS_fsm = ap_ST_fsm_state11;
      end
      ap_ST_fsm_state11: begin
        if((grp_roundAndPackFloat64_fu_278_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state11)) begin
          ap_NS_fsm = ap_ST_fsm_state12;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state11;
        end
      end
      ap_ST_fsm_state12: begin
        ap_NS_fsm = ap_ST_fsm_state1;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign a1_3_fu_848_p3 = (tmp_i1_17_fu_798_p2[0:0] === 1'b1)? grp_fu_324_p2 : grp_fu_318_p2;
  assign a1_4_fu_670_p3 = (tmp_i3_fu_620_p2[0:0] === 1'b1)? grp_fu_324_p2 : grp_fu_318_p2;
  assign a1_5_fu_564_p3 = (tmp_i4_fu_514_p2[0:0] === 1'b1)? grp_fu_324_p2 : grp_fu_318_p2;
  assign aExp_cast_fu_364_p1 = aExp_fu_352_p4;
  assign aExp_fu_352_p4 = { { a[62:52] } };
  assign aSig_1_fu_1121_p4 = { { { { 1'd1 }, { tmp_14_reg_1372 } } }, { 10'd0 } };
  assign aSig_2_fu_861_p4 = { { { { 1'd1 }, { tmp_14_reg_1372 } } }, { 10'd0 } };
  assign aSig_3_cast_fu_877_p1 = aSig_3_fu_870_p3;
  assign aSig_3_fu_870_p3 = (grp_fu_293_p2[0:0] === 1'b1)? aSig_cast1_cast_reg_1378 : aSig_2_fu_861_p4;
  assign aSig_cast1_cast_fu_404_p1 = aSig_fu_396_p3;
  assign aSig_cast_fu_1013_p1 = aSig_s_reg_159;
  assign aSig_fu_396_p3 = { { tmp_14_fu_392_p1 }, { 10'd0 } };
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];
  assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];
  assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
  assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
  assign b1_1_mux_fu_662_p3 = (tmp_57_i4_fu_650_p2[0:0] === 1'b1)? grp_fu_324_p2 : grp_fu_318_p2;
  assign b1_2_mux_fu_556_p3 = (tmp_57_i5_fu_544_p2[0:0] === 1'b1)? grp_fu_324_p2 : grp_fu_318_p2;
  assign b1_mux_fu_840_p3 = (tmp_57_i2_fu_828_p2[0:0] === 1'b1)? grp_fu_324_p2 : grp_fu_318_p2;
  assign bExp_cast_fu_378_p1 = bExp_fu_368_p4;
  assign bExp_fu_368_p4 = { { b[62:52] } };
  assign bSig_1_fu_704_p4 = { { { { 1'd1 }, { tmp_18_fu_408_p1 } } }, { 10'd0 } };
  assign bSig_2_cast_fu_1027_p1 = bSig_2_reg_1471;
  assign bSig_2_fu_714_p3 = (tmp_8_fu_692_p2[0:0] === 1'b1)? bSig_cast1_cast_fu_420_p1 : bSig_1_fu_704_p4;
  assign bSig_4_fu_1004_p4 = { { { { 1'd1 }, { tmp_18_reg_1385 } } }, { 10'd0 } };
  assign bSig_cast1_cast_fu_420_p1 = bSig_fu_412_p3;
  assign bSig_cast_fu_1130_p1 = bSig_s_reg_187;
  assign bSig_fu_412_p3 = { { tmp_18_fu_408_p1 }, { 10'd0 } };
  assign countLeadingZerosHig_3_fu_1283_p1 = countLeadingZerosHig_q0;
  assign countLeadingZerosHig_address0 = tmp_85_i_i_i_fu_1253_p1;
  assign count_assign_1_fu_892_p2 = 12'd0 - expDiff_3_fu_881_p3;
  assign expDiff_1_fu_722_p3 = (tmp_8_fu_692_p2[0:0] === 1'b1)? expDiff_2_cast_fu_698_p2 : tmp_6_fu_388_p1;
  assign expDiff_2_cast_fu_698_p2 = $signed(11'd2047) + $signed(tmp_6_fu_388_p1);
  assign expDiff_2_fu_856_p2 = 12'd1 + expDiff_reg_1366;
  assign expDiff_3_fu_881_p3 = (grp_fu_293_p2[0:0] === 1'b1)? expDiff_2_fu_856_p2 : expDiff_reg_1366;
  assign expDiff_fu_382_p2 = aExp_cast_fu_364_p1 - bExp_cast_fu_378_p1;
  assign grp_fu_288_p2 = (aExp_fu_352_p4 == 11'd2047)? 1'b1 : 1'b0;
  assign grp_fu_293_p2 = (grp_fu_293_p0 == 11'd0)? 1'b1 : 1'b0;
  assign grp_fu_298_p4 = { { a[62:51] } };
  assign grp_fu_308_p4 = { { b[62:51] } };
  assign grp_fu_318_p2 = 64'd2251799813685248 | a;
  assign grp_fu_324_p2 = b | 64'd2251799813685248;
  assign grp_fu_334_p2 = float_exception_flag | 32'd16;
  assign grp_fu_346_p2 = zSign ^ 1'd1;
  assign grp_roundAndPackFloat64_fu_278_ap_start = grp_roundAndPackFloat64_fu_278_ap_start_reg;
  assign icmp1_fu_1154_p2 = (tmp_50_fu_1144_p4 == 32'd0)? 1'b1 : 1'b0;
  assign icmp2_fu_1192_p2 = (tmp_52_fu_1182_p4 == 16'd0)? 1'b1 : 1'b0;
  assign icmp3_fu_1242_p2 = (tmp_54_reg_1585 == 8'd0)? 1'b1 : 1'b0;
  assign icmp9_fu_744_p2 = (tmp_27_fu_734_p4 == 5'd0)? 1'b1 : 1'b0;
  assign icmp_fu_914_p2 = ($signed(tmp_42_fu_904_p4) < $signed(6'd1))? 1'b1 : 1'b0;
  assign p_2_fu_446_p3 = (grp_fu_293_p2[0:0] === 1'b1)? 11'd1 : aExp_fu_352_p4;
  assign p_a_i_i_i_fu_1204_p3 = (icmp2_fu_1192_p2[0:0] === 1'b1)? tmp_53_fu_1198_p2 : tmp_37_fu_1174_p3;
  assign p_i_i_i_fu_1258_p3 = (icmp2_reg_1579[0:0] === 1'b1)? 5'd16 : 5'd0;
  assign p_s_fu_438_p3 = (grp_fu_293_p2[0:0] === 1'b1)? 11'd1 : bExp_fu_368_p4;
  assign p_v_fu_1247_p3 = (icmp3_fu_1242_p2[0:0] === 1'b1)? tmp_39_reg_1590 : tmp_40_reg_1595;
  assign sel_tmp1_i1_fu_1101_p2 = sel_tmp_i1_fu_1095_p2 & icmp9_reg_1485;
  assign sel_tmp1_i_fu_985_p2 = sel_tmp_i_fu_980_p2 & icmp_reg_1529;
  assign sel_tmp_i1_fu_1095_p2 = tmp_i_20_fu_1030_p2 ^ 1'd1;
  assign sel_tmp_i_fu_980_p2 = tmp_i6_15_reg_1523 ^ 1'd1;
  assign shiftCount_1_fu_1304_p2 = tmp63_cast_fu_1293_p1 + tmp64_cast_cast_fu_1297_p3;
  assign shiftCount_1_i_i_i_c_fu_1279_p1 = shiftCount_1_i_i_i_fu_1272_p3;
  assign shiftCount_1_i_i_i_fu_1272_p3 = (icmp3_reg_1600[0:0] === 1'b1)? shiftCount_fu_1265_p3 : p_i_i_i_fu_1258_p3;
  assign shiftCount_3_cast1_fu_1320_p1 = shiftCount_1_reg_1610;
  assign shiftCount_3_cast_fu_1323_p1 = shiftCount_1_reg_1610;
  assign shiftCount_fu_1265_p3 = (icmp2_reg_1579[0:0] === 1'b1)? 5'd24 : 5'd8;
  assign tmp26_fu_1287_p2 = shiftCount_1_i_i_i_c_fu_1279_p1 + countLeadingZerosHig_3_fu_1283_p1;
  assign tmp63_cast_fu_1293_p1 = tmp26_fu_1287_p2;
  assign tmp64_cast_cast_fu_1297_p3 = (icmp1_reg_1574[0:0] === 1'b1)? 7'd31 : 7'd127;
  assign tmp_10_fu_466_p2 = bSig_fu_412_p3 | aSig_fu_396_p3;
  assign tmp_11_fu_472_p2 = (tmp_10_fu_466_p2 == 62'd0)? 1'b1 : 1'b0;
  assign tmp_13_fu_454_p2 = (bSig_fu_412_p3 < aSig_fu_396_p3)? 1'b1 : 1'b0;
  assign tmp_14_fu_392_p1 = a[51:0];
  assign tmp_15_fu_834_p2 = tmp_57_i2_fu_828_p2 | tmp_57_i1_fu_786_p2;
  assign tmp_16_fu_953_p4 = { { tmp_30_i_fu_939_p2[62:1] } };
  assign tmp_17_fu_963_p3 = { { tmp_16_fu_953_p4 }, { tmp_2_i_fu_948_p2 } };
  assign tmp_18_fu_408_p1 = b[51:0];
  assign tmp_19_fu_656_p2 = tmp_57_i4_fu_650_p2 | tmp_57_i3_fu_608_p2;
  assign tmp_1_fu_1078_p3 = { { tmp_2_fu_1068_p4 }, { tmp_2_i1_fu_1062_p2 } };
  assign tmp_20_cast_fu_1134_p1 = tmp_20_reg_196;
  assign tmp_21_fu_460_p2 = (aSig_fu_396_p3 < bSig_fu_412_p3)? 1'b1 : 1'b0;
  assign tmp_22_fu_550_p2 = tmp_57_i_fu_502_p2 | tmp_57_i5_fu_544_p2;
  assign tmp_23_cast_fu_1017_p1 = tmp_23_reg_168;
  assign tmp_24_fu_430_p3 = expDiff_fu_382_p2[32'd11];
  assign tmp_25_fu_730_p1 = expDiff_1_fu_722_p3[5:0];
  assign tmp_27_fu_734_p4 = { { expDiff_1_fu_722_p3[10:6] } };
  assign tmp_29_i43_cast_fu_1035_p1 = expDiff_1_reg_1479;
  assign tmp_29_i_cast_fu_936_p1 = count_assign_1_reg_1518;
  assign tmp_2_fu_1068_p4 = { { tmp_30_i1_fu_1038_p2[62:1] } };
  assign tmp_2_i1_fu_1062_p2 = tmp_35_i1_fu_1052_p2 | tmp_30_fu_1058_p1;
  assign tmp_2_i_fu_948_p2 = tmp_43_fu_944_p1 | tmp_35_i_reg_1534;
  assign tmp_30_fu_1058_p1 = tmp_30_i1_fu_1038_p2[0:0];
  assign tmp_30_i1_fu_1038_p2 = bSig_2_reg_1471 >> tmp_29_i43_cast_fu_1035_p1;
  assign tmp_30_i_fu_939_p2 = aSig_3_reg_1511 >> tmp_29_i_cast_fu_936_p1;
  assign tmp_31_i_fu_750_p2 = 6'd0 - tmp_25_fu_730_p1;
  assign tmp_33_fu_776_p1 = a[50:0];
  assign tmp_33_i1_fu_1043_p1 = tmp_31_i_reg_1490;
  assign tmp_33_i_fu_920_p1 = tmp_41_fu_888_p1;
  assign tmp_34_i1_fu_1046_p2 = bSig_2_cast_fu_1027_p1 << tmp_33_i1_fu_1043_p1;
  assign tmp_34_i_fu_924_p2 = aSig_3_cast_fu_877_p1 << tmp_33_i_fu_920_p1;
  assign tmp_35_fu_792_p2 = b << 64'd1;
  assign tmp_35_i1_fu_1052_p2 = (tmp_34_i1_fu_1046_p2 != 64'd0)? 1'b1 : 1'b0;
  assign tmp_35_i_fu_930_p2 = (tmp_34_i_fu_924_p2 != 64'd0)? 1'b1 : 1'b0;
  assign tmp_36_fu_1164_p4 = { { zSig_assign_reg_215[63:32] } };
  assign tmp_36_i1_fu_1086_p2 = (bSig_2_reg_1471 != 63'd0)? 1'b1 : 1'b0;
  assign tmp_36_i_fu_971_p2 = (aSig_3_reg_1511 != 63'd0)? 1'b1 : 1'b0;
  assign tmp_37_fu_1174_p3 = (icmp1_fu_1154_p2[0:0] === 1'b1)? tmp_51_fu_1160_p1 : tmp_36_fu_1164_p4;
  assign tmp_38_fu_818_p1 = b[50:0];
  assign tmp_3_fu_578_p2 = (bSig_fu_412_p3 == 62'd0)? 1'b1 : 1'b0;
  assign tmp_41_fu_888_p1 = expDiff_3_fu_881_p3[5:0];
  assign tmp_42_fu_904_p4 = { { count_assign_1_fu_892_p2[11:6] } };
  assign tmp_43_fu_944_p1 = tmp_30_i_fu_939_p2[0:0];
  assign tmp_44_fu_598_p1 = a[50:0];
  assign tmp_45_fu_614_p2 = b << 64'd1;
  assign tmp_46_fu_640_p1 = b[50:0];
  assign tmp_47_fu_492_p1 = a[50:0];
  assign tmp_48_fu_508_p2 = b << 64'd1;
  assign tmp_49_fu_534_p1 = b[50:0];
  assign tmp_50_fu_1144_p4 = { { zSig_assign_reg_215[63:32] } };
  assign tmp_51_fu_1160_p1 = zSig_assign_reg_215[31:0];
  assign tmp_52_fu_1182_p4 = { { tmp_37_fu_1174_p3[31:16] } };
  assign tmp_53_fu_1198_p2 = tmp_37_fu_1174_p3 << 32'd16;
  assign tmp_56_i1_fu_780_p2 = (tmp_33_fu_776_p1 != 51'd0)? 1'b1 : 1'b0;
  assign tmp_56_i2_fu_822_p2 = (tmp_38_fu_818_p1 != 51'd0)? 1'b1 : 1'b0;
  assign tmp_56_i3_fu_602_p2 = (tmp_44_fu_598_p1 != 51'd0)? 1'b1 : 1'b0;
  assign tmp_56_i4_fu_644_p2 = (tmp_46_fu_640_p1 != 51'd0)? 1'b1 : 1'b0;
  assign tmp_56_i5_fu_538_p2 = (tmp_49_fu_534_p1 != 51'd0)? 1'b1 : 1'b0;
  assign tmp_56_i_fu_496_p2 = (tmp_47_fu_492_p1 != 51'd0)? 1'b1 : 1'b0;
  assign tmp_57_i1_fu_786_p2 = tmp_i7_fu_770_p2 & tmp_56_i1_fu_780_p2;
  assign tmp_57_i2_fu_828_p2 = tmp_i8_19_fu_812_p2 & tmp_56_i2_fu_822_p2;
  assign tmp_57_i3_fu_608_p2 = tmp_i_fu_592_p2 & tmp_56_i3_fu_602_p2;
  assign tmp_57_i4_fu_650_p2 = tmp_i9_14_fu_634_p2 & tmp_56_i4_fu_644_p2;
  assign tmp_57_i5_fu_544_p2 = tmp_i10_fu_528_p2 & tmp_56_i5_fu_538_p2;
  assign tmp_57_i_fu_502_p2 = tmp_i6_fu_486_p2 & tmp_56_i_fu_496_p2;
  assign tmp_6_fu_388_p1 = expDiff_fu_382_p2[10:0];
  assign tmp_74_i_fu_686_p2 = tmp_i2_fu_678_p3 | 64'd9218868437227405312;
  assign tmp_75_i_fu_1333_p1 = $unsigned(shiftCount_3_cast1_fu_1320_p1);
  assign tmp_76_i_fu_1337_p2 = zSig_assign_reg_215 << tmp_75_i_fu_1333_p1;
  assign tmp_7_fu_756_p2 = (aSig_fu_396_p3 == 62'd0)? 1'b1 : 1'b0;
  assign tmp_85_i_i_i_fu_1253_p1 = p_v_fu_1247_p3;
  assign tmp_8_fu_692_p2 = (bExp_fu_368_p4 == 11'd0)? 1'b1 : 1'b0;
  assign tmp_9_fu_572_p2 = (bExp_fu_368_p4 == 11'd2047)? 1'b1 : 1'b0;
  assign tmp_fu_424_p2 = ($signed(expDiff_fu_382_p2) > $signed(12'd0))? 1'b1 : 1'b0;
  assign tmp_i10_fu_528_p2 = (tmp_i9_fu_520_p3 == 63'd9218868437227405312)? 1'b1 : 1'b0;
  assign tmp_i1_17_fu_798_p2 = (tmp_35_fu_792_p2 > 64'd18437736874454810624)? 1'b1 : 1'b0;
  assign tmp_i1_fu_626_p3 = { { grp_fu_308_p4 }, { 51'd0 } };
  assign tmp_i2_16_fu_762_p3 = { { grp_fu_298_p4 }, { 51'd0 } };
  assign tmp_i2_fu_678_p3 = { { grp_fu_346_p2 }, { 63'd0 } };
  assign tmp_i3_fu_620_p2 = (tmp_45_fu_614_p2 > 64'd18437736874454810624)? 1'b1 : 1'b0;
  assign tmp_i4_fu_514_p2 = (tmp_48_fu_508_p2 > 64'd18437736874454810624)? 1'b1 : 1'b0;
  assign tmp_i5_21_fu_1326_p2 = $signed(zExp_2_fu_1314_p2) - $signed(shiftCount_3_cast_fu_1323_p1);
  assign tmp_i5_fu_478_p3 = { { grp_fu_298_p4 }, { 51'd0 } };
  assign tmp_i6_15_fu_898_p2 = (expDiff_3_fu_881_p3 == 12'd0)? 1'b1 : 1'b0;
  assign tmp_i6_fu_486_p2 = (tmp_i5_fu_478_p3 == 63'd9218868437227405312)? 1'b1 : 1'b0;
  assign tmp_i7_18_fu_804_p3 = { { grp_fu_308_p4 }, { 51'd0 } };
  assign tmp_i7_fu_770_p2 = (tmp_i2_16_fu_762_p3 == 63'd9218868437227405312)? 1'b1 : 1'b0;
  assign tmp_i8_19_fu_812_p2 = (tmp_i7_18_fu_804_p3 == 63'd9218868437227405312)? 1'b1 : 1'b0;
  assign tmp_i8_fu_584_p3 = { { grp_fu_298_p4 }, { 51'd0 } };
  assign tmp_i9_14_fu_634_p2 = (tmp_i1_fu_626_p3 == 63'd9218868437227405312)? 1'b1 : 1'b0;
  assign tmp_i9_fu_520_p3 = { { grp_fu_308_p4 }, { 51'd0 } };
  assign tmp_i_20_fu_1030_p2 = (expDiff_1_reg_1479 == 11'd0)? 1'b1 : 1'b0;
  assign tmp_i_fu_592_p2 = (tmp_i8_fu_584_p3 == 63'd9218868437227405312)? 1'b1 : 1'b0;
  assign zExp2_cast_fu_1310_p1 = zExp2_reg_225;
  assign zExp_2_fu_1314_p2 = $signed(12'd4095) + $signed(zExp2_cast_fu_1310_p1);
  assign zSig_1_fu_1021_p2 = tmp_23_cast_fu_1017_p1 - aSig_cast_fu_1013_p1;
  assign zSig_fu_1138_p2 = tmp_20_cast_fu_1134_p1 - bSig_cast_fu_1130_p1;
  assign z_1_cast_fu_1091_p1 = tmp_36_i1_fu_1086_p2;
  assign z_2_fu_990_p3 = (sel_tmp1_i_fu_985_p2[0:0] === 1'b1)? tmp_17_fu_963_p3 : z_5_cast_fu_976_p1;
  assign z_4_fu_998_p3 = (tmp_i6_15_reg_1523[0:0] === 1'b1)? aSig_3_reg_1511 : z_2_fu_990_p3;
  assign z_5_cast_fu_976_p1 = tmp_36_i_fu_971_p2;
  assign z_5_fu_1114_p3 = (tmp_i_20_fu_1030_p2[0:0] === 1'b1)? bSig_2_reg_1471 : z_fu_1106_p3;
  assign z_fu_1106_p3 = (sel_tmp1_i1_fu_1101_p2[0:0] === 1'b1)? tmp_1_fu_1078_p3 : z_1_cast_fu_1091_p1;

  always @(posedge ap_clk) begin
    aSig_cast1_cast_reg_1378[9:0] <= 10'b0000000000;
    aSig_cast1_cast_reg_1378[62] <= 1'b0;
    bSig_2_reg_1471[9:0] <= 10'b0000000000;
    aSig_3_reg_1511[9:0] <= 10'b0000000000;
    tmp_23_reg_168[9:0] <= 10'b0000000000;
    tmp_20_reg_196[9:0] <= 10'b0000000000;
  end


endmodule


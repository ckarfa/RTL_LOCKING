
module float64_mul
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  a,
  b,
  ap_return,
  working_key
);

  parameter ap_ST_fsm_state1 = 13'd1;
  parameter ap_ST_fsm_state2 = 13'd2;
  parameter ap_ST_fsm_state3 = 13'd4;
  parameter ap_ST_fsm_state4 = 13'd8;
  parameter ap_ST_fsm_state5 = 13'd16;
  parameter ap_ST_fsm_state6 = 13'd32;
  parameter ap_ST_fsm_state7 = 13'd64;
  parameter ap_ST_fsm_state8 = 13'd128;
  parameter ap_ST_fsm_state9 = 13'd256;
  parameter ap_ST_fsm_state10 = 13'd512;
  parameter ap_ST_fsm_state11 = 13'd1024;
  parameter ap_ST_fsm_state12 = 13'd2048;
  parameter ap_ST_fsm_state13 = 13'd4096;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [63:0] a;
  input [63:0] b;
  output [63:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [63:0] ap_return;
  reg [12:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  reg [31:0] float_exception_flag;
  reg [7:0] countLeadingZerosHig_address0;
  reg countLeadingZerosHig_ce0;
  wire [3:0] countLeadingZerosHig_q0;
  wire [63:0] aSig_1_cast_fu_304_p1;
  reg [63:0] aSig_1_cast_reg_1366;
  wire [11:0] aExp_cast_fu_318_p1;
  wire [51:0] bSig_fu_330_p1;
  reg [51:0] bSig_reg_1377;
  wire [63:0] bSig_1_cast_fu_335_p1;
  reg [63:0] bSig_1_cast_reg_1382;
  wire [10:0] bExp_fu_339_p4;
  reg [10:0] bExp_reg_1388;
  wire [11:0] bExp_cast_fu_349_p1;
  reg [11:0] bExp_cast_reg_1393;
  wire [0:0] zSign_fu_361_p2;
  reg [0:0] zSign_reg_1398;
  wire [0:0] tmp_fu_367_p2;
  reg [0:0] tmp_reg_1404;
  wire [0:0] tmp_15_fu_373_p2;
  reg [0:0] tmp_15_reg_1408;
  wire [0:0] tmp_19_fu_379_p2;
  reg [0:0] tmp_19_reg_1412;
  wire [0:0] grp_fu_241_p2;
  reg [0:0] tmp_25_reg_1416;
  wire [0:0] icmp_fu_395_p2;
  reg [0:0] icmp_reg_1420;
  wire [0:0] icmp6_fu_437_p2;
  reg [0:0] icmp6_reg_1425;
  reg [7:0] tmp_59_reg_1431;
  reg [7:0] tmp_46_reg_1436;
  reg [7:0] tmp_47_reg_1441;
  wire [63:0] tmp_i6_fu_487_p3;
  wire [63:0] tmp_i1_fu_589_p3;
  wire [0:0] grp_fu_246_p2;
  wire [63:0] tmp_34_i1_fu_639_p2;
  wire [0:0] tmp_24_fu_625_p2;
  wire [63:0] tmp_i_fu_751_p3;
  wire [0:0] or_cond_fu_651_p2;
  wire [63:0] tmp_34_i_fu_801_p2;
  wire [0:0] tmp_20_fu_787_p2;
  wire [0:0] icmp9_fu_807_p2;
  reg [0:0] icmp9_reg_1492;
  wire ap_CS_fsm_state2;
  wire [6:0] shiftCount_1_fu_859_p2;
  reg [6:0] shiftCount_1_reg_1502;
  wire ap_CS_fsm_state3;
  wire signed [12:0] aExp2_cast_fu_894_p1;
  reg signed [12:0] aExp2_cast_reg_1508;
  wire ap_CS_fsm_state4;
  wire [0:0] tmp_28_fu_898_p2;
  reg [0:0] tmp_28_reg_1513;
  reg [0:0] tmp_29_reg_1517;
  wire [0:0] icmp1_fu_912_p2;
  reg [0:0] icmp1_reg_1521;
  wire [0:0] icmp2_fu_952_p2;
  reg [0:0] icmp2_reg_1526;
  reg [7:0] tmp_64_reg_1532;
  reg [7:0] tmp_50_reg_1537;
  reg [7:0] tmp_51_reg_1542;
  wire [63:0] tmp_i8_fu_1002_p3;
  wire [0:0] icmp3_fu_1009_p2;
  reg [0:0] icmp3_reg_1552;
  wire ap_CS_fsm_state5;
  wire [6:0] shiftCount_4_fu_1061_p2;
  reg [6:0] shiftCount_4_reg_1562;
  wire ap_CS_fsm_state6;
  wire [63:0] zSigPtr_temp_1_fu_1080_p2;
  wire ap_CS_fsm_state7;
  wire signed [11:0] zExpPtr_temp_1_cast_fu_1090_p1;
  wire [21:0] tmp_65_fu_1094_p1;
  reg [21:0] tmp_65_reg_1578;
  reg [31:0] tmp_4_reg_1583;
  wire [63:0] z1_fu_1156_p2;
  reg [63:0] z1_reg_1588;
  wire ap_CS_fsm_state8;
  wire [63:0] zMiddleA_fu_1166_p2;
  reg [63:0] zMiddleA_reg_1593;
  wire [63:0] zMiddleB_fu_1176_p2;
  reg [63:0] zMiddleB_reg_1598;
  wire [63:0] z0_fu_1182_p2;
  reg [63:0] z0_reg_1604;
  wire [0:0] tmp_39_i_fu_1192_p2;
  reg [0:0] tmp_39_i_reg_1609;
  wire ap_CS_fsm_state9;
  reg [31:0] tmp_54_reg_1614;
  wire [63:0] zMiddleA_2_fu_1207_p2;
  reg [63:0] zMiddleA_2_reg_1619;
  wire [63:0] z1_2_fu_1213_p2;
  reg [63:0] z1_2_reg_1624;
  wire [0:0] tmp_70_fu_1300_p3;
  reg [0:0] tmp_70_reg_1630;
  wire ap_CS_fsm_state10;
  wire [63:0] zSig0_3_fu_1328_p3;
  reg [63:0] zSig0_3_reg_1635;
  wire [12:0] zExp_fu_1353_p2;
  reg [12:0] zExp_reg_1640;
  wire ap_CS_fsm_state11;
  wire [63:0] grp_roundAndPackFloat64_fu_232_ap_return;
  reg [63:0] tmp_37_reg_1645;
  wire ap_CS_fsm_state12;
  wire grp_roundAndPackFloat64_fu_232_ap_ready;
  wire grp_roundAndPackFloat64_fu_232_ap_done;
  wire grp_roundAndPackFloat64_fu_232_ap_start;
  wire grp_roundAndPackFloat64_fu_232_ap_idle;
  wire [31:0] grp_roundAndPackFloat64_fu_232_float_exception_flag_o;
  wire grp_roundAndPackFloat64_fu_232_float_exception_flag_o_ap_vld;
  wire [63:0] zSigPtr_temp_fu_878_p2;
  reg [63:0] aSig2_reg_169;
  wire signed [11:0] zExpPtr_temp_cast_fu_889_p1;
  reg [11:0] ap_phi_mux_aExp2_phi_fu_182_p4;
  reg [11:0] aExp2_reg_179;
  reg [63:0] bSig2_reg_188;
  reg [11:0] bExp2_reg_197;
  reg [63:0] ap_phi_mux_p_0_phi_fu_210_p18;
  reg [63:0] p_0_reg_206;
  wire ap_CS_fsm_state13;
  reg grp_roundAndPackFloat64_fu_232_ap_start_reg;
  wire [63:0] tmp_80_i_i_i_fu_818_p1;
  wire [63:0] tmp_80_i_i_i1_fu_1020_p1;
  wire [31:0] grp_fu_287_p2;
  wire [0:0] tmp_i2_fu_567_p2;
  wire [0:0] tmp_i9_fu_729_p2;
  wire [51:0] aSig_fu_299_p1;
  reg [51:0] grp_fu_246_p0;
  wire [10:0] aExp_fu_308_p4;
  wire [0:0] tmp_34_fu_353_p3;
  wire [0:0] tmp_30_fu_322_p3;
  wire [19:0] tmp_53_fu_385_p4;
  wire [19:0] tmp_44_fu_405_p4;
  wire [31:0] tmp_55_fu_401_p1;
  wire [31:0] tmp_27_fu_415_p1;
  wire [31:0] a_assign_s_fu_419_p3;
  wire [15:0] tmp_57_fu_427_p4;
  wire [31:0] tmp_58_fu_443_p2;
  wire [31:0] p_a_i_i_i_fu_449_p3;
  wire [11:0] grp_fu_251_p4;
  wire [62:0] tmp_i_i2_fu_495_p3;
  wire [50:0] tmp_45_fu_509_p1;
  wire [0:0] tmp_i_i1_fu_503_p2;
  wire [0:0] tmp_74_i_i1_fu_513_p2;
  wire [63:0] tmp_49_fu_525_p2;
  wire [11:0] grp_fu_261_p4;
  wire [62:0] tmp_i3_i1_fu_537_p3;
  wire [50:0] tmp_52_fu_551_p1;
  wire [0:0] tmp_i4_i1_fu_545_p2;
  wire [0:0] tmp_74_i6_i1_fu_555_p2;
  wire [0:0] tmp_75_i7_i1_fu_561_p2;
  wire [0:0] tmp_75_i_i1_fu_519_p2;
  wire [63:0] grp_fu_277_p2;
  wire [63:0] grp_fu_271_p2;
  wire [0:0] tmp_i2_i1_fu_531_p2;
  wire [63:0] b_assign_mux_i1_fu_573_p3;
  wire [63:0] a_assign_6_fu_581_p3;
  wire [10:0] tmp_42_fu_597_p1;
  wire [40:0] tmp_22_fu_607_p4;
  wire [10:0] tmp_21_fu_601_p2;
  wire [51:0] tmp_23_fu_617_p3;
  wire [63:0] tmp_i5_fu_631_p3;
  wire [0:0] tmp_16_fu_645_p2;
  wire [62:0] tmp_i_i3_fu_657_p3;
  wire [50:0] tmp_36_fu_671_p1;
  wire [0:0] tmp_i_i_fu_665_p2;
  wire [0:0] tmp_74_i_i_fu_675_p2;
  wire [63:0] tmp_38_fu_687_p2;
  wire [62:0] tmp_i3_i_fu_699_p3;
  wire [50:0] tmp_39_fu_713_p1;
  wire [0:0] tmp_i4_i_fu_707_p2;
  wire [0:0] tmp_74_i6_i_fu_717_p2;
  wire [0:0] tmp_75_i7_i_fu_723_p2;
  wire [0:0] tmp_75_i_i_fu_681_p2;
  wire [0:0] tmp_i2_i_fu_693_p2;
  wire [63:0] b_assign_mux_i_fu_735_p3;
  wire [63:0] a_assign_1_fu_743_p3;
  wire [10:0] tmp_40_fu_759_p1;
  wire [40:0] tmp_9_fu_769_p4;
  wire [10:0] tmp_8_fu_763_p2;
  wire [51:0] tmp_10_fu_779_p3;
  wire [63:0] tmp_i4_fu_793_p3;
  wire [7:0] p_v1_fu_812_p3;
  wire [4:0] shiftCount_fu_830_p3;
  wire [4:0] p_i_i_i_fu_823_p3;
  wire [4:0] shiftCount_1_i_i_i_fu_837_p3;
  wire [5:0] tmp29_fu_848_p3;
  wire [6:0] countLeadingZerosHig_3_fu_844_p1;
  wire [6:0] tmp32_cast_fu_855_p1;
  wire [6:0] shiftCount_2_fu_865_p2;
  wire signed [31:0] shiftCount_3_cast_fu_870_p1;
  wire [63:0] tmp_i7_fu_874_p1;
  wire [6:0] zExpPtr_temp_fu_884_p2;
  wire [19:0] tmp_60_fu_903_p4;
  wire [19:0] tmp_48_fu_921_p4;
  wire [31:0] tmp_61_fu_918_p1;
  wire [31:0] tmp_31_fu_930_p1;
  wire [31:0] a_assign_2_fu_934_p3;
  wire [15:0] tmp_62_fu_942_p4;
  wire [31:0] tmp_63_fu_958_p2;
  wire [31:0] p_a_i_i_i1_fu_964_p3;
  wire [7:0] p_v_fu_1014_p3;
  wire [4:0] shiftCount_3_fu_1032_p3;
  wire [4:0] p_i_i_i1_fu_1025_p3;
  wire [4:0] shiftCount_1_i_i_i1_fu_1039_p3;
  wire [5:0] tmp33_fu_1050_p3;
  wire [6:0] countLeadingZerosHig_6_fu_1046_p1;
  wire [6:0] tmp33_cast_fu_1057_p1;
  wire [6:0] shiftCount_5_fu_1067_p2;
  wire signed [31:0] shiftCount_7_cast_fu_1072_p1;
  wire [63:0] tmp_i9_12_fu_1076_p1;
  wire [6:0] zExpPtr_temp_1_fu_1085_p2;
  wire [20:0] tmp_66_fu_1120_p1;
  wire [31:0] tmp_6_fu_1132_p4;
  wire [31:0] aLow_fu_1108_p3;
  wire [31:0] bLow_fu_1124_p3;
  wire [31:0] z1_fu_1156_p0;
  wire [63:0] tmp_35_i_fu_1148_p1;
  wire [31:0] z1_fu_1156_p1;
  wire [63:0] tmp_36_i_fu_1152_p1;
  wire [31:0] bHigh_fu_1142_p2;
  wire [31:0] zMiddleA_fu_1166_p0;
  wire [31:0] zMiddleA_fu_1166_p1;
  wire [63:0] tmp_37_i_fu_1162_p1;
  wire [31:0] aHigh_fu_1115_p2;
  wire [31:0] zMiddleB_fu_1176_p0;
  wire [31:0] zMiddleB_fu_1176_p1;
  wire [63:0] tmp_38_i_fu_1172_p1;
  wire [31:0] z0_fu_1182_p0;
  wire [31:0] z0_fu_1182_p1;
  wire [63:0] zMiddleA_1_fu_1188_p2;
  wire [32:0] tmp_43_i_fu_1218_p3;
  wire [0:0] tmp_44_i_fu_1228_p2;
  wire [63:0] tmp_43_i_cast_fu_1224_p1;
  wire [63:0] z0_1_i_fu_1236_p2;
  wire [63:0] tmp_45_i_fu_1232_p1;
  wire [62:0] tmp_69_fu_1249_p1;
  wire [62:0] tmp_35_fu_1245_p1;
  wire [0:0] tmp_68_fu_1241_p1;
  wire [0:0] tmp_12_fu_1270_p2;
  wire [0:0] tmp_32_fu_1265_p2;
  wire [63:0] z0_2_fu_1253_p2;
  wire [62:0] tmp_14_fu_1282_p4;
  wire [0:0] tmp_13_fu_1276_p2;
  wire [62:0] z0_2_cast_fu_1259_p2;
  wire [61:0] tmp_56_fu_1308_p4;
  wire [63:0] zSig0_1_fu_1292_p3;
  wire [63:0] zSig0_2_fu_1318_p4;
  wire [11:0] zExp2_v_cast_cast_fu_1336_p3;
  wire [11:0] tmp34_fu_1343_p2;
  wire signed [12:0] tmp34_cast_fu_1349_p1;
  reg [63:0] ap_return_preg;
  reg [12:0] ap_NS_fsm;
  input [12:0] working_key;

  initial begin
    #0 ap_CS_fsm = 13'd1;
    #0 float_exception_flag = 32'd0;
    #0 grp_roundAndPackFloat64_fu_232_ap_start_reg = 1'b0;
    #0 ap_return_preg = 64'd0;
  end


  float64_mul_countbkb
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
  grp_roundAndPackFloat64_fu_232
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_roundAndPackFloat64_fu_232_ap_start),
    .ap_done(grp_roundAndPackFloat64_fu_232_ap_done),
    .ap_idle(grp_roundAndPackFloat64_fu_232_ap_idle),
    .ap_ready(grp_roundAndPackFloat64_fu_232_ap_ready),
    .zSign(zSign_reg_1398),
    .zExp(zExp_reg_1640),
    .zSig(zSig0_3_reg_1635),
    .float_exception_flag_i(float_exception_flag),
    .float_exception_flag_o(grp_roundAndPackFloat64_fu_232_float_exception_flag_o),
    .float_exception_flag_o_ap_vld(grp_roundAndPackFloat64_fu_232_float_exception_flag_o_ap_vld),
    .ap_return(grp_roundAndPackFloat64_fu_232_ap_return),
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
      if(1'b1 == ap_CS_fsm_state13) begin
        ap_return_preg <= ap_phi_mux_p_0_phi_fu_210_p18;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      grp_roundAndPackFloat64_fu_232_ap_start_reg <= 1'b0;
    end else begin
      if(1'b1 == ap_CS_fsm_state11) begin
        grp_roundAndPackFloat64_fu_232_ap_start_reg <= 1'b1;
      end else if(grp_roundAndPackFloat64_fu_232_ap_ready == 1'b1) begin
        grp_roundAndPackFloat64_fu_232_ap_start_reg <= 1'b0;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if((tmp_19_fu_379_p2 == 1'd0) & (tmp_15_fu_373_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      if(working_key[5] == 1'b1) begin
        aExp2_reg_179 <= aExp_cast_fu_318_p1;
      end else begin
        aExp2_reg_179 <= bExp_cast_reg_1393;
      end
    end else if((tmp_19_reg_1412 == 1'd1) & (1'b1 == ap_CS_fsm_state4)) begin
      aExp2_reg_179 <= zExpPtr_temp_cast_fu_889_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_19_fu_379_p2 == 1'd0) & (tmp_15_fu_373_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      if(working_key[6] == 1'b1) begin
        aSig2_reg_169 <= zExpPtr_temp_1_cast_fu_1090_p1;
      end else begin
        aSig2_reg_169 <= aSig_1_cast_fu_304_p1;
      end
    end else if((tmp_19_reg_1412 == 1'd1) & (1'b1 == ap_CS_fsm_state4)) begin
      aSig2_reg_169 <= zSigPtr_temp_fu_878_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_28_fu_898_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4)) begin
      if(working_key[7] == 1'b1) begin
        bExp2_reg_197 <= bExp_cast_reg_1393;
      end else begin
        bExp2_reg_197 <= grp_fu_246_p2;
      end
    end else if((tmp_28_reg_1513 == 1'd1) & (1'b1 == ap_CS_fsm_state7)) begin
      bExp2_reg_197 <= zExpPtr_temp_1_cast_fu_1090_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_28_fu_898_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4)) begin
      if(working_key[8] == 1'b1) begin
        bSig2_reg_188 <= bSig_1_cast_reg_1382;
      end else begin
        bSig2_reg_188 <= zSig0_3_fu_1328_p3;
      end
    end else if((tmp_28_reg_1513 == 1'd1) & (1'b1 == ap_CS_fsm_state7)) begin
      bSig2_reg_188 <= zSigPtr_temp_1_fu_1080_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_20_fu_787_p2 == 1'd1) & (or_cond_fu_651_p2 == 1'd1) & (grp_fu_241_p2 == 1'd1) & (tmp_fu_367_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) | (tmp_24_fu_625_p2 == 1'd1) & (grp_fu_246_p2 == 1'd1) & (tmp_15_fu_373_p2 == 1'd1) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) | (tmp_i2_fu_567_p2 == 1'd1) & (grp_fu_246_p2 == 1'd0) & (tmp_15_fu_373_p2 == 1'd1) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) | (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & ((tmp_i9_fu_729_p2 == 1'd1) & (grp_fu_241_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd1) | (tmp_i9_fu_729_p2 == 1'd1) & (or_cond_fu_651_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd1))) begin
      if(working_key[9] == 1'b1) begin
        float_exception_flag <= tmp_34_i_fu_801_p2;
      end else begin
        float_exception_flag <= grp_fu_287_p2;
      end
    end else if((grp_roundAndPackFloat64_fu_232_float_exception_flag_o_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state12)) begin
      float_exception_flag <= grp_roundAndPackFloat64_fu_232_float_exception_flag_o;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state13) & ((tmp_25_reg_1416 == 1'd0) & (tmp_28_reg_1513 == 1'd0) & (tmp_15_reg_1408 == 1'd0) & (tmp_reg_1404 == 1'd0) | (tmp_25_reg_1416 == 1'd0) & (tmp_29_reg_1517 == 1'd0) & (tmp_15_reg_1408 == 1'd0) & (tmp_reg_1404 == 1'd0) | (tmp_19_reg_1412 == 1'd0) & (tmp_29_reg_1517 == 1'd0) & (tmp_15_reg_1408 == 1'd0) & (tmp_reg_1404 == 1'd0) | (tmp_19_reg_1412 == 1'd0) & (tmp_28_reg_1513 == 1'd0) & (tmp_15_reg_1408 == 1'd0) & (tmp_reg_1404 == 1'd0))) begin
      if(working_key[10] == 1'b1) begin
        p_0_reg_206 <= tmp_37_reg_1645;
      end else begin
        p_0_reg_206 <= icmp_fu_395_p2;
      end
    end else if((tmp_28_fu_898_p2 == 1'd1) & (grp_fu_246_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4)) begin
      p_0_reg_206 <= tmp_i8_fu_1002_p3;
    end else if((grp_fu_241_p2 == 1'd1) & (tmp_19_fu_379_p2 == 1'd1) & (tmp_15_fu_373_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_206 <= tmp_i6_fu_487_p3;
    end else if((grp_fu_246_p2 == 1'd1) & (tmp_24_fu_625_p2 == 1'd0) & (tmp_15_fu_373_p2 == 1'd1) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_206 <= tmp_34_i1_fu_639_p2;
    end else if((grp_fu_246_p2 == 1'd0) & (tmp_15_fu_373_p2 == 1'd1) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_206 <= tmp_i1_fu_589_p3;
    end else if((or_cond_fu_651_p2 == 1'd1) & (grp_fu_241_p2 == 1'd1) & (tmp_20_fu_787_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_206 <= tmp_34_i_fu_801_p2;
    end else if((tmp_20_fu_787_p2 == 1'd1) & (or_cond_fu_651_p2 == 1'd1) & (grp_fu_241_p2 == 1'd1) & (tmp_fu_367_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) | (tmp_24_fu_625_p2 == 1'd1) & (grp_fu_246_p2 == 1'd1) & (tmp_15_fu_373_p2 == 1'd1) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      p_0_reg_206 <= 64'd9223372036854775807;
    end else if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & ((grp_fu_241_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd1) | (or_cond_fu_651_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd1))) begin
      p_0_reg_206 <= tmp_i_fu_751_p3;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      if(working_key[11] == 1'b1) begin
        aExp2_cast_reg_1508 <= tmp_37_reg_1645;
        tmp_28_reg_1513 <= grp_fu_246_p2;
      end else begin
        aExp2_cast_reg_1508 <= aExp2_cast_fu_894_p1;
        tmp_28_reg_1513 <= tmp_28_fu_898_p2;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      if(working_key[12] == 1'b1) begin
        aSig_1_cast_reg_1366[51:0] <= aSig_1_cast_fu_304_p1[51:0];
        bExp_cast_reg_1393[10:0] <= bExp_cast_fu_349_p1[10:0];
        bExp_reg_1388 <= { { b[62:52] } };
        bSig_1_cast_reg_1382[51:0] <= bSig_1_cast_fu_335_p1[51:0];
        bSig_reg_1377 <= bSig_fu_330_p1;
        tmp_reg_1404 <= tmp_fu_367_p2;
        zSign_reg_1398 <= zSign_fu_361_p2;
      end else begin
        aSig_1_cast_reg_1366[51:0] <= bSig_1_cast_reg_1382;
        bExp_cast_reg_1393[10:0] <= grp_fu_246_p2;
        bExp_reg_1388 <= shiftCount_1_fu_859_p2;
        bSig_1_cast_reg_1382[51:0] <= zExpPtr_temp_cast_fu_889_p1;
        bSig_reg_1377 <= aExp2_cast_fu_894_p1;
        tmp_reg_1404 <= icmp6_fu_437_p2;
        zSign_reg_1398 <= tmp_80_i_i_i_fu_818_p1;
      end
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_28_fu_898_p2 == 1'd1) & (grp_fu_246_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4)) begin
      icmp1_reg_1521 <= icmp1_fu_912_p2;
      icmp2_reg_1526 <= icmp2_fu_952_p2;
      tmp_50_reg_1537 <= { { p_a_i_i_i1_fu_964_p3[23:16] } };
      tmp_51_reg_1542 <= { { p_a_i_i_i1_fu_964_p3[31:24] } };
      tmp_64_reg_1532 <= { { p_a_i_i_i1_fu_964_p3[31:24] } };
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      icmp3_reg_1552 <= icmp3_fu_1009_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_19_fu_379_p2 == 1'd1) & (grp_fu_241_p2 == 1'd0) & (tmp_15_fu_373_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      icmp6_reg_1425 <= icmp6_fu_437_p2;
      icmp_reg_1420 <= icmp_fu_395_p2;
      tmp_46_reg_1436 <= { { p_a_i_i_i_fu_449_p3[23:16] } };
      tmp_47_reg_1441 <= { { p_a_i_i_i_fu_449_p3[31:24] } };
      tmp_59_reg_1431 <= { { p_a_i_i_i_fu_449_p3[31:24] } };
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      icmp9_reg_1492 <= icmp9_fu_807_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      shiftCount_1_reg_1502 <= shiftCount_1_fu_859_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state6) begin
      shiftCount_4_reg_1562 <= shiftCount_4_fu_1061_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      tmp_15_reg_1408 <= tmp_15_fu_373_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_15_fu_373_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      tmp_19_reg_1412 <= tmp_19_fu_379_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_19_fu_379_p2 == 1'd1) & (tmp_15_fu_373_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      tmp_25_reg_1416 <= grp_fu_241_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((tmp_28_fu_898_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4)) begin
      tmp_29_reg_1517 <= grp_fu_246_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((grp_roundAndPackFloat64_fu_232_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state12)) begin
      tmp_37_reg_1645 <= grp_roundAndPackFloat64_fu_232_ap_return;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state9) begin
      tmp_39_i_reg_1609 <= tmp_39_i_fu_1192_p2;
      tmp_54_reg_1614 <= { { zMiddleA_1_fu_1188_p2[63:32] } };
      z1_2_reg_1624[63:11] <= z1_2_fu_1213_p2[63:11];
      zMiddleA_2_reg_1619[63:32] <= zMiddleA_2_fu_1207_p2[63:32];
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state7) begin
      tmp_4_reg_1583 <= { { aSig2_reg_169[53:22] } };
      tmp_65_reg_1578 <= tmp_65_fu_1094_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state10) begin
      tmp_70_reg_1630 <= z0_2_cast_fu_1259_p2[32'd62];
      zSig0_3_reg_1635 <= zSig0_3_fu_1328_p3;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state8) begin
      z0_reg_1604 <= z0_fu_1182_p2;
      z1_reg_1588[63:11] <= z1_fu_1156_p2[63:11];
      zMiddleA_reg_1593 <= zMiddleA_fu_1166_p2;
      zMiddleB_reg_1598 <= zMiddleB_fu_1176_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state11) begin
      zExp_reg_1640 <= zExp_fu_1353_p2;
    end 
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state13) | (ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) begin
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
    if((tmp_19_reg_1412 == 1'd1) & (1'b1 == ap_CS_fsm_state4)) begin
      ap_phi_mux_aExp2_phi_fu_182_p4 = zExpPtr_temp_cast_fu_889_p1;
    end else begin
      ap_phi_mux_aExp2_phi_fu_182_p4 = aExp2_reg_179;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state13) & ((tmp_25_reg_1416 == 1'd0) & (tmp_28_reg_1513 == 1'd0) & (tmp_15_reg_1408 == 1'd0) & (tmp_reg_1404 == 1'd0) | (tmp_25_reg_1416 == 1'd0) & (tmp_29_reg_1517 == 1'd0) & (tmp_15_reg_1408 == 1'd0) & (tmp_reg_1404 == 1'd0) | (tmp_19_reg_1412 == 1'd0) & (tmp_29_reg_1517 == 1'd0) & (tmp_15_reg_1408 == 1'd0) & (tmp_reg_1404 == 1'd0) | (tmp_19_reg_1412 == 1'd0) & (tmp_28_reg_1513 == 1'd0) & (tmp_15_reg_1408 == 1'd0) & (tmp_reg_1404 == 1'd0))) begin
      ap_phi_mux_p_0_phi_fu_210_p18 = tmp_37_reg_1645;
    end else begin
      ap_phi_mux_p_0_phi_fu_210_p18 = p_0_reg_206;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state13) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state13) begin
      ap_return = ap_phi_mux_p_0_phi_fu_210_p18;
    end else begin
      ap_return = ap_return_preg;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      countLeadingZerosHig_address0 = tmp_80_i_i_i1_fu_1020_p1;
    end else if(1'b1 == ap_CS_fsm_state2) begin
      countLeadingZerosHig_address0 = tmp_80_i_i_i_fu_818_p1;
    end else begin
      countLeadingZerosHig_address0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state2)) begin
      countLeadingZerosHig_ce0 = 1'b1;
    end else begin
      countLeadingZerosHig_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      grp_fu_246_p0 = bSig_reg_1377;
    end else if((grp_fu_241_p2 == 1'd1) & (tmp_fu_367_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) | (tmp_15_fu_373_p2 == 1'd1) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)) begin
      grp_fu_246_p0 = bSig_fu_330_p1;
    end else begin
      grp_fu_246_p0 = 'bx;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & ((tmp_fu_367_p2 == 1'd1) | ((tmp_15_fu_373_p2 == 1'd1) | (grp_fu_241_p2 == 1'd1) & (tmp_19_fu_379_p2 == 1'd1)))) begin
          ap_NS_fsm = ap_ST_fsm_state13;
        end else if((tmp_19_fu_379_p2 == 1'd1) & (grp_fu_241_p2 == 1'd0) & (tmp_15_fu_373_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else if((tmp_19_fu_379_p2 == 1'd0) & (tmp_15_fu_373_p2 == 1'd0) & (tmp_fu_367_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
          ap_NS_fsm = ap_ST_fsm_state4;
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
        if((tmp_28_fu_898_p2 == 1'd1) & (grp_fu_246_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state4)) begin
          ap_NS_fsm = ap_ST_fsm_state13;
        end else if((tmp_28_fu_898_p2 == 1'd1) & (grp_fu_246_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state4)) begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state7;
        end
      end
      ap_ST_fsm_state5: begin
        ap_NS_fsm = ap_ST_fsm_state6;
      end
      ap_ST_fsm_state6: begin
        ap_NS_fsm = ap_ST_fsm_state7;
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
        ap_NS_fsm = ap_ST_fsm_state12;
      end
      ap_ST_fsm_state12: begin
        if((grp_roundAndPackFloat64_fu_232_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state12)) begin
          ap_NS_fsm = ap_ST_fsm_state13;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state12;
        end
      end
      ap_ST_fsm_state13: begin
        ap_NS_fsm = ap_ST_fsm_state1;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign aExp2_cast_fu_894_p1 = $signed(ap_phi_mux_aExp2_phi_fu_182_p4);
  assign aExp_cast_fu_318_p1 = aExp_fu_308_p4;
  assign aExp_fu_308_p4 = { { a[62:52] } };
  assign aHigh_fu_1115_p2 = tmp_4_reg_1583 | 32'd1073741824;
  assign aLow_fu_1108_p3 = { { tmp_65_reg_1578 }, { 10'd0 } };
  assign aSig_1_cast_fu_304_p1 = aSig_fu_299_p1;
  assign aSig_fu_299_p1 = a[51:0];
  assign a_assign_1_fu_743_p3 = (tmp_i2_i_fu_693_p2[0:0] === 1'b1)? grp_fu_277_p2 : grp_fu_271_p2;
  assign a_assign_2_fu_934_p3 = (icmp1_fu_912_p2[0:0] === 1'b1)? tmp_61_fu_918_p1 : tmp_31_fu_930_p1;
  assign a_assign_6_fu_581_p3 = (tmp_i2_i1_fu_531_p2[0:0] === 1'b1)? grp_fu_277_p2 : grp_fu_271_p2;
  assign a_assign_s_fu_419_p3 = (icmp_fu_395_p2[0:0] === 1'b1)? tmp_55_fu_401_p1 : tmp_27_fu_415_p1;
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];
  assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];
  assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];
  assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
  assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
  assign bExp_cast_fu_349_p1 = bExp_fu_339_p4;
  assign bExp_fu_339_p4 = { { b[62:52] } };
  assign bHigh_fu_1142_p2 = tmp_6_fu_1132_p4 | 32'd2147483648;
  assign bLow_fu_1124_p3 = { { tmp_66_fu_1120_p1 }, { 11'd0 } };
  assign bSig_1_cast_fu_335_p1 = bSig_fu_330_p1;
  assign bSig_fu_330_p1 = b[51:0];
  assign b_assign_mux_i1_fu_573_p3 = (tmp_75_i7_i1_fu_561_p2[0:0] === 1'b1)? grp_fu_277_p2 : grp_fu_271_p2;
  assign b_assign_mux_i_fu_735_p3 = (tmp_75_i7_i_fu_723_p2[0:0] === 1'b1)? grp_fu_277_p2 : grp_fu_271_p2;
  assign countLeadingZerosHig_3_fu_844_p1 = countLeadingZerosHig_q0;
  assign countLeadingZerosHig_6_fu_1046_p1 = countLeadingZerosHig_q0;
  assign grp_fu_241_p2 = (aSig_fu_299_p1 == 52'd0)? 1'b1 : 1'b0;
  assign grp_fu_246_p2 = (grp_fu_246_p0 == 52'd0)? 1'b1 : 1'b0;
  assign grp_fu_251_p4 = { { a[62:51] } };
  assign grp_fu_261_p4 = { { b[62:51] } };
  assign grp_fu_271_p2 = 64'd2251799813685248 | a;
  assign grp_fu_277_p2 = b | 64'd2251799813685248;
  assign grp_fu_287_p2 = float_exception_flag | 32'd16;
  assign grp_roundAndPackFloat64_fu_232_ap_start = grp_roundAndPackFloat64_fu_232_ap_start_reg;
  assign icmp1_fu_912_p2 = (tmp_60_fu_903_p4 == 20'd0)? 1'b1 : 1'b0;
  assign icmp2_fu_952_p2 = (tmp_62_fu_942_p4 == 16'd0)? 1'b1 : 1'b0;
  assign icmp3_fu_1009_p2 = (tmp_64_reg_1532 == 8'd0)? 1'b1 : 1'b0;
  assign icmp6_fu_437_p2 = (tmp_57_fu_427_p4 == 16'd0)? 1'b1 : 1'b0;
  assign icmp9_fu_807_p2 = (tmp_59_reg_1431 == 8'd0)? 1'b1 : 1'b0;
  assign icmp_fu_395_p2 = (tmp_53_fu_385_p4 == 20'd0)? 1'b1 : 1'b0;
  assign or_cond_fu_651_p2 = tmp_16_fu_645_p2 | grp_fu_246_p2;
  assign p_a_i_i_i1_fu_964_p3 = (icmp2_fu_952_p2[0:0] === 1'b1)? tmp_63_fu_958_p2 : a_assign_2_fu_934_p3;
  assign p_a_i_i_i_fu_449_p3 = (icmp6_fu_437_p2[0:0] === 1'b1)? tmp_58_fu_443_p2 : a_assign_s_fu_419_p3;
  assign p_i_i_i1_fu_1025_p3 = (icmp2_reg_1526[0:0] === 1'b1)? 5'd16 : 5'd0;
  assign p_i_i_i_fu_823_p3 = (icmp6_reg_1425[0:0] === 1'b1)? 5'd16 : 5'd0;
  assign p_v1_fu_812_p3 = (icmp9_fu_807_p2[0:0] === 1'b1)? tmp_46_reg_1436 : tmp_47_reg_1441;
  assign p_v_fu_1014_p3 = (icmp3_fu_1009_p2[0:0] === 1'b1)? tmp_50_reg_1537 : tmp_51_reg_1542;
  assign shiftCount_1_fu_859_p2 = countLeadingZerosHig_3_fu_844_p1 + tmp32_cast_fu_855_p1;
  assign shiftCount_1_i_i_i1_fu_1039_p3 = (icmp3_reg_1552[0:0] === 1'b1)? shiftCount_3_fu_1032_p3 : p_i_i_i1_fu_1025_p3;
  assign shiftCount_1_i_i_i_fu_837_p3 = (icmp9_reg_1492[0:0] === 1'b1)? shiftCount_fu_830_p3 : p_i_i_i_fu_823_p3;
  assign shiftCount_2_fu_865_p2 = $signed(7'd117) + $signed(shiftCount_1_reg_1502);
  assign shiftCount_3_cast_fu_870_p1 = $signed(shiftCount_2_fu_865_p2);
  assign shiftCount_3_fu_1032_p3 = (icmp2_reg_1526[0:0] === 1'b1)? 5'd24 : 5'd8;
  assign shiftCount_4_fu_1061_p2 = countLeadingZerosHig_6_fu_1046_p1 + tmp33_cast_fu_1057_p1;
  assign shiftCount_5_fu_1067_p2 = $signed(7'd117) + $signed(shiftCount_4_reg_1562);
  assign shiftCount_7_cast_fu_1072_p1 = $signed(shiftCount_5_fu_1067_p2);
  assign shiftCount_fu_830_p3 = (icmp6_reg_1425[0:0] === 1'b1)? 5'd24 : 5'd8;
  assign tmp29_fu_848_p3 = { { icmp_reg_1420 }, { shiftCount_1_i_i_i_fu_837_p3 } };
  assign tmp32_cast_fu_855_p1 = tmp29_fu_848_p3;
  assign tmp33_cast_fu_1057_p1 = tmp33_fu_1050_p3;
  assign tmp33_fu_1050_p3 = { { icmp1_reg_1521 }, { shiftCount_1_i_i_i1_fu_1039_p3 } };
  assign tmp34_cast_fu_1349_p1 = $signed(tmp34_fu_1343_p2);
  assign tmp34_fu_1343_p2 = zExp2_v_cast_cast_fu_1336_p3 + bExp2_reg_197;
  assign tmp_10_fu_779_p3 = { { tmp_9_fu_769_p4 }, { tmp_8_fu_763_p2 } };
  assign tmp_12_fu_1270_p2 = tmp_68_fu_1241_p1 ^ tmp_44_i_fu_1228_p2;
  assign tmp_13_fu_1276_p2 = tmp_32_fu_1265_p2 | tmp_12_fu_1270_p2;
  assign tmp_14_fu_1282_p4 = { { z0_2_fu_1253_p2[63:1] } };
  assign tmp_15_fu_373_p2 = (bExp_fu_339_p4 == 11'd2047)? 1'b1 : 1'b0;
  assign tmp_16_fu_645_p2 = (bExp_fu_339_p4 != 11'd2047)? 1'b1 : 1'b0;
  assign tmp_19_fu_379_p2 = (aExp_fu_308_p4 == 11'd0)? 1'b1 : 1'b0;
  assign tmp_20_fu_787_p2 = (tmp_10_fu_779_p3 == 52'd0)? 1'b1 : 1'b0;
  assign tmp_21_fu_601_p2 = tmp_42_fu_597_p1 | aExp_fu_308_p4;
  assign tmp_22_fu_607_p4 = { { a[51:11] } };
  assign tmp_23_fu_617_p3 = { { tmp_22_fu_607_p4 }, { tmp_21_fu_601_p2 } };
  assign tmp_24_fu_625_p2 = (tmp_23_fu_617_p3 == 52'd0)? 1'b1 : 1'b0;
  assign tmp_27_fu_415_p1 = tmp_44_fu_405_p4;
  assign tmp_28_fu_898_p2 = (bExp_reg_1388 == 11'd0)? 1'b1 : 1'b0;
  assign tmp_30_fu_322_p3 = a[32'd63];
  assign tmp_31_fu_930_p1 = tmp_48_fu_921_p4;
  assign tmp_32_fu_1265_p2 = (z1_2_reg_1624 != 64'd0)? 1'b1 : 1'b0;
  assign tmp_34_fu_353_p3 = b[32'd63];
  assign tmp_34_i1_fu_639_p2 = tmp_i5_fu_631_p3 | 64'd9218868437227405312;
  assign tmp_34_i_fu_801_p2 = tmp_i4_fu_793_p3 | 64'd9218868437227405312;
  assign tmp_35_fu_1245_p1 = tmp_44_i_fu_1228_p2;
  assign tmp_35_i_fu_1148_p1 = aLow_fu_1108_p3;
  assign tmp_36_fu_671_p1 = a[50:0];
  assign tmp_36_i_fu_1152_p1 = bLow_fu_1124_p3;
  assign tmp_37_i_fu_1162_p1 = bHigh_fu_1142_p2;
  assign tmp_38_fu_687_p2 = b << 64'd1;
  assign tmp_38_i_fu_1172_p1 = aHigh_fu_1115_p2;
  assign tmp_39_fu_713_p1 = b[50:0];
  assign tmp_39_i_fu_1192_p2 = (zMiddleA_1_fu_1188_p2 < zMiddleB_reg_1598)? 1'b1 : 1'b0;
  assign tmp_40_fu_759_p1 = b[10:0];
  assign tmp_42_fu_597_p1 = a[10:0];
  assign tmp_43_i_cast_fu_1224_p1 = tmp_43_i_fu_1218_p3;
  assign tmp_43_i_fu_1218_p3 = { { tmp_39_i_reg_1609 }, { tmp_54_reg_1614 } };
  assign tmp_44_fu_405_p4 = { { a[51:32] } };
  assign tmp_44_i_fu_1228_p2 = (z1_2_reg_1624 < zMiddleA_2_reg_1619)? 1'b1 : 1'b0;
  assign tmp_45_fu_509_p1 = a[50:0];
  assign tmp_45_i_fu_1232_p1 = tmp_44_i_fu_1228_p2;
  assign tmp_48_fu_921_p4 = { { b[51:32] } };
  assign tmp_49_fu_525_p2 = b << 64'd1;
  assign tmp_52_fu_551_p1 = b[50:0];
  assign tmp_53_fu_385_p4 = { { a[51:32] } };
  assign tmp_55_fu_401_p1 = a[31:0];
  assign tmp_56_fu_1308_p4 = { { z0_2_fu_1253_p2[62:1] } };
  assign tmp_57_fu_427_p4 = { { a_assign_s_fu_419_p3[31:16] } };
  assign tmp_58_fu_443_p2 = a_assign_s_fu_419_p3 << 32'd16;
  assign tmp_60_fu_903_p4 = { { b[51:32] } };
  assign tmp_61_fu_918_p1 = b[31:0];
  assign tmp_62_fu_942_p4 = { { a_assign_2_fu_934_p3[31:16] } };
  assign tmp_63_fu_958_p2 = a_assign_2_fu_934_p3 << 32'd16;
  assign tmp_65_fu_1094_p1 = aSig2_reg_169[21:0];
  assign tmp_66_fu_1120_p1 = bSig2_reg_188[20:0];
  assign tmp_68_fu_1241_p1 = z0_1_i_fu_1236_p2[0:0];
  assign tmp_69_fu_1249_p1 = z0_1_i_fu_1236_p2[62:0];
  assign tmp_6_fu_1132_p4 = { { bSig2_reg_188[52:21] } };
  assign tmp_70_fu_1300_p3 = z0_2_cast_fu_1259_p2[32'd62];
  assign tmp_74_i6_i1_fu_555_p2 = (tmp_52_fu_551_p1 != 51'd0)? 1'b1 : 1'b0;
  assign tmp_74_i6_i_fu_717_p2 = (tmp_39_fu_713_p1 != 51'd0)? 1'b1 : 1'b0;
  assign tmp_74_i_i1_fu_513_p2 = (tmp_45_fu_509_p1 != 51'd0)? 1'b1 : 1'b0;
  assign tmp_74_i_i_fu_675_p2 = (tmp_36_fu_671_p1 != 51'd0)? 1'b1 : 1'b0;
  assign tmp_75_i7_i1_fu_561_p2 = tmp_i4_i1_fu_545_p2 & tmp_74_i6_i1_fu_555_p2;
  assign tmp_75_i7_i_fu_723_p2 = tmp_i4_i_fu_707_p2 & tmp_74_i6_i_fu_717_p2;
  assign tmp_75_i_i1_fu_519_p2 = tmp_i_i1_fu_503_p2 & tmp_74_i_i1_fu_513_p2;
  assign tmp_75_i_i_fu_681_p2 = tmp_i_i_fu_665_p2 & tmp_74_i_i_fu_675_p2;
  assign tmp_80_i_i_i1_fu_1020_p1 = p_v_fu_1014_p3;
  assign tmp_80_i_i_i_fu_818_p1 = p_v1_fu_812_p3;
  assign tmp_8_fu_763_p2 = tmp_40_fu_759_p1 | bExp_fu_339_p4;
  assign tmp_9_fu_769_p4 = { { b[51:11] } };
  assign tmp_fu_367_p2 = (aExp_fu_308_p4 == 11'd2047)? 1'b1 : 1'b0;
  assign tmp_i1_fu_589_p3 = (tmp_i2_fu_567_p2[0:0] === 1'b1)? b_assign_mux_i1_fu_573_p3 : a_assign_6_fu_581_p3;
  assign tmp_i2_fu_567_p2 = tmp_75_i_i1_fu_519_p2 | tmp_75_i7_i1_fu_561_p2;
  assign tmp_i2_i1_fu_531_p2 = (tmp_49_fu_525_p2 > 64'd18437736874454810624)? 1'b1 : 1'b0;
  assign tmp_i2_i_fu_693_p2 = (tmp_38_fu_687_p2 > 64'd18437736874454810624)? 1'b1 : 1'b0;
  assign tmp_i3_i1_fu_537_p3 = { { grp_fu_261_p4 }, { 51'd0 } };
  assign tmp_i3_i_fu_699_p3 = { { grp_fu_261_p4 }, { 51'd0 } };
  assign tmp_i4_fu_793_p3 = { { zSign_fu_361_p2 }, { 63'd0 } };
  assign tmp_i4_i1_fu_545_p2 = (tmp_i3_i1_fu_537_p3 == 63'd9218868437227405312)? 1'b1 : 1'b0;
  assign tmp_i4_i_fu_707_p2 = (tmp_i3_i_fu_699_p3 == 63'd9218868437227405312)? 1'b1 : 1'b0;
  assign tmp_i5_fu_631_p3 = { { zSign_fu_361_p2 }, { 63'd0 } };
  assign tmp_i6_fu_487_p3 = { { zSign_fu_361_p2 }, { 63'd0 } };
  assign tmp_i7_fu_874_p1 = $unsigned(shiftCount_3_cast_fu_870_p1);
  assign tmp_i8_fu_1002_p3 = { { zSign_reg_1398 }, { 63'd0 } };
  assign tmp_i9_12_fu_1076_p1 = $unsigned(shiftCount_7_cast_fu_1072_p1);
  assign tmp_i9_fu_729_p2 = tmp_75_i_i_fu_681_p2 | tmp_75_i7_i_fu_723_p2;
  assign tmp_i_fu_751_p3 = (tmp_i9_fu_729_p2[0:0] === 1'b1)? b_assign_mux_i_fu_735_p3 : a_assign_1_fu_743_p3;
  assign tmp_i_i1_fu_503_p2 = (tmp_i_i2_fu_495_p3 == 63'd9218868437227405312)? 1'b1 : 1'b0;
  assign tmp_i_i2_fu_495_p3 = { { grp_fu_251_p4 }, { 51'd0 } };
  assign tmp_i_i3_fu_657_p3 = { { grp_fu_251_p4 }, { 51'd0 } };
  assign tmp_i_i_fu_665_p2 = (tmp_i_i3_fu_657_p3 == 63'd9218868437227405312)? 1'b1 : 1'b0;
  assign z0_1_i_fu_1236_p2 = z0_reg_1604 + tmp_43_i_cast_fu_1224_p1;
  assign z0_2_cast_fu_1259_p2 = tmp_69_fu_1249_p1 + tmp_35_fu_1245_p1;
  assign z0_2_fu_1253_p2 = tmp_45_i_fu_1232_p1 + z0_1_i_fu_1236_p2;
  assign z0_fu_1182_p0 = tmp_38_i_fu_1172_p1;
  assign z0_fu_1182_p1 = tmp_37_i_fu_1162_p1;
  assign z0_fu_1182_p2 = z0_fu_1182_p0 * z0_fu_1182_p1;
  assign z1_2_fu_1213_p2 = z1_reg_1588 + zMiddleA_2_fu_1207_p2;
  assign z1_fu_1156_p0 = tmp_35_i_fu_1148_p1;
  assign z1_fu_1156_p1 = tmp_36_i_fu_1152_p1;
  assign z1_fu_1156_p2 = z1_fu_1156_p0 * z1_fu_1156_p1;
  assign zExp2_v_cast_cast_fu_1336_p3 = (tmp_70_reg_1630[0:0] === 1'b1)? 12'd3073 : 12'd3072;
  assign zExpPtr_temp_1_cast_fu_1090_p1 = $signed(zExpPtr_temp_1_fu_1085_p2);
  assign zExpPtr_temp_1_fu_1085_p2 = 7'd12 - shiftCount_4_reg_1562;
  assign zExpPtr_temp_cast_fu_889_p1 = $signed(zExpPtr_temp_fu_884_p2);
  assign zExpPtr_temp_fu_884_p2 = 7'd12 - shiftCount_1_reg_1502;
  assign zExp_fu_1353_p2 = $signed(aExp2_cast_reg_1508) + $signed(tmp34_cast_fu_1349_p1);
  assign zMiddleA_1_fu_1188_p2 = zMiddleB_reg_1598 + zMiddleA_reg_1593;
  assign zMiddleA_2_fu_1207_p2 = zMiddleA_1_fu_1188_p2 << 64'd32;
  assign zMiddleA_fu_1166_p0 = tmp_35_i_fu_1148_p1;
  assign zMiddleA_fu_1166_p1 = tmp_37_i_fu_1162_p1;
  assign zMiddleA_fu_1166_p2 = zMiddleA_fu_1166_p0 * zMiddleA_fu_1166_p1;
  assign zMiddleB_fu_1176_p0 = tmp_36_i_fu_1152_p1;
  assign zMiddleB_fu_1176_p1 = tmp_38_i_fu_1172_p1;
  assign zMiddleB_fu_1176_p2 = zMiddleB_fu_1176_p0 * zMiddleB_fu_1176_p1;
  assign zSig0_1_fu_1292_p3 = { { tmp_14_fu_1282_p4 }, { tmp_13_fu_1276_p2 } };
  assign zSig0_2_fu_1318_p4 = { { { tmp_56_fu_1308_p4 }, { tmp_13_fu_1276_p2 } }, { 1'd0 } };
  assign zSig0_3_fu_1328_p3 = (tmp_70_fu_1300_p3[0:0] === 1'b1)? zSig0_1_fu_1292_p3 : zSig0_2_fu_1318_p4;
  assign zSigPtr_temp_1_fu_1080_p2 = bSig_1_cast_reg_1382 << tmp_i9_12_fu_1076_p1;
  assign zSigPtr_temp_fu_878_p2 = aSig_1_cast_reg_1366 << tmp_i7_fu_874_p1;
  assign zSign_fu_361_p2 = tmp_34_fu_353_p3 ^ tmp_30_fu_322_p3;

  always @(posedge ap_clk) begin
    aSig_1_cast_reg_1366[63:52] <= 12'b000000000000;
    bSig_1_cast_reg_1382[63:52] <= 12'b000000000000;
    bExp_cast_reg_1393[11] <= 1'b0;
    z1_reg_1588[10:0] <= 11'b00000000000;
    zMiddleA_2_reg_1619[31:0] <= 32'b00000000000000000000000000000000;
    z1_2_reg_1624[10:0] <= 11'b00000000000;
  end


endmodule


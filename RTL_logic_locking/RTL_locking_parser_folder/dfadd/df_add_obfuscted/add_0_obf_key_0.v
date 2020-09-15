
module add_0_obf
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
  locking_key
);

  parameter ap_ST_fsm_state1 = 8'd1;
  parameter ap_ST_fsm_state2 = 8'd2;
  parameter ap_ST_fsm_state3 = 8'd4;
  parameter ap_ST_fsm_state4 = 8'd8;
  parameter ap_ST_fsm_state5 = 8'd16;
  parameter ap_ST_fsm_state6 = 8'd32;
  parameter ap_ST_fsm_state7 = 8'd64;
  parameter ap_ST_fsm_state8 = 8'd128;
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
  reg [7:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  reg [31:0] float_exception_flag;
  wire [10:0] aExp_fu_273_p4;
  reg [10:0] aExp_reg_1122;
  wire [11:0] aExp_cast_fu_285_p1;
  wire [10:0] bExp_fu_289_p4;
  reg [10:0] bExp_reg_1133;
  wire [11:0] expDiff_fu_303_p2;
  reg [11:0] expDiff_reg_1138;
  wire [51:0] tmp_27_fu_313_p1;
  reg [51:0] tmp_27_reg_1144;
  wire [61:0] aSig_cast2_cast_fu_325_p1;
  reg [61:0] aSig_cast2_cast_reg_1149;
  wire [61:0] bSig_cast1_cast_fu_345_p1;
  reg [61:0] bSig_cast1_cast_reg_1155;
  wire [0:0] tmp_fu_349_p2;
  reg [0:0] tmp_reg_1160;
  wire [0:0] tmp_34_fu_355_p3;
  reg [0:0] tmp_34_reg_1164;
  wire [0:0] grp_fu_215_p2;
  reg [0:0] tmp_17_reg_1168;
  wire [0:0] grp_fu_220_p2;
  reg [0:0] tmp_25_reg_1172;
  wire [63:0] zSig_fu_377_p2;
  wire [63:0] tmp_29_i_fu_403_p4;
  wire [63:0] b_assign_2_mux_fu_503_p3;
  wire [0:0] tmp_24_fu_419_p2;
  wire [63:0] a_assign_5_fu_511_p3;
  wire [0:0] tmp_28_fu_497_p2;
  wire [0:0] tmp_16_fu_519_p2;
  reg [0:0] tmp_16_reg_1202;
  wire [63:0] b_assign_1_mux_fu_609_p3;
  wire [0:0] tmp_20_fu_525_p2;
  wire [63:0] a_assign_4_fu_617_p3;
  wire [0:0] tmp_26_fu_603_p2;
  wire [63:0] tmp_30_i_fu_633_p2;
  reg [0:0] tmp_s_reg_1227;
  wire [61:0] bSig_2_fu_661_p3;
  reg [61:0] bSig_2_reg_1231;
  wire [10:0] expDiff_2_fu_669_p3;
  reg [10:0] expDiff_2_reg_1239;
  wire [0:0] icmp_fu_691_p2;
  reg [0:0] icmp_reg_1245;
  wire [5:0] tmp_8_i_fu_697_p2;
  reg [5:0] tmp_8_i_reg_1250;
  wire [63:0] b_assign_mux_fu_787_p3;
  wire [0:0] tmp_14_fu_703_p2;
  wire [63:0] a_assign_3_fu_795_p3;
  wire [0:0] tmp_19_fu_781_p2;
  wire [61:0] aSig_2_fu_817_p3;
  reg [61:0] aSig_2_reg_1271;
  wire ap_CS_fsm_state2;
  wire [11:0] count_assign_1_fu_839_p2;
  reg [11:0] count_assign_1_reg_1278;
  wire [0:0] tmp_i7_fu_845_p2;
  reg [0:0] tmp_i7_reg_1283;
  wire [0:0] icmp8_fu_861_p2;
  reg [0:0] icmp8_reg_1289;
  wire [0:0] tmp_2_i1_fu_877_p2;
  reg [0:0] tmp_2_i1_reg_1294;
  wire [61:0] z_5_fu_945_p3;
  wire ap_CS_fsm_state3;
  wire [61:0] z_4_fu_1038_p3;
  wire ap_CS_fsm_state4;
  wire [11:0] zExp_0_s_fu_1095_p3;
  wire ap_CS_fsm_state5;
  wire [63:0] p_s_fu_1103_p3;
  wire [63:0] grp_roundAndPackFloat64_fu_204_ap_return;
  reg [63:0] tmp_31_reg_1319;
  wire ap_CS_fsm_state7;
  wire grp_roundAndPackFloat64_fu_204_ap_ready;
  wire grp_roundAndPackFloat64_fu_204_ap_done;
  wire grp_roundAndPackFloat64_fu_204_ap_start;
  wire grp_roundAndPackFloat64_fu_204_ap_idle;
  wire [31:0] grp_roundAndPackFloat64_fu_204_float_exception_flag_o;
  wire grp_roundAndPackFloat64_fu_204_float_exception_flag_o_ap_vld;
  reg [61:0] bSig_s_reg_130;
  reg [61:0] aSig_s_reg_139;
  reg [10:0] zExp_3_reg_148;
  reg [11:0] zExp_2_reg_157;
  reg [63:0] zSig_1_reg_167;
  reg [63:0] ap_phi_mux_p_0_phi_fu_180_p22;
  reg [63:0] p_0_reg_177;
  wire ap_CS_fsm_state8;
  reg grp_roundAndPackFloat64_fu_204_ap_start_reg;
  wire ap_CS_fsm_state6;
  wire [31:0] grp_fu_261_p2;
  reg [10:0] grp_fu_220_p0;
  wire [11:0] bExp_cast_fu_299_p1;
  wire [60:0] aSig_fu_317_p3;
  wire [51:0] tmp_32_fu_329_p1;
  wire [60:0] bSig_fu_333_p3;
  wire [62:0] tmp_30_fu_363_p4;
  wire [63:0] bSig_cast1_fu_341_p1;
  wire [63:0] tmp_47_cast_fu_373_p1;
  wire [61:0] tmp_29_fu_383_p2;
  wire [52:0] zSig_assign_fu_389_p4;
  wire [61:0] tmp_43_fu_399_p1;
  wire [60:0] tmp_23_fu_413_p2;
  wire [11:0] grp_fu_225_p4;
  wire [62:0] tmp_i8_16_fu_425_p3;
  wire [50:0] tmp_54_fu_439_p1;
  wire [0:0] tmp_i10_fu_433_p2;
  wire [0:0] tmp_24_i4_fu_443_p2;
  wire [63:0] tmp_55_fu_455_p2;
  wire [11:0] grp_fu_235_p4;
  wire [62:0] tmp_i1_17_fu_467_p3;
  wire [50:0] tmp_56_fu_481_p1;
  wire [0:0] tmp_i11_fu_475_p2;
  wire [0:0] tmp_24_i5_fu_485_p2;
  wire [0:0] tmp_25_i5_fu_491_p2;
  wire [0:0] tmp_25_i4_fu_449_p2;
  wire [63:0] grp_fu_251_p2;
  wire [63:0] grp_fu_245_p2;
  wire [0:0] tmp_i4_fu_461_p2;
  wire [62:0] tmp_i2_fu_531_p3;
  wire [50:0] tmp_50_fu_545_p1;
  wire [0:0] tmp_i8_fu_539_p2;
  wire [0:0] tmp_24_i2_fu_549_p2;
  wire [63:0] tmp_51_fu_561_p2;
  wire [62:0] tmp_i6_12_fu_573_p3;
  wire [50:0] tmp_52_fu_587_p1;
  wire [0:0] tmp_i9_13_fu_581_p2;
  wire [0:0] tmp_24_i3_fu_591_p2;
  wire [0:0] tmp_25_i3_fu_597_p2;
  wire [0:0] tmp_25_i2_fu_555_p2;
  wire [0:0] tmp_i3_fu_567_p2;
  wire [63:0] tmp_i2_14_fu_625_p3;
  wire [10:0] tmp_22_fu_309_p1;
  wire [0:0] tmp_15_fu_639_p2;
  wire [61:0] bSig_1_fu_651_p4;
  wire [10:0] expDiff_2_cast_fu_645_p2;
  wire [4:0] tmp_38_fu_681_p4;
  wire [5:0] tmp_36_fu_677_p1;
  wire [62:0] tmp_i9_fu_709_p3;
  wire [50:0] tmp_42_fu_723_p1;
  wire [0:0] tmp_i5_fu_717_p2;
  wire [0:0] tmp_24_i_fu_727_p2;
  wire [63:0] tmp_45_fu_739_p2;
  wire [62:0] tmp_i5_10_fu_751_p3;
  wire [50:0] tmp_46_fu_765_p1;
  wire [0:0] tmp_i6_fu_759_p2;
  wire [0:0] tmp_24_i1_fu_769_p2;
  wire [0:0] tmp_25_i1_fu_775_p2;
  wire [0:0] tmp_25_i_fu_733_p2;
  wire [0:0] tmp_i1_fu_745_p2;
  wire [61:0] aSig_1_fu_808_p4;
  wire [11:0] expDiff_3_fu_803_p2;
  wire [11:0] expDiff_1_fu_828_p3;
  wire [5:0] tmp_48_fu_851_p4;
  wire [5:0] tmp_47_fu_835_p1;
  wire [63:0] aSig_2_cast_fu_824_p1;
  wire [63:0] tmp_i7_15_fu_867_p1;
  wire [63:0] tmp_1_i1_fu_871_p2;
  wire [61:0] tmp_6_i33_cast_fu_883_p1;
  wire [61:0] tmp_7_i1_fu_886_p2;
  wire [0:0] tmp_49_fu_891_p1;
  wire [60:0] tmp_5_fu_900_p4;
  wire [0:0] tmp_10_i1_fu_895_p2;
  wire [0:0] tmp_4_i1_fu_918_p2;
  wire [0:0] sel_tmp_i1_fu_927_p2;
  wire [0:0] sel_tmp1_i1_fu_932_p2;
  wire [61:0] tmp_6_fu_910_p3;
  wire [61:0] z_5_cast_fu_923_p1;
  wire [61:0] z_2_fu_937_p3;
  wire [61:0] tmp_6_i_cast_fu_959_p1;
  wire [63:0] bSig_2_cast_fu_951_p1;
  wire [63:0] tmp_i_11_fu_967_p1;
  wire [63:0] tmp_1_i_fu_970_p2;
  wire [61:0] tmp_7_i_fu_962_p2;
  wire [0:0] tmp_40_fu_982_p1;
  wire [0:0] tmp_2_i_fu_976_p2;
  wire [60:0] tmp_3_fu_992_p4;
  wire [0:0] tmp_10_i_fu_986_p2;
  wire [0:0] tmp_4_i_fu_1010_p2;
  wire [0:0] tmp_i_fu_954_p2;
  wire [0:0] sel_tmp_i_fu_1019_p2;
  wire [0:0] sel_tmp1_i_fu_1025_p2;
  wire [61:0] tmp_4_fu_1002_p3;
  wire [61:0] z_1_cast_fu_1015_p1;
  wire [61:0] z_fu_1030_p3;
  wire [61:0] aSig_4_fu_1053_p2;
  wire [62:0] aSig_4_cast_fu_1059_p1;
  wire [62:0] bSig_cast_fu_1045_p1;
  wire [62:0] zSig_2_fu_1063_p2;
  wire [11:0] zExp_3_cast_fu_1049_p1;
  wire [0:0] tmp_53_fu_1087_p3;
  wire [11:0] zExp_4_fu_1081_p2;
  wire [63:0] zSig_2_cast_fu_1069_p1;
  wire [63:0] zSig_3_fu_1073_p3;
  reg [63:0] ap_return_preg;
  reg [7:0] ap_NS_fsm;
  wire Const_0;
  wire Const_1;
  wire Const_2;
  wire Const_3;
  wire Const_4;
  wire Const_5;
  wire Const_6;
  wire Const_7;
  wire Const_8;
  wire Const_9;
  wire Const_10;
  wire Const_11;
  wire Const_12;
  wire Const_13;
  wire Const_14;
  wire Const_15;
  wire Const_16;
  wire Const_17;
  wire Const_18;
  wire Const_19;
  wire Const_20;
  wire Const_21;
  wire Const_22;
  wire Const_23;
  wire Const_24;
  wire Const_25;
  wire Const_26;
  wire Const_27;
  wire Const_28;
  wire Const_29;
  wire Const_30;
  wire Const_31;
  wire Const_32;
  wire Const_33;
  wire Const_34;
  wire Const_35;
  wire Const_36;
  wire Const_37;
  wire Const_38;
  wire Const_39;
  wire Const_40;
  wire Const_41;
  wire Const_42;
  wire Const_43;
  wire Const_44;
  wire Const_45;
  wire Const_46;
  wire Const_47;
  wire Const_48;
  wire Const_49;
  wire Const_50;
  wire Const_51;
  wire Const_52;
  wire Const_53;
  wire Const_54;
  wire Const_55;
  wire Const_56;
  wire Const_57;
  wire Const_58;
  wire Const_59;
  wire Const_60;
  wire Const_61;
  wire Const_62;
  wire Const_63;
  wire Const_64;
  wire Const_65;
  wire Const_66;
  wire Const_67;
  wire Const_68;
  wire Const_69;
  wire Const_70;
  wire Const_71;
  wire Const_72;
  wire Const_73;
  wire Const_74;
  wire Const_75;
  wire Const_76;
  wire Const_77;
  wire Const_78;
  wire Const_79;
  wire Const_80;
  wire Const_81;
  wire Const_82;
  wire Const_83;
  wire Const_84;
  wire Const_85;
  wire Const_86;
  wire Const_87;
  wire Const_88;
  wire Const_89;
  wire Const_90;
  wire Const_91;
  wire Const_92;
  wire Const_93;
  wire Const_94;
  wire Const_95;
  wire Const_96;
  wire Const_97;
  wire Const_98;
  wire Const_99;
  wire Const_100;
  wire Const_101;
  wire Const_102;
  wire Const_103;
  wire Const_104;
  wire Const_105;
  wire Const_106;
  wire Const_107;
  wire Const_108;
  wire Const_109;
  wire Const_110;
  wire Const_111;
  wire Const_112;
  wire Const_113;
  wire Const_114;
  wire Const_115;
  wire Const_116;
  wire Const_117;
  wire Const_118;
  wire Const_119;
  wire Const_120;
  wire Const_121;
  wire Const_122;
  wire Const_123;
  wire Const_124;
  wire Const_125;
  wire Const_126;
  wire Const_127;
  wire Const_128;
  wire Const_129;
  wire Const_130;
  wire Const_131;
  wire Const_132;
  wire Const_133;
  wire Const_134;
  wire Const_135;
  wire Const_136;
  wire Const_137;
  wire Const_138;
  wire Const_139;
  wire Const_140;
  wire Const_141;
  wire Const_142;
  wire Const_143;
  wire Const_144;
  wire Const_145;
  wire Const_146;
  wire Const_147;
  wire Const_148;
  wire Const_149;
  wire Const_150;
  wire Const_151;
  wire Const_152;
  wire Const_153;
  wire Const_154;
  wire Const_155;
  wire Const_156;
  wire Const_157;
  wire Const_158;
  wire Const_159;
  wire Const_160;
  wire Const_161;
  wire Const_162;
  wire Const_163;
  wire Const_164;
  wire Const_165;
  wire Const_166;
  wire Const_167;
  wire Const_168;
  wire Const_169;
  wire Const_170;
  wire Const_171;
  wire Const_172;
  wire Const_173;
  wire Const_174;
  wire Const_175;
  wire Const_176;
  wire Const_177;
  wire Const_178;
  wire Const_179;
  wire Const_180;
  wire Const_181;
  wire Const_182;
  wire Const_183;
  wire Const_184;
  wire Const_185;
  wire Const_186;
  wire Const_187;
  wire Const_188;
  wire Const_189;
  wire Const_190;
  wire Const_191;
  wire Const_192;
  wire Const_193;
  wire Const_194;
  wire Const_195;
  wire Const_196;
  wire Const_197;
  wire Const_198;
  wire [61:0] Const_199;
  wire Const_200;
  wire Const_201;
  wire Const_202;
  wire Const_203;
  wire Const_204;
  wire Const_205;
  wire Const_206;
  wire [11:0] Const_207;
  wire Const_208;
  wire [10:0] Const_209;
  wire Const_210;
  wire [11:0] Const_211;
  wire [10:0] Const_212;
  wire Const_213;
  wire Const_214;
  wire [10:0] Const_215;
  wire Const_216;
  wire Const_217;
  wire [63:0] Const_218;
  wire [63:0] Const_219;
  wire [31:0] Const_220;
  wire [5:0] Const_221;
  wire Const_222;
  wire Const_223;
  wire [4:0] Const_224;
  wire Const_225;
  wire Const_226;
  wire Const_227;
  wire Const_228;
  wire Const_229;
  wire [60:0] Const_230;
  wire Const_231;
  wire Const_232;
  wire [10:0] Const_233;
  wire Const_234;
  wire Const_235;
  wire [10:0] Const_236;
  wire Const_237;
  wire Const_238;
  wire [60:0] Const_239;
  wire Const_240;
  wire Const_241;
  wire [60:0] Const_242;
  wire Const_243;
  wire Const_244;
  wire [50:0] Const_245;
  wire Const_246;
  wire Const_247;
  wire [50:0] Const_248;
  wire Const_249;
  wire Const_250;
  wire [50:0] Const_251;
  wire Const_252;
  wire Const_253;
  wire [50:0] Const_254;
  wire Const_255;
  wire Const_256;
  wire [50:0] Const_257;
  wire Const_258;
  wire Const_259;
  wire [50:0] Const_260;
  wire Const_261;
  wire Const_262;
  wire [63:0] Const_263;
  wire Const_264;
  wire Const_265;
  wire [63:0] Const_266;
  wire Const_267;
  wire Const_268;
  wire [63:0] Const_269;
  wire [63:0] Const_270;
  wire [61:0] Const_271;
  wire Const_272;
  wire Const_273;
  wire [61:0] Const_274;
  wire Const_275;
  wire Const_276;
  wire [63:0] Const_277;
  wire [63:0] Const_278;
  wire [5:0] Const_279;
  wire [11:0] Const_280;
  wire Const_281;
  wire Const_282;
  wire [62:0] Const_283;
  wire Const_284;
  wire Const_285;
  wire [62:0] Const_286;
  wire Const_287;
  wire Const_288;
  wire [63:0] Const_289;
  wire Const_290;
  wire Const_291;
  wire [63:0] Const_292;
  wire Const_293;
  wire Const_294;
  wire [63:0] Const_295;
  wire Const_296;
  wire Const_297;
  wire [62:0] Const_298;
  wire Const_299;
  wire Const_300;
  wire [62:0] Const_301;
  wire Const_302;
  wire Const_303;
  wire [11:0] Const_304;
  wire Const_305;
  wire Const_306;
  wire [62:0] Const_307;
  wire Const_308;
  wire Const_309;
  wire [62:0] Const_310;
  wire Const_311;
  wire Const_312;
  wire [10:0] Const_313;
  wire Const_314;
  wire Const_315;
  wire Const_316;
  wire [11:0] Const_317;
  wire Const_318;
  wire Const_319;
  wire Const_320;
  wire Const_321;
  input [3070:0] locking_key;
  wire [2447:0] working_key;

  initial begin
    #0 ap_CS_fsm = 8'd1;
    #0 float_exception_flag = 32'd0;
    #0 grp_roundAndPackFloat64_fu_204_ap_start_reg = 1'b0;
    #0 ap_return_preg = 64'd0;
  end


  roundAndPackFloat64
  grp_roundAndPackFloat64_fu_204
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_roundAndPackFloat64_fu_204_ap_start),
    .ap_done(grp_roundAndPackFloat64_fu_204_ap_done),
    .ap_idle(grp_roundAndPackFloat64_fu_204_ap_idle),
    .ap_ready(grp_roundAndPackFloat64_fu_204_ap_ready),
    .zSign(zSign),
    .zExp(zExp_2_reg_157),
    .zSig(zSig_1_reg_167),
    .float_exception_flag_i(float_exception_flag),
    .float_exception_flag_o(grp_roundAndPackFloat64_fu_204_float_exception_flag_o),
    .float_exception_flag_o_ap_vld(grp_roundAndPackFloat64_fu_204_float_exception_flag_o_ap_vld),
    .ap_return(grp_roundAndPackFloat64_fu_204_ap_return)
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
      if(1'b1 == ap_CS_fsm_state8) begin
        ap_return_preg <= ap_phi_mux_p_0_phi_fu_180_p22;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      grp_roundAndPackFloat64_fu_204_ap_start_reg <= 1'b0;
    end else begin
      if(1'b1 == ap_CS_fsm_state6) begin
        grp_roundAndPackFloat64_fu_204_ap_start_reg <= 1'b1;
      end else if(grp_roundAndPackFloat64_fu_204_ap_ready == 1'b1) begin
        grp_roundAndPackFloat64_fu_204_ap_start_reg <= 1'b0;
      end 
    end
  end

  assign Const_0 = (1'd0 ^ working_key[80]);
  assign Const_1 = (1'd1 ^ working_key[81]);

  always @(posedge ap_clk) begin
    if(((Const_0 == ap_CS_fsm_state3) ^ working_key[82]) == 1'b0) begin
      aSig_s_reg_139 <= z_5_fu_945_p3;
    end else if(Const_1 == ap_CS_fsm_state4) begin
      aSig_s_reg_139 <= aSig_cast2_cast_reg_1149;
    end 
  end

  assign Const_2 = (1'd1 ^ working_key[83]);
  assign Const_3 = (1'd0 ^ working_key[84]);

  always @(posedge ap_clk) begin
    if(((Const_2 == ap_CS_fsm_state3) ^ working_key[85]) == 1'b1) begin
      bSig_s_reg_130 <= bSig_cast1_cast_reg_1155;
    end else if(Const_3 == ap_CS_fsm_state4) begin
      bSig_s_reg_130 <= z_4_fu_1038_p3;
    end 
  end

  assign Const_4 = (1'd0 ^ working_key[86]);
  assign Const_5 = (1'd1 ^ working_key[87]);
  assign Const_6 = (1'd1 ^ working_key[88]);
  assign Const_7 = (1'd1 ^ working_key[89]);
  assign Const_8 = (1'd0 ^ working_key[90]);
  assign Const_9 = (1'd1 ^ working_key[91]);
  assign Const_10 = (1'd0 ^ working_key[92]);
  assign Const_11 = (1'd1 ^ working_key[93]);
  assign Const_12 = (1'd1 ^ working_key[94]);
  assign Const_13 = (1'd1 ^ working_key[95]);
  assign Const_14 = (1'd1 ^ working_key[96]);
  assign Const_15 = (1'd1 ^ working_key[97]);
  assign Const_16 = (1'd1 ^ working_key[98]);
  assign Const_17 = (1'd1 ^ working_key[99]);
  assign Const_18 = (1'd1 ^ working_key[100]);
  assign Const_19 = (1'd0 ^ working_key[101]);
  assign Const_20 = (1'd1 ^ working_key[102]);
  assign Const_21 = (1'd0 ^ working_key[103]);
  assign Const_22 = (1'd0 ^ working_key[104]);
  assign Const_23 = (1'd1 ^ working_key[105]);
  assign Const_24 = (1'd0 ^ working_key[106]);
  assign Const_25 = (1'd1 ^ working_key[107]);

  always @(posedge ap_clk) begin
    if((((tmp_19_fu_781_p2 == Const_4) & (grp_fu_215_p2 == Const_5) & (tmp_14_fu_703_p2 == Const_6) & (tmp_fu_349_p2 == Const_7) & (Const_8 == ap_CS_fsm_state1) & (ap_start == Const_9) | (tmp_16_fu_519_p2 == Const_10) & (tmp_26_fu_603_p2 == Const_11) & (tmp_20_fu_525_p2 == Const_12) & (tmp_34_fu_355_p3 == Const_13) & (tmp_fu_349_p2 == Const_14) & (Const_15 == ap_CS_fsm_state1) & (ap_start == Const_16) | (tmp_28_fu_497_p2 == Const_17) & (grp_fu_215_p2 == Const_18) & (tmp_24_fu_419_p2 == Const_19) & (tmp_34_fu_355_p3 == Const_20) & (tmp_fu_349_p2 == Const_21) & (Const_22 == ap_CS_fsm_state1) & (ap_start == Const_23)) ^ working_key[108]) == 1'b0) begin
      float_exception_flag <= grp_fu_261_p2;
    end else if((grp_roundAndPackFloat64_fu_204_float_exception_flag_o_ap_vld == Const_24) & (Const_25 == ap_CS_fsm_state7)) begin
      float_exception_flag <= grp_roundAndPackFloat64_fu_204_float_exception_flag_o;
    end 
  end

  assign Const_26 = (1'd1 ^ working_key[109]);
  assign Const_27 = (1'd0 ^ working_key[110]);
  assign Const_28 = (1'd0 ^ working_key[111]);
  assign Const_29 = (1'd1 ^ working_key[112]);
  assign Const_30 = (1'd0 ^ working_key[113]);
  assign Const_31 = (1'd0 ^ working_key[114]);
  assign Const_32 = (1'd1 ^ working_key[115]);
  assign Const_33 = (1'd0 ^ working_key[116]);
  assign Const_34 = (1'd1 ^ working_key[117]);
  assign Const_35 = (1'd1 ^ working_key[118]);
  assign Const_36 = (1'd1 ^ working_key[119]);
  assign Const_37 = (1'd1 ^ working_key[120]);
  assign Const_38 = (1'd1 ^ working_key[121]);
  assign Const_39 = (1'd0 ^ working_key[122]);
  assign Const_40 = (1'd1 ^ working_key[123]);
  assign Const_41 = (1'd1 ^ working_key[124]);
  assign Const_42 = (1'd1 ^ working_key[125]);
  assign Const_43 = (1'd0 ^ working_key[126]);
  assign Const_44 = (1'd1 ^ working_key[127]);
  assign Const_45 = (1'd1 ^ working_key[128]);
  assign Const_46 = (1'd0 ^ working_key[129]);
  assign Const_47 = (1'd1 ^ working_key[130]);
  assign Const_48 = (1'd0 ^ working_key[131]);
  assign Const_49 = (1'd1 ^ working_key[132]);
  assign Const_50 = (1'd0 ^ working_key[133]);
  assign Const_51 = (1'd1 ^ working_key[134]);
  assign Const_52 = (1'd0 ^ working_key[135]);
  assign Const_53 = (1'd1 ^ working_key[136]);
  assign Const_54 = (1'd0 ^ working_key[137]);
  assign Const_55 = (1'd0 ^ working_key[138]);
  assign Const_56 = (1'd1 ^ working_key[139]);
  assign Const_57 = (1'd0 ^ working_key[140]);
  assign Const_58 = (1'd0 ^ working_key[141]);
  assign Const_59 = (1'd0 ^ working_key[142]);
  assign Const_60 = (1'd1 ^ working_key[143]);
  assign Const_61 = (1'd0 ^ working_key[144]);
  assign Const_62 = (1'd1 ^ working_key[145]);
  assign Const_63 = (1'd0 ^ working_key[146]);
  assign Const_64 = (1'd1 ^ working_key[147]);
  assign Const_65 = (1'd1 ^ working_key[148]);
  assign Const_66 = (1'd0 ^ working_key[149]);
  assign Const_67 = (1'd0 ^ working_key[150]);
  assign Const_68 = (1'd0 ^ working_key[151]);
  assign Const_69 = (1'd0 ^ working_key[152]);
  assign Const_70 = (1'd0 ^ working_key[153]);
  assign Const_71 = (1'd1 ^ working_key[154]);
  assign Const_72 = (1'd0 ^ working_key[155]);
  assign Const_73 = (1'd1 ^ working_key[156]);
  assign Const_74 = (1'd1 ^ working_key[157]);
  assign Const_75 = (1'd0 ^ working_key[158]);
  assign Const_76 = (1'd0 ^ working_key[159]);
  assign Const_77 = (1'd0 ^ working_key[160]);
  assign Const_78 = (1'd0 ^ working_key[161]);
  assign Const_79 = (1'd1 ^ working_key[162]);
  assign Const_80 = (1'd0 ^ working_key[163]);
  assign Const_81 = (1'd0 ^ working_key[164]);
  assign Const_82 = (1'd1 ^ working_key[165]);
  assign Const_83 = (1'd0 ^ working_key[166]);
  assign Const_84 = (1'd1 ^ working_key[167]);
  assign Const_85 = (1'd0 ^ working_key[168]);
  assign Const_86 = (1'd1 ^ working_key[169]);
  assign Const_87 = (1'd1 ^ working_key[170]);
  assign Const_88 = (1'd0 ^ working_key[171]);
  assign Const_89 = (1'd1 ^ working_key[172]);
  assign Const_90 = (1'd1 ^ working_key[173]);
  assign Const_91 = (1'd1 ^ working_key[174]);
  assign Const_92 = (1'd0 ^ working_key[175]);
  assign Const_93 = (1'd1 ^ working_key[176]);
  assign Const_94 = (1'd1 ^ working_key[177]);
  assign Const_95 = (1'd0 ^ working_key[178]);
  assign Const_96 = (1'd1 ^ working_key[179]);
  assign Const_97 = (1'd0 ^ working_key[180]);
  assign Const_98 = (1'd1 ^ working_key[181]);

  always @(posedge ap_clk) begin
    if(((tmp_28_fu_497_p2 == Const_26) & (grp_fu_215_p2 == Const_27) & (tmp_24_fu_419_p2 == Const_28) & (tmp_34_fu_355_p3 == Const_29) & (tmp_fu_349_p2 == Const_30) & (Const_31 == ap_CS_fsm_state1) & (ap_start == Const_32) ^ working_key[190]) == 1'b1) begin
      p_0_reg_177 <= b_assign_2_mux_fu_503_p3;
    end else if(((tmp_16_fu_519_p2 == Const_33) & (tmp_26_fu_603_p2 == Const_34) & (tmp_20_fu_525_p2 == Const_35) & (tmp_34_fu_355_p3 == Const_36) & (tmp_fu_349_p2 == Const_37) & (Const_38 == ap_CS_fsm_state1) & (ap_start == Const_39) ^ working_key[189]) == 1'b0) begin
      p_0_reg_177 <= b_assign_1_mux_fu_609_p3;
    end else if(((tmp_19_fu_781_p2 == Const_40) & (grp_fu_215_p2 == Const_41) & (tmp_14_fu_703_p2 == Const_42) & (tmp_fu_349_p2 == Const_43) & (Const_44 == ap_CS_fsm_state1) & (ap_start == Const_45) ^ working_key[188]) == 1'b1) begin
      p_0_reg_177 <= b_assign_mux_fu_787_p3;
    end else if((((tmp_14_fu_703_p2 == Const_46) & (grp_fu_215_p2 == Const_47) & (tmp_fu_349_p2 == Const_48) & (Const_49 == ap_CS_fsm_state1) & (ap_start == Const_50) | (tmp_24_fu_419_p2 == Const_51) & (grp_fu_215_p2 == Const_52) & (tmp_34_fu_355_p3 == Const_53) & (tmp_fu_349_p2 == Const_54) & (Const_55 == ap_CS_fsm_state1) & (ap_start == Const_56)) ^ working_key[187]) == 1'b1) begin
      p_0_reg_177 <= a;
    end else if(((grp_fu_215_p2 == Const_57) & (tmp_28_fu_497_p2 == Const_58) & (tmp_24_fu_419_p2 == Const_59) & (tmp_34_fu_355_p3 == Const_60) & (tmp_fu_349_p2 == Const_61) & (Const_62 == ap_CS_fsm_state1) & (ap_start == Const_63) ^ working_key[186]) == 1'b0) begin
      p_0_reg_177 <= a_assign_5_fu_511_p3;
    end else if(((tmp_16_fu_519_p2 == Const_64) & (tmp_26_fu_603_p2 == Const_65) & (tmp_20_fu_525_p2 == Const_66) & (tmp_34_fu_355_p3 == Const_67) & (tmp_fu_349_p2 == Const_68) & (Const_69 == ap_CS_fsm_state1) & (ap_start == Const_70) ^ working_key[185]) == 1'b0) begin
      p_0_reg_177 <= a_assign_4_fu_617_p3;
    end else if(((grp_fu_215_p2 == Const_71) & (tmp_19_fu_781_p2 == Const_72) & (tmp_14_fu_703_p2 == Const_73) & (tmp_fu_349_p2 == Const_74) & (Const_75 == ap_CS_fsm_state1) & (ap_start == Const_76) ^ working_key[184]) == 1'b1) begin
      p_0_reg_177 <= a_assign_3_fu_795_p3;
    end else if(((grp_fu_220_p2 == Const_77) & (grp_fu_215_p2 == Const_78) & (tmp_34_fu_355_p3 == Const_79) & (tmp_fu_349_p2 == Const_80) & (Const_81 == ap_CS_fsm_state1) & (ap_start == Const_82) ^ working_key[183]) == 1'b0) begin
      p_0_reg_177 <= tmp_29_i_fu_403_p4;
    end else if(((tmp_16_fu_519_p2 == Const_83) & (tmp_20_fu_525_p2 == Const_84) & (tmp_34_fu_355_p3 == Const_85) & (tmp_fu_349_p2 == Const_86) & (Const_87 == ap_CS_fsm_state1) & (ap_start == Const_88) ^ working_key[182]) == 1'b1) begin
      p_0_reg_177 <= tmp_30_i_fu_633_p2;
    end else if((Const_89 == ap_CS_fsm_state8) & ((tmp_16_reg_1202 == Const_90) & (tmp_34_reg_1164 == Const_91) & (tmp_reg_1160 == Const_92) | (tmp_s_reg_1227 == Const_93) & (tmp_reg_1160 == Const_94) | (tmp_25_reg_1172 == Const_95) & (tmp_17_reg_1168 == Const_96) & (tmp_34_reg_1164 == Const_97) & (tmp_reg_1160 == Const_98))) begin
      p_0_reg_177 <= tmp_31_reg_1319;
    end 
  end

  assign Const_99 = (1'd0 ^ working_key[191]);
  assign Const_100 = (1'd1 ^ working_key[192]);
  assign Const_101 = (1'd1 ^ working_key[193]);
  assign Const_102 = (1'd1 ^ working_key[194]);
  assign Const_103 = (1'd1 ^ working_key[195]);
  assign Const_104 = (1'd0 ^ working_key[196]);
  assign Const_105 = (1'd0 ^ working_key[197]);

  always @(posedge ap_clk) begin
    if(((Const_99 == ap_CS_fsm_state5) ^ working_key[198]) == 1'b1) begin
      zExp_2_reg_157 <= zExp_0_s_fu_1095_p3;
    end else if((grp_fu_220_p2 == Const_100) & (grp_fu_215_p2 == Const_101) & (tmp_34_fu_355_p3 == Const_102) & (tmp_fu_349_p2 == Const_103) & (Const_104 == ap_CS_fsm_state1) & (ap_start == Const_105)) begin
      zExp_2_reg_157 <= aExp_cast_fu_285_p1;
    end 
  end

  assign Const_106 = (1'd0 ^ working_key[199]);
  assign Const_107 = (1'd1 ^ working_key[200]);

  always @(posedge ap_clk) begin
    if(((Const_106 == ap_CS_fsm_state3) ^ working_key[201]) == 1'b0) begin
      zExp_3_reg_148 <= bExp_reg_1133;
    end else if(Const_107 == ap_CS_fsm_state4) begin
      zExp_3_reg_148 <= aExp_reg_1122;
    end 
  end

  assign Const_108 = (1'd1 ^ working_key[202]);
  assign Const_109 = (1'd1 ^ working_key[203]);
  assign Const_110 = (1'd0 ^ working_key[204]);
  assign Const_111 = (1'd0 ^ working_key[205]);
  assign Const_112 = (1'd1 ^ working_key[206]);
  assign Const_113 = (1'd1 ^ working_key[207]);
  assign Const_114 = (1'd0 ^ working_key[208]);

  always @(posedge ap_clk) begin
    if(((Const_108 == ap_CS_fsm_state5) ^ working_key[209]) == 1'b1) begin
      zSig_1_reg_167 <= p_s_fu_1103_p3;
    end else if((grp_fu_220_p2 == Const_109) & (grp_fu_215_p2 == Const_110) & (tmp_34_fu_355_p3 == Const_111) & (tmp_fu_349_p2 == Const_112) & (Const_113 == ap_CS_fsm_state1) & (ap_start == Const_114)) begin
      zSig_1_reg_167 <= zSig_fu_377_p2;
    end 
  end

  assign Const_115 = (1'd0 ^ working_key[210]);
  assign Const_116 = (1'd1 ^ working_key[211]);
  assign a_temp_17 = a >> 1'd52;
  assign a_temp_18 = a_temp_17 & 11'd2047;
  assign aSig_cast2_cast_fu_325_p1_temp_19 = aSig_cast2_cast_fu_325_p1 & 61'd2305843009213693440;
  assign aSig_cast2_cast_reg_1149_temp_20 = aSig_cast2_cast_reg_1149 & 61'd2305843009213694463;
  assign aSig_cast2_cast_fu_325_p1_temp_19_temp_21 = aSig_cast2_cast_fu_325_p1_temp_19 | aSig_cast2_cast_reg_1149_temp_20;
  assign b_temp_22 = b >> 1'd52;
  assign b_temp_23 = b_temp_22 & 11'd2047;
  assign bSig_cast1_cast_fu_345_p1_temp_24 = bSig_cast1_cast_fu_345_p1 & 61'd2305843009213693440;
  assign bSig_cast1_cast_reg_1155_temp_25 = bSig_cast1_cast_reg_1155 & 61'd2305843009213694463;
  assign bSig_cast1_cast_fu_345_p1_temp_24_temp_26 = bSig_cast1_cast_fu_345_p1_temp_24 | bSig_cast1_cast_reg_1155_temp_25;

  always @(posedge ap_clk) begin
    if((Const_115 == ap_CS_fsm_state1) & (ap_start == Const_116)) begin
      aExp_reg_1122 <= a_temp_18;
      aSig_cast2_cast_reg_1149 <= aSig_cast2_cast_fu_325_p1_temp_19_temp_21;
      bExp_reg_1133 <= b_temp_23;
      bSig_cast1_cast_reg_1155 <= bSig_cast1_cast_fu_345_p1_temp_24_temp_26;
      expDiff_reg_1138 <= expDiff_fu_303_p2;
      tmp_27_reg_1144 <= tmp_27_fu_313_p1;
      tmp_reg_1160 <= tmp_fu_349_p2;
    end 
  end

  assign Const_117 = (1'd0 ^ working_key[212]);
  assign aSig_2_fu_817_p3_temp_27 = aSig_2_fu_817_p3 & 61'd4611686018427387392;
  assign aSig_2_reg_1271_temp_28 = aSig_2_reg_1271 & 61'd511;
  assign aSig_2_fu_817_p3_temp_27_temp_29 = aSig_2_fu_817_p3_temp_27 | aSig_2_reg_1271_temp_28;

  always @(posedge ap_clk) begin
    if(Const_117 == ap_CS_fsm_state2) begin
      aSig_2_reg_1271 <= aSig_2_fu_817_p3_temp_27_temp_29;
      count_assign_1_reg_1278 <= count_assign_1_fu_839_p2;
      icmp8_reg_1289 <= icmp8_fu_861_p2;
      tmp_2_i1_reg_1294 <= tmp_2_i1_fu_877_p2;
      tmp_i7_reg_1283 <= tmp_i7_fu_845_p2;
    end 
  end

  assign Const_118 = (1'd0 ^ working_key[213]);
  assign Const_119 = (1'd0 ^ working_key[214]);
  assign Const_120 = (1'd1 ^ working_key[215]);
  assign Const_121 = (1'd0 ^ working_key[216]);
  assign bSig_2_fu_661_p3_temp_30 = bSig_2_fu_661_p3 & 61'd4611686018427387392;
  assign bSig_2_reg_1231_temp_31 = bSig_2_reg_1231 & 61'd511;
  assign bSig_2_fu_661_p3_temp_30_temp_32 = bSig_2_fu_661_p3_temp_30 | bSig_2_reg_1231_temp_31;

  always @(posedge ap_clk) begin
    if((grp_fu_215_p2 == Const_118) & (tmp_fu_349_p2 == Const_119) & (Const_120 == ap_CS_fsm_state1) & (ap_start == Const_121)) begin
      bSig_2_reg_1231 <= bSig_2_fu_661_p3_temp_30_temp_32;
      expDiff_2_reg_1239 <= expDiff_2_fu_669_p3;
      icmp_reg_1245 <= icmp_fu_691_p2;
      tmp_8_i_reg_1250 <= tmp_8_i_fu_697_p2;
    end 
  end

  assign Const_122 = (1'd1 ^ working_key[217]);
  assign Const_123 = (1'd1 ^ working_key[218]);
  assign Const_124 = (1'd1 ^ working_key[219]);
  assign Const_125 = (1'd0 ^ working_key[220]);

  always @(posedge ap_clk) begin
    if((tmp_34_fu_355_p3 == Const_122) & (tmp_fu_349_p2 == Const_123) & (Const_124 == ap_CS_fsm_state1) & (ap_start == Const_125)) begin
      tmp_16_reg_1202 <= tmp_16_fu_519_p2;
    end 
  end

  assign Const_126 = (1'd0 ^ working_key[221]);
  assign Const_127 = (1'd1 ^ working_key[222]);
  assign Const_128 = (1'd1 ^ working_key[223]);
  assign Const_129 = (1'd0 ^ working_key[224]);

  always @(posedge ap_clk) begin
    if((tmp_34_fu_355_p3 == Const_126) & (tmp_fu_349_p2 == Const_127) & (Const_128 == ap_CS_fsm_state1) & (ap_start == Const_129)) begin
      tmp_17_reg_1168 <= grp_fu_215_p2;
    end 
  end

  assign Const_130 = (1'd0 ^ working_key[225]);
  assign Const_131 = (1'd0 ^ working_key[226]);
  assign Const_132 = (1'd0 ^ working_key[227]);
  assign Const_133 = (1'd1 ^ working_key[228]);
  assign Const_134 = (1'd1 ^ working_key[229]);

  always @(posedge ap_clk) begin
    if((grp_fu_215_p2 == Const_130) & (tmp_34_fu_355_p3 == Const_131) & (tmp_fu_349_p2 == Const_132) & (Const_133 == ap_CS_fsm_state1) & (ap_start == Const_134)) begin
      tmp_25_reg_1172 <= grp_fu_220_p2;
    end 
  end

  assign Const_135 = (1'd0 ^ working_key[230]);
  assign Const_136 = (1'd1 ^ working_key[231]);

  always @(posedge ap_clk) begin
    if((Const_135 == ap_CS_fsm_state7) & (grp_roundAndPackFloat64_fu_204_ap_done == Const_136)) begin
      tmp_31_reg_1319 <= grp_roundAndPackFloat64_fu_204_ap_return;
    end 
  end

  assign Const_137 = (1'd1 ^ working_key[232]);
  assign Const_138 = (1'd1 ^ working_key[233]);
  assign Const_139 = (1'd0 ^ working_key[234]);

  always @(posedge ap_clk) begin
    if((tmp_fu_349_p2 == Const_137) & (Const_138 == ap_CS_fsm_state1) & (ap_start == Const_139)) begin
      tmp_34_reg_1164 <= expDiff_fu_303_p2[32'd11];
    end 
  end

  assign Const_140 = (1'd1 ^ working_key[235]);
  assign Const_141 = (1'd0 ^ working_key[236]);
  assign Const_142 = (1'd1 ^ working_key[237]);

  always @(posedge ap_clk) begin
    if((tmp_fu_349_p2 == Const_140) & (Const_141 == ap_CS_fsm_state1) & (ap_start == Const_142)) begin
      tmp_s_reg_1227 <= grp_fu_215_p2;
    end 
  end

  assign Const_143 = (1'd0 ^ working_key[238]);
  assign Const_144 = (1'd0 ^ working_key[239]);
  assign Const_145 = (1'd0 ^ working_key[240]);
  assign Const_146 = (1'd1 ^ working_key[241]);
  assign Const_147 = (1'd1 ^ working_key[242]);

  always @(*) begin
    if((((Const_143 == ap_CS_fsm_state8) | (ap_start == Const_144) & (Const_145 == ap_CS_fsm_state1)) ^ working_key[243]) == 1'b1) begin
      ap_done = Const_146;
    end else if((((Const_143 == ap_CS_fsm_state8) | (ap_start == Const_144) & (Const_145 == ap_CS_fsm_state1)) ^ working_key[243]) == 1'b0) begin
      ap_done = Const_147;
    end 
  end

  assign Const_148 = (1'd1 ^ working_key[244]);
  assign Const_149 = (1'd1 ^ working_key[245]);
  assign Const_150 = (1'd0 ^ working_key[246]);
  assign Const_151 = (1'd0 ^ working_key[247]);

  always @(*) begin
    if(((ap_start == Const_148) & (Const_149 == ap_CS_fsm_state1) ^ working_key[248]) == 1'b1) begin
      ap_idle = Const_151;
    end else if(((ap_start == Const_148) & (Const_149 == ap_CS_fsm_state1) ^ working_key[248]) == 1'b0) begin
      ap_idle = Const_150;
    end 
  end

  assign Const_152 = (1'd1 ^ working_key[249]);
  assign Const_153 = (1'd1 ^ working_key[250]);
  assign Const_154 = (1'd1 ^ working_key[251]);
  assign Const_155 = (1'd0 ^ working_key[252]);
  assign Const_156 = (1'd1 ^ working_key[253]);
  assign Const_157 = (1'd0 ^ working_key[254]);
  assign Const_158 = (1'd0 ^ working_key[255]);
  assign Const_159 = (1'd1 ^ working_key[256]);
  assign Const_160 = (1'd1 ^ working_key[257]);
  assign Const_161 = (1'd1 ^ working_key[258]);

  always @(*) begin
    if(((Const_152 == ap_CS_fsm_state8) & ((tmp_16_reg_1202 == Const_153) & (tmp_34_reg_1164 == Const_154) & (tmp_reg_1160 == Const_155) | (tmp_s_reg_1227 == Const_156) & (tmp_reg_1160 == Const_157) | (tmp_25_reg_1172 == Const_158) & (tmp_17_reg_1168 == Const_159) & (tmp_34_reg_1164 == Const_160) & (tmp_reg_1160 == Const_161)) ^ working_key[259]) == 1'b1) begin
      ap_phi_mux_p_0_phi_fu_180_p22 = p_0_reg_177;
    end else if(((Const_152 == ap_CS_fsm_state8) & ((tmp_16_reg_1202 == Const_153) & (tmp_34_reg_1164 == Const_154) & (tmp_reg_1160 == Const_155) | (tmp_s_reg_1227 == Const_156) & (tmp_reg_1160 == Const_157) | (tmp_25_reg_1172 == Const_158) & (tmp_17_reg_1168 == Const_159) & (tmp_34_reg_1164 == Const_160) & (tmp_reg_1160 == Const_161)) ^ working_key[259]) == 1'b0) begin
      ap_phi_mux_p_0_phi_fu_180_p22 = tmp_31_reg_1319;
    end 
  end

  assign Const_162 = (1'd1 ^ working_key[260]);
  assign Const_163 = (1'd0 ^ working_key[261]);
  assign Const_164 = (1'd0 ^ working_key[262]);

  always @(*) begin
    if(((Const_162 == ap_CS_fsm_state8) ^ working_key[263]) == 1'b1) begin
      ap_ready = Const_164;
    end else if(((Const_162 == ap_CS_fsm_state8) ^ working_key[263]) == 1'b0) begin
      ap_ready = Const_163;
    end 
  end

  assign Const_165 = (1'd0 ^ working_key[264]);

  always @(*) begin
    if(((Const_165 == ap_CS_fsm_state8) ^ working_key[265]) == 1'b1) begin
      ap_return = ap_phi_mux_p_0_phi_fu_180_p22;
    end else if(((Const_165 == ap_CS_fsm_state8) ^ working_key[265]) == 1'b0) begin
      ap_return = ap_return_preg;
    end 
  end

  assign Const_166 = (1'd0 ^ working_key[266]);
  assign Const_167 = (1'd1 ^ working_key[267]);

  always @(*) begin
    if(((Const_166 == ap_CS_fsm_state2) ^ working_key[269]) == 1'b1) begin
      grp_fu_220_p0 = aExp_reg_1122;
    end else if(((Const_167 == ap_CS_fsm_state1) ^ working_key[268]) == 1'b1) begin
      grp_fu_220_p0 = 'bx;
    end else if(((Const_167 == ap_CS_fsm_state1) ^ working_key[268]) == 1'b0) begin
      grp_fu_220_p0 = { { a[62:52] } };
    end 
  end

  assign Const_168 = (1'd0 ^ working_key[270]);
  assign Const_169 = (1'd0 ^ working_key[271]);
  assign Const_170 = (1'd1 ^ working_key[272]);
  assign Const_171 = (1'd1 ^ working_key[273]);
  assign Const_172 = (1'd1 ^ working_key[274]);
  assign Const_173 = (1'd1 ^ working_key[275]);
  assign Const_174 = (1'd1 ^ working_key[276]);
  assign Const_175 = (1'd1 ^ working_key[277]);
  assign Const_176 = (1'd0 ^ working_key[278]);
  assign Const_177 = (1'd1 ^ working_key[279]);
  assign Const_178 = (1'd0 ^ working_key[280]);
  assign Const_179 = (1'd0 ^ working_key[281]);
  assign Const_180 = (1'd1 ^ working_key[282]);
  assign Const_181 = (1'd1 ^ working_key[283]);
  assign Const_182 = (1'd0 ^ working_key[284]);
  assign Const_183 = (1'd0 ^ working_key[285]);
  assign Const_184 = (1'd0 ^ working_key[286]);
  assign Const_185 = (1'd1 ^ working_key[287]);
  assign Const_186 = (1'd1 ^ working_key[288]);
  assign Const_187 = (1'd1 ^ working_key[289]);
  assign Const_188 = (1'd1 ^ working_key[290]);
  assign Const_189 = (1'd0 ^ working_key[291]);
  assign Const_190 = (1'd1 ^ working_key[292]);
  assign Const_191 = (1'd0 ^ working_key[293]);
  assign Const_192 = (1'd1 ^ working_key[294]);
  assign Const_193 = (1'd0 ^ working_key[295]);
  assign Const_194 = (1'd0 ^ working_key[296]);
  assign Const_195 = (1'd0 ^ working_key[297]);
  assign Const_196 = (1'd1 ^ working_key[302]);
  assign Const_197 = (1'd1 ^ working_key[303]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((grp_fu_215_p2 == Const_168) & (tmp_fu_349_p2 == Const_169) & (Const_170 == ap_CS_fsm_state1) & (ap_start == Const_171) ^ working_key[301]) == 1'b0) begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end else if(((tmp_16_fu_519_p2 == Const_172) & (tmp_34_fu_355_p3 == Const_173) & (tmp_fu_349_p2 == Const_174) & (Const_175 == ap_CS_fsm_state1) & (ap_start == Const_176) ^ working_key[300]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else if(((Const_177 == ap_CS_fsm_state1) & (ap_start == Const_178) & ((grp_fu_215_p2 == Const_179) & (tmp_fu_349_p2 == Const_180) | (tmp_16_fu_519_p2 == Const_181) & (tmp_34_fu_355_p3 == Const_182) & (tmp_fu_349_p2 == Const_183) | (grp_fu_220_p2 == Const_184) & (tmp_34_fu_355_p3 == Const_185) & (tmp_fu_349_p2 == Const_186) | (grp_fu_215_p2 == Const_187) & (tmp_34_fu_355_p3 == Const_188) & (tmp_fu_349_p2 == Const_189)) ^ working_key[299]) == 1'b0) begin
          ap_NS_fsm = ap_ST_fsm_state8;
        end else if(((grp_fu_220_p2 == Const_190) & (grp_fu_215_p2 == Const_191) & (tmp_34_fu_355_p3 == Const_192) & (tmp_fu_349_p2 == Const_193) & (Const_194 == ap_CS_fsm_state1) & (ap_start == Const_195) ^ working_key[298]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state6;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        ap_NS_fsm = ap_ST_fsm_state3;
      end
      ap_ST_fsm_state3: begin
        ap_NS_fsm = ap_ST_fsm_state5;
      end
      ap_ST_fsm_state4: begin
        ap_NS_fsm = ap_ST_fsm_state5;
      end
      ap_ST_fsm_state5: begin
        ap_NS_fsm = ap_ST_fsm_state6;
      end
      ap_ST_fsm_state6: begin
        ap_NS_fsm = ap_ST_fsm_state7;
      end
      ap_ST_fsm_state7: begin
        if(((Const_196 == ap_CS_fsm_state7) & (grp_roundAndPackFloat64_fu_204_ap_done == Const_197) ^ working_key[304]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state7;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state8;
        end
      end
      ap_ST_fsm_state8: begin
        ap_NS_fsm = ap_ST_fsm_state1;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign aExp_cast_fu_285_p1 = aExp_fu_273_p4;
  assign a_temp_33 = a >> 1'd52;
  assign a_temp_34 = a_temp_33 & 11'd2047;
  assign aExp_fu_273_p4 = a_temp_34;
  assign tmp_27_reg_1144_temp_35 = 1'd1 << 1'd51;
  assign tmp_27_reg_1144_temp_36 = tmp_27_reg_1144_temp_35 | tmp_27_reg_1144;
  assign tmp_27_reg_1144_temp_37 = tmp_27_reg_1144_temp_36 << 1'd9;
  assign aSig_1_fu_808_p4 = tmp_27_reg_1144_temp_37;
  assign aSig_2_cast_fu_824_p1 = aSig_2_fu_817_p3;
  assign Const_198 = (1'd1 ^ working_key[305]);
  assign temp__temp_38 = temp__temp_39 ^ working_key[307];
  assign temp__temp_39 = (working_key[306] == 1'b1)? temp__temp_40 : temp__temp_43;
  assign temp__temp_40 = temp__temp_42 > Const_198;
  assign temp__temp_42 = grp_fu_220_p2 & 1'd1;
  assign temp__temp_43 = temp__temp_45 === Const_198;
  assign temp__temp_45 = grp_fu_220_p2 & 1'd1;
  assign aSig_2_fu_817_p3 = (temp__temp_38 == 1'b1)? aSig_1_fu_808_p4 : aSig_cast2_cast_reg_1149;
  assign aSig_4_cast_fu_1059_p1 = aSig_4_fu_1053_p2;
  assign Const_199 = (62'd3842719838290836074 ^ working_key[369:308]);
  assign temp__temp_46 = Const_199 | aSig_s_reg_139;
  assign temp__temp_47 = Const_199 & aSig_s_reg_139;
  assign temp__temp_48 = working_key[370];
  assign aSig_4_fu_1053_p2 = (temp__temp_48 == 1'b1)? temp__temp_46 : temp__temp_47;
  assign aSig_cast2_cast_fu_325_p1 = aSig_fu_317_p3;
  assign tmp_27_fu_313_p1_temp_49 = tmp_27_fu_313_p1 << 1'd9;
  assign aSig_fu_317_p3 = tmp_27_fu_313_p1_temp_49;
  assign Const_200 = (1'd1 ^ working_key[371]);
  assign temp__temp_50 = temp__temp_51 ^ working_key[373];
  assign temp__temp_51 = (working_key[372] == 1'b1)? temp__temp_52 : temp__temp_55;
  assign temp__temp_52 = temp__temp_54 === Const_200;
  assign temp__temp_54 = tmp_i1_fu_745_p2 & 1'd1;
  assign temp__temp_55 = temp__temp_57 > Const_200;
  assign temp__temp_57 = tmp_i1_fu_745_p2 & 1'd1;
  assign a_assign_3_fu_795_p3 = (temp__temp_50 == 1'b1)? grp_fu_251_p2 : grp_fu_245_p2;
  assign Const_201 = (1'd0 ^ working_key[374]);
  assign temp__temp_58 = temp__temp_59 ^ working_key[376];
  assign temp__temp_59 = (working_key[375] == 1'b1)? temp__temp_60 : temp__temp_63;
  assign temp__temp_60 = temp__temp_62 > Const_201;
  assign temp__temp_62 = tmp_i3_fu_567_p2 & 1'd1;
  assign temp__temp_63 = temp__temp_65 === Const_201;
  assign temp__temp_65 = tmp_i3_fu_567_p2 & 1'd1;
  assign a_assign_4_fu_617_p3 = (temp__temp_58 == 1'b1)? grp_fu_245_p2 : grp_fu_251_p2;
  assign Const_202 = (1'd1 ^ working_key[377]);
  assign temp__temp_66 = temp__temp_67 ^ working_key[379];
  assign temp__temp_67 = (working_key[378] == 1'b1)? temp__temp_68 : temp__temp_71;
  assign temp__temp_68 = temp__temp_70 === Const_202;
  assign temp__temp_70 = tmp_i4_fu_461_p2 & 1'd1;
  assign temp__temp_71 = temp__temp_73 > Const_202;
  assign temp__temp_73 = tmp_i4_fu_461_p2 & 1'd1;
  assign a_assign_5_fu_511_p3 = (temp__temp_66 == 1'b1)? grp_fu_251_p2 : grp_fu_245_p2;
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
  assign bExp_cast_fu_299_p1 = bExp_fu_289_p4;
  assign b_temp_74 = b >> 1'd52;
  assign b_temp_75 = b_temp_74 & 11'd2047;
  assign bExp_fu_289_p4 = b_temp_75;
  assign tmp_32_fu_329_p1_temp_76 = 1'd1 << 1'd51;
  assign tmp_32_fu_329_p1_temp_77 = tmp_32_fu_329_p1_temp_76 | tmp_32_fu_329_p1;
  assign tmp_32_fu_329_p1_temp_78 = tmp_32_fu_329_p1_temp_77 << 1'd9;
  assign bSig_1_fu_651_p4 = tmp_32_fu_329_p1_temp_78;
  assign bSig_2_cast_fu_951_p1 = bSig_2_reg_1231;
  assign Const_203 = (1'd1 ^ working_key[380]);
  assign temp__temp_79 = temp__temp_80 ^ working_key[382];
  assign temp__temp_80 = (working_key[381] == 1'b1)? temp__temp_81 : temp__temp_84;
  assign temp__temp_81 = temp__temp_83 === Const_203;
  assign temp__temp_83 = tmp_15_fu_639_p2 & 1'd1;
  assign temp__temp_84 = temp__temp_86 > Const_203;
  assign temp__temp_86 = tmp_15_fu_639_p2 & 1'd1;
  assign bSig_2_fu_661_p3 = (temp__temp_79 == 1'b1)? bSig_1_fu_651_p4 : bSig_cast1_cast_fu_345_p1;
  assign bSig_cast1_cast_fu_345_p1 = bSig_fu_333_p3;
  assign bSig_cast1_fu_341_p1 = bSig_fu_333_p3;
  assign bSig_cast_fu_1045_p1 = bSig_s_reg_130;
  assign tmp_32_fu_329_p1_temp_87 = tmp_32_fu_329_p1 << 1'd9;
  assign bSig_fu_333_p3 = tmp_32_fu_329_p1_temp_87;
  assign Const_204 = (1'd1 ^ working_key[383]);
  assign temp__temp_88 = temp__temp_89 ^ working_key[385];
  assign temp__temp_89 = (working_key[384] == 1'b1)? temp__temp_90 : temp__temp_93;
  assign temp__temp_90 = temp__temp_92 > Const_204;
  assign temp__temp_92 = tmp_25_i3_fu_597_p2 & 1'd1;
  assign temp__temp_93 = temp__temp_95 === Const_204;
  assign temp__temp_95 = tmp_25_i3_fu_597_p2 & 1'd1;
  assign b_assign_1_mux_fu_609_p3 = (temp__temp_88 == 1'b1)? grp_fu_245_p2 : grp_fu_251_p2;
  assign Const_205 = (1'd1 ^ working_key[386]);
  assign temp__temp_96 = temp__temp_97 ^ working_key[388];
  assign temp__temp_97 = (working_key[387] == 1'b1)? temp__temp_98 : temp__temp_101;
  assign temp__temp_98 = temp__temp_100 === Const_205;
  assign temp__temp_100 = tmp_25_i5_fu_491_p2 & 1'd1;
  assign temp__temp_101 = temp__temp_103 > Const_205;
  assign temp__temp_103 = tmp_25_i5_fu_491_p2 & 1'd1;
  assign b_assign_2_mux_fu_503_p3 = (temp__temp_96 == 1'b1)? grp_fu_251_p2 : grp_fu_245_p2;
  assign Const_206 = (1'd0 ^ working_key[389]);
  assign temp__temp_104 = temp__temp_105 ^ working_key[391];
  assign temp__temp_105 = (working_key[390] == 1'b1)? temp__temp_106 : temp__temp_109;
  assign temp__temp_106 = temp__temp_108 > Const_206;
  assign temp__temp_108 = tmp_25_i1_fu_775_p2 & 1'd1;
  assign temp__temp_109 = temp__temp_111 === Const_206;
  assign temp__temp_111 = tmp_25_i1_fu_775_p2 & 1'd1;
  assign b_assign_mux_fu_787_p3 = (temp__temp_104 == 1'b1)? grp_fu_245_p2 : grp_fu_251_p2;
  assign Const_207 = (12'd1173 ^ working_key[403:392]);
  assign temp__temp_112 = Const_207 - expDiff_1_fu_828_p3;
  assign temp__temp_113 = Const_207 + expDiff_1_fu_828_p3;
  assign temp__temp_114 = working_key[404];
  assign count_assign_1_fu_839_p2 = (temp__temp_114 == 1'b1)? temp__temp_112 : temp__temp_113;
  assign Const_208 = (1'd1 ^ working_key[405]);
  assign temp__temp_115 = temp__temp_116 ^ working_key[407];
  assign temp__temp_116 = (working_key[406] == 1'b1)? temp__temp_117 : temp__temp_120;
  assign temp__temp_117 = temp__temp_119 === Const_208;
  assign temp__temp_119 = grp_fu_220_p2 & 1'd1;
  assign temp__temp_120 = temp__temp_122 > Const_208;
  assign temp__temp_122 = grp_fu_220_p2 & 1'd1;
  assign expDiff_1_fu_828_p3 = (temp__temp_115 == 1'b1)? expDiff_3_fu_803_p2 : expDiff_reg_1138;
  assign Const_209 = (11'd556 ^ working_key[418:408]);
  assign temp__temp_123 = Const_209 - tmp_22_fu_309_p1;
  assign temp__temp_124 = Const_209 + tmp_22_fu_309_p1;
  assign temp__temp_125 = working_key[419];
  assign expDiff_2_cast_fu_645_p2 = (temp__temp_125 == 1'b1)? temp__temp_123 : temp__temp_124;
  assign Const_210 = (1'd0 ^ working_key[420]);
  assign temp__temp_126 = temp__temp_127 ^ working_key[422];
  assign temp__temp_127 = (working_key[421] == 1'b1)? temp__temp_128 : temp__temp_131;
  assign temp__temp_128 = temp__temp_130 > Const_210;
  assign temp__temp_130 = tmp_15_fu_639_p2 & 1'd1;
  assign temp__temp_131 = temp__temp_133 === Const_210;
  assign temp__temp_133 = tmp_15_fu_639_p2 & 1'd1;
  assign expDiff_2_fu_669_p3 = (temp__temp_126 == 1'b1)? tmp_22_fu_309_p1 : expDiff_2_cast_fu_645_p2;
  assign Const_211 = (12'd599 ^ working_key[434:423]);
  assign temp__temp_134 = Const_211 + expDiff_reg_1138;
  assign temp__temp_135 = Const_211 - expDiff_reg_1138;
  assign temp__temp_136 = working_key[435];
  assign expDiff_3_fu_803_p2 = (temp__temp_136 == 1'b1)? temp__temp_134 : temp__temp_135;
  assign temp__temp_137 = aExp_cast_fu_285_p1 + bExp_cast_fu_299_p1;
  assign temp__temp_138 = aExp_cast_fu_285_p1 - bExp_cast_fu_299_p1;
  assign temp__temp_139 = working_key[436];
  assign expDiff_fu_303_p2 = (temp__temp_139 == 1'b1)? temp__temp_137 : temp__temp_138;
  assign Const_212 = (11'd714 ^ working_key[447:437]);
  assign Const_213 = (1'd0 ^ working_key[449]);
  assign Const_214 = (1'd1 ^ working_key[450]);
  assign temp__temp_140 = temp__temp_141 ^ working_key[451];
  assign temp__temp_141 = (working_key[448] == 1'b1)? temp__temp_142 : temp__temp_143;
  assign temp__temp_142 = aExp_fu_273_p4 == Const_212;
  assign temp__temp_143 = aExp_fu_273_p4 > Const_212;
  assign grp_fu_215_p2 = (temp__temp_140 == 1'b1)? Const_214 : Const_213;
  assign Const_215 = (11'd1195 ^ working_key[462:452]);
  assign Const_216 = (1'd0 ^ working_key[464]);
  assign Const_217 = (1'd0 ^ working_key[465]);
  assign temp__temp_144 = temp__temp_145 ^ working_key[466];
  assign temp__temp_145 = (working_key[463] == 1'b1)? temp__temp_146 : temp__temp_147;
  assign temp__temp_146 = grp_fu_220_p0 > Const_215;
  assign temp__temp_147 = grp_fu_220_p0 == Const_215;
  assign grp_fu_220_p2 = (temp__temp_144 == 1'b1)? Const_217 : Const_216;
  assign a_temp_148 = a >> 1'd51;
  assign a_temp_149 = a_temp_148 & 12'd4095;
  assign grp_fu_225_p4 = a_temp_149;
  assign b_temp_150 = b >> 1'd51;
  assign b_temp_151 = b_temp_150 & 12'd4095;
  assign grp_fu_235_p4 = b_temp_151;
  assign Const_218 = (64'd3123225084356471466 ^ working_key[530:467]);
  assign temp__temp_152 = Const_218 | a;
  assign temp__temp_153 = Const_218 & a;
  assign temp__temp_154 = working_key[531];
  assign grp_fu_245_p2 = (temp__temp_154 == 1'b1)? temp__temp_152 : temp__temp_153;
  assign Const_219 = (64'd5383955125051446100 ^ working_key[595:532]);
  assign temp__temp_155 = b | Const_219;
  assign temp__temp_156 = b & Const_219;
  assign temp__temp_157 = working_key[596];
  assign grp_fu_251_p2 = (temp__temp_157 == 1'b1)? temp__temp_155 : temp__temp_156;
  assign Const_220 = (32'd2862656186 ^ working_key[628:597]);
  assign temp__temp_158 = float_exception_flag & Const_220;
  assign temp__temp_159 = float_exception_flag | Const_220;
  assign temp__temp_160 = working_key[629];
  assign grp_fu_261_p2 = (temp__temp_160 == 1'b1)? temp__temp_158 : temp__temp_159;
  assign grp_roundAndPackFloat64_fu_204_ap_start = grp_roundAndPackFloat64_fu_204_ap_start_reg;
  assign Const_221 = (6'd20 ^ working_key[635:630]);
  assign Const_222 = (1'd1 ^ working_key[637]);
  assign Const_223 = (1'd1 ^ working_key[638]);
  assign temp__temp_161 = temp__temp_162 ^ working_key[639];
  assign temp__temp_162 = (working_key[636] == 1'b1)? temp__temp_163 : temp__temp_164;
  assign temp__temp_163 = tmp_48_fu_851_p4 < Const_221;
  assign temp__temp_164 = tmp_48_fu_851_p4 > Const_221;
  assign icmp8_fu_861_p2 = (temp__temp_161 == 1'b1)? Const_222 : Const_223;
  assign Const_224 = (5'd6 ^ working_key[644:640]);
  assign Const_225 = (1'd1 ^ working_key[646]);
  assign Const_226 = (1'd1 ^ working_key[647]);
  assign temp__temp_165 = temp__temp_166 ^ working_key[648];
  assign temp__temp_166 = (working_key[645] == 1'b1)? temp__temp_167 : temp__temp_168;
  assign temp__temp_167 = tmp_38_fu_681_p4 == Const_224;
  assign temp__temp_168 = tmp_38_fu_681_p4 > Const_224;
  assign icmp_fu_691_p2 = (temp__temp_165 == 1'b1)? Const_225 : Const_226;
  assign Const_227 = (1'd0 ^ working_key[649]);
  assign temp__temp_169 = temp__temp_170 ^ working_key[651];
  assign temp__temp_170 = (working_key[650] == 1'b1)? temp__temp_171 : temp__temp_174;
  assign temp__temp_171 = temp__temp_173 > Const_227;
  assign temp__temp_173 = tmp_53_fu_1087_p3 & 1'd1;
  assign temp__temp_174 = temp__temp_176 === Const_227;
  assign temp__temp_176 = tmp_53_fu_1087_p3 & 1'd1;
  assign p_s_fu_1103_p3 = (temp__temp_169 == 1'b1)? zSig_3_fu_1073_p3 : zSig_2_cast_fu_1069_p1;
  assign temp__temp_177 = sel_tmp_i1_fu_927_p2 & icmp8_reg_1289;
  assign temp__temp_178 = sel_tmp_i1_fu_927_p2 | icmp8_reg_1289;
  assign temp__temp_179 = working_key[652];
  assign sel_tmp1_i1_fu_932_p2 = (temp__temp_179 == 1'b1)? temp__temp_177 : temp__temp_178;
  assign temp__temp_180 = sel_tmp_i_fu_1019_p2 | icmp_reg_1245;
  assign temp__temp_181 = sel_tmp_i_fu_1019_p2 & icmp_reg_1245;
  assign temp__temp_182 = working_key[653];
  assign sel_tmp1_i_fu_1025_p2 = (temp__temp_182 == 1'b1)? temp__temp_180 : temp__temp_181;
  assign Const_228 = (1'd0 ^ working_key[654]);
  assign temp__temp_183 = tmp_i7_reg_1283 | Const_228;
  assign temp__temp_184 = tmp_i7_reg_1283 ^ Const_228;
  assign temp__temp_185 = working_key[655];
  assign sel_tmp_i1_fu_927_p2 = (temp__temp_185 == 1'b1)? temp__temp_183 : temp__temp_184;
  assign Const_229 = (1'd0 ^ working_key[656]);
  assign temp__temp_186 = tmp_i_fu_954_p2 | Const_229;
  assign temp__temp_187 = tmp_i_fu_954_p2 ^ Const_229;
  assign temp__temp_188 = working_key[657];
  assign sel_tmp_i_fu_1019_p2 = (temp__temp_188 == 1'b1)? temp__temp_186 : temp__temp_187;
  assign temp__temp_189 = tmp_49_fu_891_p1 & tmp_2_i1_reg_1294;
  assign temp__temp_190 = tmp_49_fu_891_p1 | tmp_2_i1_reg_1294;
  assign temp__temp_191 = working_key[658];
  assign tmp_10_i1_fu_895_p2 = (temp__temp_191 == 1'b1)? temp__temp_189 : temp__temp_190;
  assign temp__temp_192 = tmp_40_fu_982_p1 | tmp_2_i_fu_976_p2;
  assign temp__temp_193 = tmp_40_fu_982_p1 & tmp_2_i_fu_976_p2;
  assign temp__temp_194 = working_key[659];
  assign tmp_10_i_fu_986_p2 = (temp__temp_194 == 1'b1)? temp__temp_192 : temp__temp_193;
  assign Const_230 = (61'd774520906437743444 ^ working_key[720:660]);
  assign Const_231 = (1'd0 ^ working_key[722]);
  assign Const_232 = (1'd0 ^ working_key[723]);
  assign temp__temp_195 = temp__temp_196 ^ working_key[724];
  assign temp__temp_196 = (working_key[721] == 1'b1)? temp__temp_197 : temp__temp_198;
  assign temp__temp_197 = aSig_fu_317_p3 > Const_230;
  assign temp__temp_198 = aSig_fu_317_p3 == Const_230;
  assign tmp_14_fu_703_p2 = (temp__temp_195 == 1'b1)? Const_232 : Const_231;
  assign Const_233 = (11'd682 ^ working_key[735:725]);
  assign Const_234 = (1'd1 ^ working_key[737]);
  assign Const_235 = (1'd1 ^ working_key[738]);
  assign temp__temp_199 = temp__temp_200 ^ working_key[739];
  assign temp__temp_200 = (working_key[736] == 1'b1)? temp__temp_201 : temp__temp_202;
  assign temp__temp_201 = bExp_fu_289_p4 == Const_233;
  assign temp__temp_202 = bExp_fu_289_p4 > Const_233;
  assign tmp_15_fu_639_p2 = (temp__temp_199 == 1'b1)? Const_234 : Const_235;
  assign Const_236 = (11'd702 ^ working_key[750:740]);
  assign Const_237 = (1'd0 ^ working_key[752]);
  assign Const_238 = (1'd0 ^ working_key[753]);
  assign temp__temp_203 = temp__temp_204 ^ working_key[754];
  assign temp__temp_204 = (working_key[751] == 1'b1)? temp__temp_205 : temp__temp_206;
  assign temp__temp_205 = bExp_fu_289_p4 > Const_236;
  assign temp__temp_206 = bExp_fu_289_p4 == Const_236;
  assign tmp_16_fu_519_p2 = (temp__temp_203 == 1'b1)? Const_238 : Const_237;
  assign temp__temp_207 = tmp_25_i_fu_733_p2 & tmp_25_i1_fu_775_p2;
  assign temp__temp_208 = tmp_25_i_fu_733_p2 | tmp_25_i1_fu_775_p2;
  assign temp__temp_209 = working_key[755];
  assign tmp_19_fu_781_p2 = (temp__temp_209 == 1'b1)? temp__temp_207 : temp__temp_208;
  assign temp__temp_210 = aSig_2_cast_fu_824_p1 << tmp_i7_15_fu_867_p1;
  assign temp__temp_211 = aSig_2_cast_fu_824_p1 >> tmp_i7_15_fu_867_p1;
  assign temp__temp_212 = working_key[756];
  assign tmp_1_i1_fu_871_p2 = (temp__temp_212 == 1'b1)? temp__temp_210 : temp__temp_211;
  assign temp__temp_213 = bSig_2_cast_fu_951_p1 >> tmp_i_11_fu_967_p1;
  assign temp__temp_214 = bSig_2_cast_fu_951_p1 << tmp_i_11_fu_967_p1;
  assign temp__temp_215 = working_key[757];
  assign tmp_1_i_fu_970_p2 = (temp__temp_215 == 1'b1)? temp__temp_213 : temp__temp_214;
  assign Const_239 = (61'd780658569223330133 ^ working_key[818:758]);
  assign Const_240 = (1'd0 ^ working_key[820]);
  assign Const_241 = (1'd0 ^ working_key[821]);
  assign temp__temp_216 = temp__temp_217 ^ working_key[822];
  assign temp__temp_217 = (working_key[819] == 1'b1)? temp__temp_218 : temp__temp_219;
  assign temp__temp_218 = bSig_fu_333_p3 > Const_239;
  assign temp__temp_219 = bSig_fu_333_p3 == Const_239;
  assign tmp_20_fu_525_p2 = (temp__temp_216 == 1'b1)? Const_240 : Const_241;
  assign tmp_22_fu_309_p1 = (expDiff_fu_303_p2 & 11'd2047);
  assign temp__temp_220 = bSig_fu_333_p3 | aSig_fu_317_p3;
  assign temp__temp_221 = bSig_fu_333_p3 & aSig_fu_317_p3;
  assign temp__temp_222 = working_key[823];
  assign tmp_23_fu_413_p2 = (temp__temp_222 == 1'b1)? temp__temp_220 : temp__temp_221;
  assign Const_242 = (61'd1536876829077142122 ^ working_key[884:824]);
  assign Const_243 = (1'd0 ^ working_key[886]);
  assign Const_244 = (1'd0 ^ working_key[887]);
  assign temp__temp_223 = temp__temp_224 ^ working_key[888];
  assign temp__temp_224 = (working_key[885] == 1'b1)? temp__temp_225 : temp__temp_226;
  assign temp__temp_225 = tmp_23_fu_413_p2 > Const_242;
  assign temp__temp_226 = tmp_23_fu_413_p2 == Const_242;
  assign tmp_24_fu_419_p2 = (temp__temp_223 == 1'b1)? Const_244 : Const_243;
  assign Const_245 = (51'd754929164440362 ^ working_key[939:889]);
  assign Const_246 = (1'd0 ^ working_key[941]);
  assign Const_247 = (1'd0 ^ working_key[942]);
  assign temp__temp_227 = temp__temp_228 ^ working_key[943];
  assign temp__temp_228 = (working_key[940] == 1'b1)? temp__temp_229 : temp__temp_230;
  assign temp__temp_229 = tmp_46_fu_765_p1 != Const_245;
  assign temp__temp_230 = tmp_46_fu_765_p1 == Const_245;
  assign tmp_24_i1_fu_769_p2 = (temp__temp_227 == 1'b1)? Const_247 : Const_246;
  assign Const_248 = (51'd1501197034482322 ^ working_key[994:944]);
  assign Const_249 = (1'd0 ^ working_key[996]);
  assign Const_250 = (1'd0 ^ working_key[997]);
  assign temp__temp_231 = temp__temp_232 ^ working_key[998];
  assign temp__temp_232 = (working_key[995] == 1'b1)? temp__temp_233 : temp__temp_234;
  assign temp__temp_233 = tmp_50_fu_545_p1 == Const_248;
  assign temp__temp_234 = tmp_50_fu_545_p1 != Const_248;
  assign tmp_24_i2_fu_549_p2 = (temp__temp_231 == 1'b1)? Const_249 : Const_250;
  assign Const_251 = (51'd1874853295205032 ^ working_key[1049:999]);
  assign Const_252 = (1'd1 ^ working_key[1051]);
  assign Const_253 = (1'd1 ^ working_key[1052]);
  assign temp__temp_235 = temp__temp_236 ^ working_key[1053];
  assign temp__temp_236 = (working_key[1050] == 1'b1)? temp__temp_237 : temp__temp_238;
  assign temp__temp_237 = tmp_52_fu_587_p1 == Const_251;
  assign temp__temp_238 = tmp_52_fu_587_p1 != Const_251;
  assign tmp_24_i3_fu_591_p2 = (temp__temp_235 == 1'b1)? Const_252 : Const_253;
  assign Const_254 = (51'd1454647888096599 ^ working_key[1104:1054]);
  assign Const_255 = (1'd0 ^ working_key[1106]);
  assign Const_256 = (1'd0 ^ working_key[1107]);
  assign temp__temp_239 = temp__temp_240 ^ working_key[1108];
  assign temp__temp_240 = (working_key[1105] == 1'b1)? temp__temp_241 : temp__temp_242;
  assign temp__temp_241 = tmp_54_fu_439_p1 == Const_254;
  assign temp__temp_242 = tmp_54_fu_439_p1 != Const_254;
  assign tmp_24_i4_fu_443_p2 = (temp__temp_239 == 1'b1)? Const_256 : Const_255;
  assign Const_257 = (51'd1498817600555690 ^ working_key[1159:1109]);
  assign Const_258 = (1'd1 ^ working_key[1161]);
  assign Const_259 = (1'd1 ^ working_key[1162]);
  assign temp__temp_243 = temp__temp_244 ^ working_key[1163];
  assign temp__temp_244 = (working_key[1160] == 1'b1)? temp__temp_245 : temp__temp_246;
  assign temp__temp_245 = tmp_56_fu_481_p1 != Const_257;
  assign temp__temp_246 = tmp_56_fu_481_p1 == Const_257;
  assign tmp_24_i5_fu_485_p2 = (temp__temp_243 == 1'b1)? Const_258 : Const_259;
  assign Const_260 = (51'd680128293975369 ^ working_key[1214:1164]);
  assign Const_261 = (1'd0 ^ working_key[1216]);
  assign Const_262 = (1'd1 ^ working_key[1217]);
  assign temp__temp_247 = temp__temp_248 ^ working_key[1218];
  assign temp__temp_248 = (working_key[1215] == 1'b1)? temp__temp_249 : temp__temp_250;
  assign temp__temp_249 = tmp_42_fu_723_p1 != Const_260;
  assign temp__temp_250 = tmp_42_fu_723_p1 == Const_260;
  assign tmp_24_i_fu_727_p2 = (temp__temp_247 == 1'b1)? Const_262 : Const_261;
  assign temp__temp_251 = tmp_i6_fu_759_p2 & tmp_24_i1_fu_769_p2;
  assign temp__temp_252 = tmp_i6_fu_759_p2 | tmp_24_i1_fu_769_p2;
  assign temp__temp_253 = working_key[1219];
  assign tmp_25_i1_fu_775_p2 = (temp__temp_253 == 1'b1)? temp__temp_251 : temp__temp_252;
  assign temp__temp_254 = tmp_i8_fu_539_p2 & tmp_24_i2_fu_549_p2;
  assign temp__temp_255 = tmp_i8_fu_539_p2 | tmp_24_i2_fu_549_p2;
  assign temp__temp_256 = working_key[1220];
  assign tmp_25_i2_fu_555_p2 = (temp__temp_256 == 1'b1)? temp__temp_254 : temp__temp_255;
  assign temp__temp_257 = tmp_i9_13_fu_581_p2 & tmp_24_i3_fu_591_p2;
  assign temp__temp_258 = tmp_i9_13_fu_581_p2 | tmp_24_i3_fu_591_p2;
  assign temp__temp_259 = working_key[1221];
  assign tmp_25_i3_fu_597_p2 = (temp__temp_259 == 1'b1)? temp__temp_257 : temp__temp_258;
  assign temp__temp_260 = tmp_i10_fu_433_p2 | tmp_24_i4_fu_443_p2;
  assign temp__temp_261 = tmp_i10_fu_433_p2 & tmp_24_i4_fu_443_p2;
  assign temp__temp_262 = working_key[1222];
  assign tmp_25_i4_fu_449_p2 = (temp__temp_262 == 1'b1)? temp__temp_260 : temp__temp_261;
  assign temp__temp_263 = tmp_i11_fu_475_p2 & tmp_24_i5_fu_485_p2;
  assign temp__temp_264 = tmp_i11_fu_475_p2 | tmp_24_i5_fu_485_p2;
  assign temp__temp_265 = working_key[1223];
  assign tmp_25_i5_fu_491_p2 = (temp__temp_265 == 1'b1)? temp__temp_263 : temp__temp_264;
  assign temp__temp_266 = tmp_i5_fu_717_p2 | tmp_24_i_fu_727_p2;
  assign temp__temp_267 = tmp_i5_fu_717_p2 & tmp_24_i_fu_727_p2;
  assign temp__temp_268 = working_key[1224];
  assign tmp_25_i_fu_733_p2 = (temp__temp_268 == 1'b1)? temp__temp_266 : temp__temp_267;
  assign temp__temp_269 = tmp_25_i3_fu_597_p2 | tmp_25_i2_fu_555_p2;
  assign temp__temp_270 = tmp_25_i3_fu_597_p2 & tmp_25_i2_fu_555_p2;
  assign temp__temp_271 = working_key[1225];
  assign tmp_26_fu_603_p2 = (temp__temp_271 == 1'b1)? temp__temp_269 : temp__temp_270;
  assign tmp_27_fu_313_p1 = (a & 52'd4503599627370495);
  assign temp__temp_272 = tmp_25_i5_fu_491_p2 & tmp_25_i4_fu_449_p2;
  assign temp__temp_273 = tmp_25_i5_fu_491_p2 | tmp_25_i4_fu_449_p2;
  assign temp__temp_274 = working_key[1226];
  assign tmp_28_fu_497_p2 = (temp__temp_274 == 1'b1)? temp__temp_272 : temp__temp_273;
  assign temp__temp_275 = aSig_cast2_cast_fu_325_p1 + bSig_cast1_cast_fu_345_p1;
  assign temp__temp_276 = aSig_cast2_cast_fu_325_p1 - bSig_cast1_cast_fu_345_p1;
  assign temp__temp_277 = working_key[1227];
  assign tmp_29_fu_383_p2 = (temp__temp_277 == 1'b1)? temp__temp_275 : temp__temp_276;
  assign zSign_temp_278 = zSign << 1'd1;
  assign zSign_temp_278 << 1'd62 = 1'd62;
  assign zSign_temp_279 = zSign_temp_278 << 1'd62 | tmp_43_fu_399_p1;
  assign tmp_29_i_fu_403_p4 = zSign_temp_279;
  assign Const_263 = (64'd6554520132655600980 ^ working_key[1291:1228]);
  assign Const_264 = (1'd1 ^ working_key[1293]);
  assign Const_265 = (1'd0 ^ working_key[1294]);
  assign temp__temp_280 = temp__temp_281 ^ working_key[1295];
  assign temp__temp_281 = (working_key[1292] == 1'b1)? temp__temp_282 : temp__temp_283;
  assign temp__temp_282 = tmp_1_i1_fu_871_p2 != Const_263;
  assign temp__temp_283 = tmp_1_i1_fu_871_p2 == Const_263;
  assign tmp_2_i1_fu_877_p2 = (temp__temp_280 == 1'b1)? Const_265 : Const_264;
  assign Const_266 = (64'd5386206924865131348 ^ working_key[1359:1296]);
  assign Const_267 = (1'd1 ^ working_key[1361]);
  assign Const_268 = (1'd1 ^ working_key[1362]);
  assign temp__temp_284 = temp__temp_285 ^ working_key[1363];
  assign temp__temp_285 = (working_key[1360] == 1'b1)? temp__temp_286 : temp__temp_287;
  assign temp__temp_286 = tmp_1_i_fu_970_p2 != Const_266;
  assign temp__temp_287 = tmp_1_i_fu_970_p2 == Const_266;
  assign tmp_2_i_fu_976_p2 = (temp__temp_284 == 1'b1)? Const_267 : Const_268;
  assign Const_269 = (64'd3939143709522924885 ^ working_key[1427:1364]);
  assign temp__temp_288 = tmp_i2_14_fu_625_p3 | Const_269;
  assign temp__temp_289 = tmp_i2_14_fu_625_p3 & Const_269;
  assign temp__temp_290 = working_key[1428];
  assign tmp_30_i_fu_633_p2 = (temp__temp_290 == 1'b1)? temp__temp_288 : temp__temp_289;
  assign tmp_32_fu_329_p1 = (b & 52'd4503599627370495);
  assign tmp_34_fu_355_p3 = expDiff_fu_303_p2[32'd11];
  assign tmp_36_fu_677_p1 = (expDiff_2_fu_669_p3 & 6'd63);
  assign expDiff_2_fu_669_p3_temp_291 = expDiff_2_fu_669_p3 >> 1'd6;
  assign expDiff_2_fu_669_p3_temp_292 = expDiff_2_fu_669_p3_temp_291 & 5'd31;
  assign tmp_38_fu_681_p4 = expDiff_2_fu_669_p3_temp_292;
  assign tmp_7_i_fu_962_p2_temp_293 = tmp_7_i_fu_962_p2 >> 1'd1;
  assign tmp_7_i_fu_962_p2_temp_294 = tmp_7_i_fu_962_p2_temp_293 & 61'd2305843009213693951;
  assign tmp_3_fu_992_p4 = tmp_7_i_fu_962_p2_temp_294;
  assign tmp_40_fu_982_p1 = (tmp_7_i_fu_962_p2 & 1'd1);
  assign tmp_42_fu_723_p1 = (a & 51'd2251799813685247);
  assign tmp_43_fu_399_p1 = zSig_assign_fu_389_p4;
  assign Const_270 = (64'd12273994764773928603 ^ working_key[1492:1429]);
  assign temp__temp_295 = b >> Const_270;
  assign temp__temp_296 = b << Const_270;
  assign temp__temp_297 = working_key[1493];
  assign tmp_45_fu_739_p2 = (temp__temp_297 == 1'b1)? temp__temp_295 : temp__temp_296;
  assign tmp_46_fu_765_p1 = (b & 51'd2251799813685247);
  assign tmp_47_cast_fu_373_p1 = tmp_30_fu_363_p4;
  assign tmp_47_fu_835_p1 = (expDiff_1_fu_828_p3 & 6'd63);
  assign count_assign_1_fu_839_p2_temp_298 = count_assign_1_fu_839_p2 >> 1'd6;
  assign count_assign_1_fu_839_p2_temp_299 = count_assign_1_fu_839_p2_temp_298 & 6'd63;
  assign tmp_48_fu_851_p4 = count_assign_1_fu_839_p2_temp_299;
  assign tmp_49_fu_891_p1 = (tmp_7_i1_fu_886_p2 & 1'd1);
  assign tmp_3_fu_992_p4_temp_300 = tmp_3_fu_992_p4 << 1'd1;
  assign tmp_3_fu_992_p4_temp_301 = tmp_3_fu_992_p4_temp_300 | tmp_10_i_fu_986_p2;
  assign tmp_4_fu_1002_p3 = tmp_3_fu_992_p4_temp_301;
  assign Const_271 = (62'd1321451989759231317 ^ working_key[1555:1494]);
  assign Const_272 = (1'd1 ^ working_key[1557]);
  assign Const_273 = (1'd1 ^ working_key[1558]);
  assign temp__temp_302 = temp__temp_303 ^ working_key[1559];
  assign temp__temp_303 = (working_key[1556] == 1'b1)? temp__temp_304 : temp__temp_305;
  assign temp__temp_304 = aSig_2_reg_1271 != Const_271;
  assign temp__temp_305 = aSig_2_reg_1271 == Const_271;
  assign tmp_4_i1_fu_918_p2 = (temp__temp_302 == 1'b1)? Const_272 : Const_273;
  assign Const_274 = (62'd1534249345596741075 ^ working_key[1621:1560]);
  assign Const_275 = (1'd1 ^ working_key[1623]);
  assign Const_276 = (1'd1 ^ working_key[1624]);
  assign temp__temp_306 = temp__temp_307 ^ working_key[1625];
  assign temp__temp_307 = (working_key[1622] == 1'b1)? temp__temp_308 : temp__temp_309;
  assign temp__temp_308 = bSig_2_reg_1231 != Const_274;
  assign temp__temp_309 = bSig_2_reg_1231 == Const_274;
  assign tmp_4_i_fu_1010_p2 = (temp__temp_306 == 1'b1)? Const_275 : Const_276;
  assign tmp_50_fu_545_p1 = (a & 51'd2251799813685247);
  assign Const_277 = (64'd15358799311011139668 ^ working_key[1689:1626]);
  assign temp__temp_310 = b >> Const_277;
  assign temp__temp_311 = b << Const_277;
  assign temp__temp_312 = working_key[1690];
  assign tmp_51_fu_561_p2 = (temp__temp_312 == 1'b1)? temp__temp_310 : temp__temp_311;
  assign tmp_52_fu_587_p1 = (b & 51'd2251799813685247);
  assign tmp_53_fu_1087_p3 = zSig_2_fu_1063_p2[32'd62];
  assign tmp_54_fu_439_p1 = (a & 51'd2251799813685247);
  assign Const_278 = (64'd12297456966571485883 ^ working_key[1754:1691]);
  assign temp__temp_313 = b >> Const_278;
  assign temp__temp_314 = b << Const_278;
  assign temp__temp_315 = working_key[1755];
  assign tmp_55_fu_455_p2 = (temp__temp_315 == 1'b1)? temp__temp_313 : temp__temp_314;
  assign tmp_56_fu_481_p1 = (b & 51'd2251799813685247);
  assign tmp_7_i1_fu_886_p2_temp_316 = tmp_7_i1_fu_886_p2 >> 1'd1;
  assign tmp_7_i1_fu_886_p2_temp_317 = tmp_7_i1_fu_886_p2_temp_316 & 61'd2305843009213693951;
  assign tmp_5_fu_900_p4 = tmp_7_i1_fu_886_p2_temp_317;
  assign tmp_5_fu_900_p4_temp_318 = tmp_5_fu_900_p4 << 1'd1;
  assign tmp_5_fu_900_p4_temp_319 = tmp_5_fu_900_p4_temp_318 | tmp_10_i1_fu_895_p2;
  assign tmp_6_fu_910_p3 = tmp_5_fu_900_p4_temp_319;
  assign tmp_6_i33_cast_fu_883_p1 = count_assign_1_reg_1278;
  assign tmp_6_i_cast_fu_959_p1 = expDiff_2_reg_1239;
  assign temp__temp_320 = aSig_2_reg_1271 >> tmp_6_i33_cast_fu_883_p1;
  assign temp__temp_321 = aSig_2_reg_1271 << tmp_6_i33_cast_fu_883_p1;
  assign temp__temp_322 = working_key[1756];
  assign tmp_7_i1_fu_886_p2 = (temp__temp_322 == 1'b1)? temp__temp_320 : temp__temp_321;
  assign temp__temp_323 = bSig_2_reg_1231 << tmp_6_i_cast_fu_959_p1;
  assign temp__temp_324 = bSig_2_reg_1231 >> tmp_6_i_cast_fu_959_p1;
  assign temp__temp_325 = working_key[1757];
  assign tmp_7_i_fu_962_p2 = (temp__temp_325 == 1'b1)? temp__temp_323 : temp__temp_324;
  assign Const_279 = (6'd5 ^ working_key[1763:1758]);
  assign temp__temp_326 = Const_279 + tmp_36_fu_677_p1;
  assign temp__temp_327 = Const_279 - tmp_36_fu_677_p1;
  assign temp__temp_328 = working_key[1764];
  assign tmp_8_i_fu_697_p2 = (temp__temp_328 == 1'b1)? temp__temp_326 : temp__temp_327;
  assign Const_280 = (12'd2730 ^ working_key[1776:1765]);
  assign Const_281 = (1'd0 ^ working_key[1778]);
  assign Const_282 = (1'd0 ^ working_key[1779]);
  assign temp__temp_329 = temp__temp_330 ^ working_key[1780];
  assign temp__temp_330 = (working_key[1777] == 1'b1)? temp__temp_331 : temp__temp_332;
  assign temp__temp_331 = expDiff_fu_303_p2 > Const_280;
  assign temp__temp_332 = expDiff_fu_303_p2 > Const_280;
  assign tmp_fu_349_p2 = (temp__temp_329 == 1'b1)? Const_282 : Const_281;
  assign Const_283 = (63'd3939152803299949354 ^ working_key[1843:1781]);
  assign Const_284 = (1'd0 ^ working_key[1845]);
  assign Const_285 = (1'd0 ^ working_key[1846]);
  assign temp__temp_333 = temp__temp_334 ^ working_key[1847];
  assign temp__temp_334 = (working_key[1844] == 1'b1)? temp__temp_335 : temp__temp_336;
  assign temp__temp_335 = tmp_i8_16_fu_425_p3 > Const_283;
  assign temp__temp_336 = tmp_i8_16_fu_425_p3 == Const_283;
  assign tmp_i10_fu_433_p2 = (temp__temp_333 == 1'b1)? Const_285 : Const_284;
  assign Const_286 = (63'd3072934155509219238 ^ working_key[1910:1848]);
  assign Const_287 = (1'd0 ^ working_key[1912]);
  assign Const_288 = (1'd0 ^ working_key[1913]);
  assign temp__temp_337 = temp__temp_338 ^ working_key[1914];
  assign temp__temp_338 = (working_key[1911] == 1'b1)? temp__temp_339 : temp__temp_340;
  assign temp__temp_339 = tmp_i1_17_fu_467_p3 > Const_286;
  assign temp__temp_340 = tmp_i1_17_fu_467_p3 == Const_286;
  assign tmp_i11_fu_475_p2 = (temp__temp_337 == 1'b1)? Const_288 : Const_287;
  assign grp_fu_235_p4_temp_341 = grp_fu_235_p4 << 1'd51;
  assign tmp_i1_17_fu_467_p3 = grp_fu_235_p4_temp_341;
  assign Const_289 = (64'd3081986868889433420 ^ working_key[1978:1915]);
  assign Const_290 = (1'd1 ^ working_key[1980]);
  assign Const_291 = (1'd1 ^ working_key[1981]);
  assign temp__temp_342 = temp__temp_343 ^ working_key[1982];
  assign temp__temp_343 = (working_key[1979] == 1'b1)? temp__temp_344 : temp__temp_345;
  assign temp__temp_344 = tmp_45_fu_739_p2 > Const_289;
  assign temp__temp_345 = tmp_45_fu_739_p2 > Const_289;
  assign tmp_i1_fu_745_p2 = (temp__temp_342 == 1'b1)? Const_290 : Const_291;
  assign zSign_temp_346 = zSign << 1'd63;
  assign tmp_i2_14_fu_625_p3 = zSign_temp_346;
  assign grp_fu_225_p4_temp_347 = grp_fu_225_p4 << 1'd51;
  assign tmp_i2_fu_531_p3 = grp_fu_225_p4_temp_347;
  assign Const_292 = (64'd3840069110472545663 ^ working_key[2046:1983]);
  assign Const_293 = (1'd0 ^ working_key[2048]);
  assign Const_294 = (1'd1 ^ working_key[2049]);
  assign temp__temp_348 = temp__temp_349 ^ working_key[2050];
  assign temp__temp_349 = (working_key[2047] == 1'b1)? temp__temp_350 : temp__temp_351;
  assign temp__temp_350 = tmp_51_fu_561_p2 > Const_292;
  assign temp__temp_351 = tmp_51_fu_561_p2 > Const_292;
  assign tmp_i3_fu_567_p2 = (temp__temp_348 == 1'b1)? Const_294 : Const_293;
  assign Const_295 = (64'd12876449579841170271 ^ working_key[2114:2051]);
  assign Const_296 = (1'd0 ^ working_key[2116]);
  assign Const_297 = (1'd1 ^ working_key[2117]);
  assign temp__temp_352 = temp__temp_353 ^ working_key[2118];
  assign temp__temp_353 = (working_key[2115] == 1'b1)? temp__temp_354 : temp__temp_355;
  assign temp__temp_354 = tmp_55_fu_455_p2 > Const_295;
  assign temp__temp_355 = tmp_55_fu_455_p2 > Const_295;
  assign tmp_i4_fu_461_p2 = (temp__temp_352 == 1'b1)? Const_297 : Const_296;
  assign grp_fu_235_p4_temp_356 = grp_fu_235_p4 << 1'd51;
  assign tmp_i5_10_fu_751_p3 = grp_fu_235_p4_temp_356;
  assign Const_298 = (63'd3700457683085338967 ^ working_key[2181:2119]);
  assign Const_299 = (1'd0 ^ working_key[2183]);
  assign Const_300 = (1'd0 ^ working_key[2184]);
  assign temp__temp_357 = temp__temp_358 ^ working_key[2185];
  assign temp__temp_358 = (working_key[2182] == 1'b1)? temp__temp_359 : temp__temp_360;
  assign temp__temp_359 = tmp_i9_fu_709_p3 > Const_298;
  assign temp__temp_360 = tmp_i9_fu_709_p3 == Const_298;
  assign tmp_i5_fu_717_p2 = (temp__temp_357 == 1'b1)? Const_300 : Const_299;
  assign grp_fu_235_p4_temp_361 = grp_fu_235_p4 << 1'd51;
  assign tmp_i6_12_fu_573_p3 = grp_fu_235_p4_temp_361;
  assign Const_301 = (63'd102075005970240086 ^ working_key[2248:2186]);
  assign Const_302 = (1'd1 ^ working_key[2250]);
  assign Const_303 = (1'd1 ^ working_key[2251]);
  assign temp__temp_362 = temp__temp_363 ^ working_key[2252];
  assign temp__temp_363 = (working_key[2249] == 1'b1)? temp__temp_364 : temp__temp_365;
  assign temp__temp_364 = tmp_i5_10_fu_751_p3 == Const_301;
  assign temp__temp_365 = tmp_i5_10_fu_751_p3 > Const_301;
  assign tmp_i6_fu_759_p2 = (temp__temp_362 == 1'b1)? Const_302 : Const_303;
  assign tmp_i7_15_fu_867_p1 = tmp_47_fu_835_p1;
  assign Const_304 = (12'd2725 ^ working_key[2264:2253]);
  assign Const_305 = (1'd0 ^ working_key[2266]);
  assign Const_306 = (1'd0 ^ working_key[2267]);
  assign temp__temp_366 = temp__temp_367 ^ working_key[2268];
  assign temp__temp_367 = (working_key[2265] == 1'b1)? temp__temp_368 : temp__temp_369;
  assign temp__temp_368 = expDiff_1_fu_828_p3 > Const_304;
  assign temp__temp_369 = expDiff_1_fu_828_p3 == Const_304;
  assign tmp_i7_fu_845_p2 = (temp__temp_366 == 1'b1)? Const_306 : Const_305;
  assign grp_fu_225_p4_temp_370 = grp_fu_225_p4 << 1'd51;
  assign tmp_i8_16_fu_425_p3 = grp_fu_225_p4_temp_370;
  assign Const_307 = (63'd6177487001259516074 ^ working_key[2331:2269]);
  assign Const_308 = (1'd0 ^ working_key[2333]);
  assign Const_309 = (1'd0 ^ working_key[2334]);
  assign temp__temp_371 = temp__temp_372 ^ working_key[2335];
  assign temp__temp_372 = (working_key[2332] == 1'b1)? temp__temp_373 : temp__temp_374;
  assign temp__temp_373 = tmp_i2_fu_531_p3 == Const_307;
  assign temp__temp_374 = tmp_i2_fu_531_p3 > Const_307;
  assign tmp_i8_fu_539_p2 = (temp__temp_371 == 1'b1)? Const_308 : Const_309;
  assign Const_310 = (63'd3072769937791694173 ^ working_key[2398:2336]);
  assign Const_311 = (1'd0 ^ working_key[2400]);
  assign Const_312 = (1'd0 ^ working_key[2401]);
  assign temp__temp_375 = temp__temp_376 ^ working_key[2402];
  assign temp__temp_376 = (working_key[2399] == 1'b1)? temp__temp_377 : temp__temp_378;
  assign temp__temp_377 = tmp_i6_12_fu_573_p3 > Const_310;
  assign temp__temp_378 = tmp_i6_12_fu_573_p3 == Const_310;
  assign tmp_i9_13_fu_581_p2 = (temp__temp_375 == 1'b1)? Const_312 : Const_311;
  assign grp_fu_225_p4_temp_379 = grp_fu_225_p4 << 1'd51;
  assign tmp_i9_fu_709_p3 = grp_fu_225_p4_temp_379;
  assign tmp_i_11_fu_967_p1 = tmp_8_i_reg_1250;
  assign Const_313 = (11'd642 ^ working_key[2413:2403]);
  assign Const_314 = (1'd1 ^ working_key[2415]);
  assign Const_315 = (1'd1 ^ working_key[2416]);
  assign temp__temp_380 = temp__temp_381 ^ working_key[2417];
  assign temp__temp_381 = (working_key[2414] == 1'b1)? temp__temp_382 : temp__temp_383;
  assign temp__temp_382 = expDiff_2_reg_1239 == Const_313;
  assign temp__temp_383 = expDiff_2_reg_1239 > Const_313;
  assign tmp_i_fu_954_p2 = (temp__temp_380 == 1'b1)? Const_314 : Const_315;
  assign Const_316 = (1'd0 ^ working_key[2418]);
  assign temp__temp_384 = temp__temp_385 ^ working_key[2420];
  assign temp__temp_385 = (working_key[2419] == 1'b1)? temp__temp_386 : temp__temp_389;
  assign temp__temp_386 = temp__temp_388 > Const_316;
  assign temp__temp_388 = tmp_53_fu_1087_p3 & 1'd1;
  assign temp__temp_389 = temp__temp_391 === Const_316;
  assign temp__temp_391 = tmp_53_fu_1087_p3 & 1'd1;
  assign zExp_0_s_fu_1095_p3 = (temp__temp_384 == 1'b1)? zExp_4_fu_1081_p2 : zExp_3_cast_fu_1049_p1;
  assign zExp_3_cast_fu_1049_p1 = zExp_3_reg_148;
  assign Const_317 = (12'd3413 ^ working_key[2432:2421]);
  assign temp__temp_392 = Const_317 + zExp_3_cast_fu_1049_p1;
  assign temp__temp_393 = Const_317 - zExp_3_cast_fu_1049_p1;
  assign temp__temp_394 = working_key[2433];
  assign zExp_4_fu_1081_p2 = (temp__temp_394 == 1'b1)? temp__temp_392 : temp__temp_393;
  assign zSig_2_cast_fu_1069_p1 = zSig_2_fu_1063_p2;
  assign temp__temp_395 = aSig_4_cast_fu_1059_p1 + bSig_cast_fu_1045_p1;
  assign temp__temp_396 = aSig_4_cast_fu_1059_p1 - bSig_cast_fu_1045_p1;
  assign temp__temp_397 = working_key[2434];
  assign zSig_2_fu_1063_p2 = (temp__temp_397 == 1'b1)? temp__temp_395 : temp__temp_396;
  assign zSig_2_fu_1063_p2_temp_398 = zSig_2_fu_1063_p2 << 1'd1;
  assign zSig_3_fu_1073_p3 = zSig_2_fu_1063_p2_temp_398;
  assign tmp_29_fu_383_p2_temp_399 = tmp_29_fu_383_p2 >> 1'd9;
  assign tmp_29_fu_383_p2_temp_400 = tmp_29_fu_383_p2_temp_399 & 53'd9007199254740991;
  assign zSig_assign_fu_389_p4 = tmp_29_fu_383_p2_temp_400;
  assign temp__temp_401 = bSig_cast1_fu_341_p1 - tmp_47_cast_fu_373_p1;
  assign temp__temp_402 = bSig_cast1_fu_341_p1 + tmp_47_cast_fu_373_p1;
  assign temp__temp_403 = working_key[2435];
  assign zSig_fu_377_p2 = (temp__temp_403 == 1'b1)? temp__temp_401 : temp__temp_402;
  assign z_1_cast_fu_1015_p1 = tmp_4_i_fu_1010_p2;
  assign Const_318 = (1'd1 ^ working_key[2436]);
  assign temp__temp_404 = temp__temp_405 ^ working_key[2438];
  assign temp__temp_405 = (working_key[2437] == 1'b1)? temp__temp_406 : temp__temp_409;
  assign temp__temp_406 = temp__temp_408 === Const_318;
  assign temp__temp_408 = sel_tmp1_i1_fu_932_p2 & 1'd1;
  assign temp__temp_409 = temp__temp_411 > Const_318;
  assign temp__temp_411 = sel_tmp1_i1_fu_932_p2 & 1'd1;
  assign z_2_fu_937_p3 = (temp__temp_404 == 1'b1)? tmp_6_fu_910_p3 : z_5_cast_fu_923_p1;
  assign Const_319 = (1'd0 ^ working_key[2439]);
  assign temp__temp_412 = temp__temp_413 ^ working_key[2441];
  assign temp__temp_413 = (working_key[2440] == 1'b1)? temp__temp_414 : temp__temp_417;
  assign temp__temp_414 = temp__temp_416 > Const_319;
  assign temp__temp_416 = tmp_i_fu_954_p2 & 1'd1;
  assign temp__temp_417 = temp__temp_419 === Const_319;
  assign temp__temp_419 = tmp_i_fu_954_p2 & 1'd1;
  assign z_4_fu_1038_p3 = (temp__temp_412 == 1'b1)? z_fu_1030_p3 : bSig_2_reg_1231;
  assign z_5_cast_fu_923_p1 = tmp_4_i1_fu_918_p2;
  assign Const_320 = (1'd1 ^ working_key[2442]);
  assign temp__temp_420 = temp__temp_421 ^ working_key[2444];
  assign temp__temp_421 = (working_key[2443] == 1'b1)? temp__temp_422 : temp__temp_425;
  assign temp__temp_422 = temp__temp_424 === Const_320;
  assign temp__temp_424 = tmp_i7_reg_1283 & 1'd1;
  assign temp__temp_425 = temp__temp_427 > Const_320;
  assign temp__temp_427 = tmp_i7_reg_1283 & 1'd1;
  assign z_5_fu_945_p3 = (temp__temp_420 == 1'b1)? z_2_fu_937_p3 : aSig_2_reg_1271;
  assign Const_321 = (1'd1 ^ working_key[2445]);
  assign temp__temp_428 = temp__temp_429 ^ working_key[2447];
  assign temp__temp_429 = (working_key[2446] == 1'b1)? temp__temp_430 : temp__temp_433;
  assign temp__temp_430 = temp__temp_432 === Const_321;
  assign temp__temp_432 = sel_tmp1_i_fu_1025_p2 & 1'd1;
  assign temp__temp_433 = temp__temp_435 > Const_321;
  assign temp__temp_435 = sel_tmp1_i_fu_1025_p2 & 1'd1;
  assign z_fu_1030_p3 = (temp__temp_428 == 1'b1)? tmp_4_fu_1002_p3 : z_1_cast_fu_1015_p1;

  always @(posedge ap_clk) begin
    aSig_cast2_cast_reg_1149 <= aSig_cast2_cast_reg_1149 & 9'd4611686018427387392;
    aSig_cast2_cast_reg_1149[61] <= aSig_cast2_cast_reg_1149 & 61'd2305843009213693951;
    bSig_cast1_cast_reg_1155 <= bSig_cast1_cast_reg_1155 & 9'd4611686018427387392;
    bSig_cast1_cast_reg_1155[61] <= bSig_cast1_cast_reg_1155 & 61'd2305843009213693951;
    bSig_2_reg_1231 <= bSig_2_reg_1231 & 9'd4611686018427387392;
    aSig_2_reg_1271 <= aSig_2_reg_1271 & 9'd4611686018427387392;
  end

  assign working_key = { locking_key[2447:0] };

endmodule


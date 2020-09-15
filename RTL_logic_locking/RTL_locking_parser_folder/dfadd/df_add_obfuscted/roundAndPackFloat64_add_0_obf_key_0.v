
module roundAndPackFloat64_add_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  zSign,
  zExp,
  zSig,
  float_exception_flag_i,
  float_exception_flag_o,
  float_exception_flag_o_ap_vld,
  ap_return,
  locking_key
);

  parameter ap_ST_fsm_state1 = 4'd1;
  parameter ap_ST_fsm_state2 = 4'd2;
  parameter ap_ST_fsm_state3 = 4'd4;
  parameter ap_ST_fsm_state4 = 4'd8;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [0:0] zSign;
  input [11:0] zExp;
  input [63:0] zSig;
  input [31:0] float_exception_flag_i;
  output [31:0] float_exception_flag_o;
  output float_exception_flag_o_ap_vld;
  output [63:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [31:0] float_exception_flag_o;
  reg float_exception_flag_o_ap_vld;
  reg [63:0] ap_return;
  reg [3:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [9:0] roundBits_fu_139_p1;
  wire [0:0] tmp_s_fu_143_p2;
  reg [0:0] tmp_s_reg_427;
  wire [0:0] tmp_1_fu_149_p2;
  reg [0:0] tmp_1_reg_431;
  wire [0:0] tmp_2_fu_155_p2;
  reg [0:0] tmp_2_reg_435;
  wire [0:0] tmp_7_fu_167_p3;
  reg [0:0] tmp_7_reg_439;
  wire [11:0] count_assign_fu_183_p2;
  reg [11:0] count_assign_reg_446;
  wire [0:0] tmp_15_fu_175_p3;
  wire [63:0] tmp_30_i9_fu_209_p2;
  wire [63:0] z_fu_261_p3;
  wire ap_CS_fsm_state2;
  wire [9:0] roundBits_2_fu_279_p3;
  wire [53:0] zSig_assign_2_fu_359_p2;
  reg [53:0] zSig_assign_2_reg_472;
  wire ap_CS_fsm_state3;
  reg [63:0] zSig_assign1_reg_90;
  reg [11:0] zExp_assign_1_reg_101;
  reg [9:0] roundBits_1_reg_115;
  reg [63:0] ap_phi_mux_p_0_phi_fu_129_p4;
  reg [63:0] p_0_reg_126;
  wire [63:0] tmp_30_i8_fu_394_p2;
  wire ap_CS_fsm_state4;
  wire [0:0] tmp_3_fu_287_p2;
  wire [0:0] tmp_5_fu_305_p2;
  wire [31:0] float_exception_flag_2_fu_189_p2;
  wire [31:0] float_exception_flag_4_fu_293_p2;
  wire [31:0] tmp_8_fu_311_p2;
  wire [63:0] tmp_4_fu_161_p2;
  wire [63:0] tmp_i_fu_201_p3;
  wire [63:0] tmp_6_i_fu_215_p1;
  wire [5:0] tmp_16_fu_223_p1;
  wire [63:0] tmp_i3_fu_226_p1;
  wire [63:0] tmp_1_i_fu_230_p2;
  wire [63:0] tmp_7_i_fu_218_p2;
  wire [0:0] tmp_17_fu_241_p1;
  wire [0:0] tmp_2_i_fu_235_p2;
  wire [62:0] tmp_11_i_fu_251_p4;
  wire [0:0] tmp_10_i_fu_245_p2;
  wire [8:0] tmp_fu_269_p4;
  wire [63:0] tmp_9_fu_323_p2;
  wire [0:0] tmp_6_fu_339_p2;
  wire [31:0] tmp_10_fu_345_p1;
  wire [31:0] tmp_11_fu_349_p2;
  wire [53:0] zSig_assign_1_cast_fu_329_p4;
  wire signed [53:0] tmp_21_cast_fu_355_p1;
  wire [0:0] tmp_12_fu_365_p2;
  wire [11:0] tmp_13_fu_370_p3;
  wire [63:0] tmp_28_i_fu_378_p3;
  wire [63:0] tmp_29_i_fu_386_p4;
  reg [63:0] ap_return_preg;
  reg [3:0] ap_NS_fsm;
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
  wire [11:0] Const_41;
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
  wire [11:0] Const_150;
  wire [31:0] Const_151;
  wire [31:0] Const_152;
  wire [31:0] Const_153;
  wire [53:0] Const_154;
  wire Const_155;
  wire Const_156;
  wire Const_157;
  wire [11:0] Const_158;
  wire [11:0] Const_159;
  wire Const_160;
  wire Const_161;
  wire [11:0] Const_162;
  wire Const_163;
  wire Const_164;
  wire [63:0] Const_165;
  wire Const_166;
  wire Const_167;
  wire [63:0] Const_168;
  wire [9:0] Const_169;
  wire Const_170;
  wire Const_171;
  wire [63:0] Const_172;
  wire [9:0] Const_173;
  wire Const_174;
  wire Const_175;
  input [3070:0] locking_key;
  wire [3070:0] working_key;

  initial begin
    #0 ap_CS_fsm = 4'd1;
    #0 ap_return_preg = 64'd0;
  end


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
      if(1'b1 == ap_CS_fsm_state4) begin
        ap_return_preg <= ap_phi_mux_p_0_phi_fu_129_p4;
      end 
    end
  end

  assign Const_0 = (1'd0 ^ working_key[2448]);
  assign Const_1 = (1'd0 ^ working_key[2449]);
  assign Const_2 = (1'd0 ^ working_key[2450]);
  assign Const_3 = (1'd1 ^ working_key[2451]);
  assign Const_4 = (1'd0 ^ working_key[2452]);
  assign Const_5 = (1'd0 ^ working_key[2453]);
  assign Const_6 = (1'd0 ^ working_key[2454]);
  assign Const_7 = (1'd1 ^ working_key[2455]);
  assign Const_8 = (1'd0 ^ working_key[2456]);
  assign Const_9 = (1'd1 ^ working_key[2457]);
  assign Const_10 = (1'd0 ^ working_key[2458]);
  assign Const_11 = (1'd1 ^ working_key[2459]);
  assign Const_12 = (1'd0 ^ working_key[2460]);

  always @(posedge ap_clk) begin
    if(((Const_0 == ap_CS_fsm_state4) & ((tmp_s_reg_427 == Const_1) | ((tmp_2_reg_435 == Const_2) & (tmp_1_reg_431 == Const_3) | (tmp_7_reg_439 == Const_4) & (tmp_1_reg_431 == Const_5))) ^ working_key[2461]) == 1'b0) begin
      p_0_reg_126 <= tmp_30_i8_fu_394_p2;
    end else if((ap_start == Const_6) & (Const_7 == ap_CS_fsm_state1) & ((tmp_1_fu_149_p2 == Const_8) & (tmp_s_fu_143_p2 == Const_9) | (tmp_7_fu_167_p3 == Const_10) & (tmp_2_fu_155_p2 == Const_11) & (tmp_s_fu_143_p2 == Const_12))) begin
      p_0_reg_126 <= tmp_30_i9_fu_209_p2;
    end 
  end

  assign Const_13 = (1'd1 ^ working_key[2462]);
  assign Const_14 = (1'd0 ^ working_key[2463]);
  assign Const_15 = (1'd0 ^ working_key[2464]);
  assign Const_16 = (1'd1 ^ working_key[2465]);
  assign Const_17 = (1'd0 ^ working_key[2466]);
  assign Const_18 = (1'd1 ^ working_key[2467]);
  assign Const_19 = (1'd1 ^ working_key[2468]);
  assign Const_20 = (1'd0 ^ working_key[2469]);
  assign Const_21 = (1'd0 ^ working_key[2470]);
  assign Const_22 = (1'd0 ^ working_key[2471]);
  assign Const_23 = (1'd1 ^ working_key[2472]);
  assign Const_24 = (1'd0 ^ working_key[2473]);
  assign Const_25 = (1'd0 ^ working_key[2474]);
  assign Const_26 = (1'd1 ^ working_key[2475]);

  always @(posedge ap_clk) begin
    if((((ap_start == Const_13) & (tmp_s_fu_143_p2 == Const_14) & (Const_15 == ap_CS_fsm_state1) | (ap_start == Const_16) & (Const_17 == ap_CS_fsm_state1) & ((tmp_15_fu_175_p3 == Const_18) & (tmp_2_fu_155_p2 == Const_19) & (tmp_1_fu_149_p2 == Const_20) & (tmp_s_fu_143_p2 == Const_21) | (tmp_15_fu_175_p3 == Const_22) & (tmp_7_fu_167_p3 == Const_23) & (tmp_1_fu_149_p2 == Const_24) & (tmp_s_fu_143_p2 == Const_25))) ^ working_key[2476]) == 1'b0) begin
      roundBits_1_reg_115 <= roundBits_fu_139_p1;
    end else if(Const_26 == ap_CS_fsm_state2) begin
      roundBits_1_reg_115 <= roundBits_2_fu_279_p3;
    end 
  end

  assign Const_27 = (1'd0 ^ working_key[2477]);
  assign Const_28 = (1'd0 ^ working_key[2478]);
  assign Const_29 = (1'd0 ^ working_key[2479]);
  assign Const_30 = (1'd1 ^ working_key[2480]);
  assign Const_31 = (1'd0 ^ working_key[2481]);
  assign Const_32 = (1'd0 ^ working_key[2482]);
  assign Const_33 = (1'd0 ^ working_key[2483]);
  assign Const_34 = (1'd1 ^ working_key[2484]);
  assign Const_35 = (1'd1 ^ working_key[2485]);
  assign Const_36 = (1'd0 ^ working_key[2486]);
  assign Const_37 = (1'd1 ^ working_key[2487]);
  assign Const_38 = (1'd0 ^ working_key[2488]);
  assign Const_39 = (1'd0 ^ working_key[2489]);
  assign Const_40 = (1'd1 ^ working_key[2490]);
  assign Const_41 = (12'd3917 ^ working_key[2502:2491]);

  always @(posedge ap_clk) begin
    if((((ap_start == Const_27) & (tmp_s_fu_143_p2 == Const_28) & (Const_29 == ap_CS_fsm_state1) | (ap_start == Const_30) & (Const_31 == ap_CS_fsm_state1) & ((tmp_15_fu_175_p3 == Const_32) & (tmp_2_fu_155_p2 == Const_33) & (tmp_1_fu_149_p2 == Const_34) & (tmp_s_fu_143_p2 == Const_35) | (tmp_15_fu_175_p3 == Const_36) & (tmp_7_fu_167_p3 == Const_37) & (tmp_1_fu_149_p2 == Const_38) & (tmp_s_fu_143_p2 == Const_39))) ^ working_key[2503]) == 1'b0) begin
      zExp_assign_1_reg_101 <= zExp;
    end else if(Const_40 == ap_CS_fsm_state2) begin
      zExp_assign_1_reg_101 <= Const_41;
    end 
  end

  assign Const_42 = (1'd0 ^ working_key[2504]);
  assign Const_43 = (1'd1 ^ working_key[2505]);
  assign Const_44 = (1'd1 ^ working_key[2506]);
  assign Const_45 = (1'd0 ^ working_key[2507]);
  assign Const_46 = (1'd1 ^ working_key[2508]);
  assign Const_47 = (1'd1 ^ working_key[2509]);
  assign Const_48 = (1'd0 ^ working_key[2510]);
  assign Const_49 = (1'd1 ^ working_key[2511]);
  assign Const_50 = (1'd1 ^ working_key[2512]);
  assign Const_51 = (1'd0 ^ working_key[2513]);
  assign Const_52 = (1'd1 ^ working_key[2514]);
  assign Const_53 = (1'd0 ^ working_key[2515]);
  assign Const_54 = (1'd0 ^ working_key[2516]);
  assign Const_55 = (1'd1 ^ working_key[2517]);

  always @(posedge ap_clk) begin
    if((((ap_start == Const_42) & (tmp_s_fu_143_p2 == Const_43) & (Const_44 == ap_CS_fsm_state1) | (ap_start == Const_45) & (Const_46 == ap_CS_fsm_state1) & ((tmp_15_fu_175_p3 == Const_47) & (tmp_2_fu_155_p2 == Const_48) & (tmp_1_fu_149_p2 == Const_49) & (tmp_s_fu_143_p2 == Const_50) | (tmp_15_fu_175_p3 == Const_51) & (tmp_7_fu_167_p3 == Const_52) & (tmp_1_fu_149_p2 == Const_53) & (tmp_s_fu_143_p2 == Const_54))) ^ working_key[2518]) == 1'b0) begin
      zSig_assign1_reg_90 <= zSig;
    end else if(Const_55 == ap_CS_fsm_state2) begin
      zSig_assign1_reg_90 <= z_fu_261_p3;
    end 
  end

  assign Const_56 = (1'd1 ^ working_key[2519]);
  assign Const_57 = (1'd0 ^ working_key[2520]);
  assign Const_58 = (1'd0 ^ working_key[2521]);
  assign Const_59 = (1'd0 ^ working_key[2522]);
  assign Const_60 = (1'd0 ^ working_key[2523]);
  assign Const_61 = (1'd0 ^ working_key[2524]);
  assign Const_62 = (1'd0 ^ working_key[2525]);
  assign Const_63 = (1'd0 ^ working_key[2526]);
  assign Const_64 = (1'd0 ^ working_key[2527]);
  assign Const_65 = (1'd0 ^ working_key[2528]);

  always @(posedge ap_clk) begin
    if((ap_start == Const_56) & (Const_57 == ap_CS_fsm_state1) & ((tmp_2_fu_155_p2 == Const_58) & (tmp_15_fu_175_p3 == Const_59) & (tmp_1_fu_149_p2 == Const_60) & (tmp_s_fu_143_p2 == Const_61) | (tmp_7_fu_167_p3 == Const_62) & (tmp_15_fu_175_p3 == Const_63) & (tmp_1_fu_149_p2 == Const_64) & (tmp_s_fu_143_p2 == Const_65))) begin
      count_assign_reg_446 <= count_assign_fu_183_p2;
    end 
  end

  assign Const_66 = (1'd1 ^ working_key[2529]);
  assign Const_67 = (1'd0 ^ working_key[2530]);
  assign Const_68 = (1'd1 ^ working_key[2531]);

  always @(posedge ap_clk) begin
    if((ap_start == Const_66) & (tmp_s_fu_143_p2 == Const_67) & (Const_68 == ap_CS_fsm_state1)) begin
      tmp_1_reg_431 <= tmp_1_fu_149_p2;
    end 
  end

  assign Const_69 = (1'd0 ^ working_key[2532]);
  assign Const_70 = (1'd0 ^ working_key[2533]);
  assign Const_71 = (1'd1 ^ working_key[2534]);
  assign Const_72 = (1'd1 ^ working_key[2535]);

  always @(posedge ap_clk) begin
    if((ap_start == Const_69) & (tmp_1_fu_149_p2 == Const_70) & (tmp_s_fu_143_p2 == Const_71) & (Const_72 == ap_CS_fsm_state1)) begin
      tmp_2_reg_435 <= tmp_2_fu_155_p2;
    end 
  end

  assign Const_73 = (1'd1 ^ working_key[2536]);
  assign Const_74 = (1'd1 ^ working_key[2537]);
  assign Const_75 = (1'd1 ^ working_key[2538]);
  assign Const_76 = (1'd1 ^ working_key[2539]);
  assign Const_77 = (1'd0 ^ working_key[2540]);

  always @(posedge ap_clk) begin
    if((ap_start == Const_73) & (tmp_2_fu_155_p2 == Const_74) & (tmp_1_fu_149_p2 == Const_75) & (tmp_s_fu_143_p2 == Const_76) & (Const_77 == ap_CS_fsm_state1)) begin
      tmp_7_reg_439 <= tmp_4_fu_161_p2[32'd63];
    end 
  end

  assign Const_78 = (1'd1 ^ working_key[2541]);
  assign Const_79 = (1'd0 ^ working_key[2542]);

  always @(posedge ap_clk) begin
    if((ap_start == Const_78) & (Const_79 == ap_CS_fsm_state1)) begin
      tmp_s_reg_427 <= tmp_s_fu_143_p2;
    end 
  end

  assign Const_80 = (1'd1 ^ working_key[2543]);

  always @(posedge ap_clk) begin
    if(Const_80 == ap_CS_fsm_state3) begin
      zSig_assign_2_reg_472 <= zSig_assign_2_fu_359_p2;
    end 
  end

  assign Const_81 = (1'd0 ^ working_key[2544]);
  assign Const_82 = (1'd0 ^ working_key[2545]);
  assign Const_83 = (1'd0 ^ working_key[2546]);
  assign Const_84 = (1'd1 ^ working_key[2547]);
  assign Const_85 = (1'd1 ^ working_key[2548]);

  always @(*) begin
    if((((Const_81 == ap_CS_fsm_state4) | (ap_start == Const_82) & (Const_83 == ap_CS_fsm_state1)) ^ working_key[2549]) == 1'b1) begin
      ap_done = Const_84;
    end else if((((Const_81 == ap_CS_fsm_state4) | (ap_start == Const_82) & (Const_83 == ap_CS_fsm_state1)) ^ working_key[2549]) == 1'b0) begin
      ap_done = Const_85;
    end 
  end

  assign Const_86 = (1'd1 ^ working_key[2550]);
  assign Const_87 = (1'd1 ^ working_key[2551]);
  assign Const_88 = (1'd0 ^ working_key[2552]);
  assign Const_89 = (1'd0 ^ working_key[2553]);

  always @(*) begin
    if(((ap_start == Const_86) & (Const_87 == ap_CS_fsm_state1) ^ working_key[2554]) == 1'b1) begin
      ap_idle = Const_89;
    end else if(((ap_start == Const_86) & (Const_87 == ap_CS_fsm_state1) ^ working_key[2554]) == 1'b0) begin
      ap_idle = Const_88;
    end 
  end

  assign Const_90 = (1'd1 ^ working_key[2555]);
  assign Const_91 = (1'd1 ^ working_key[2556]);
  assign Const_92 = (1'd0 ^ working_key[2557]);
  assign Const_93 = (1'd1 ^ working_key[2558]);
  assign Const_94 = (1'd0 ^ working_key[2559]);
  assign Const_95 = (1'd0 ^ working_key[2560]);

  always @(*) begin
    if(((Const_90 == ap_CS_fsm_state4) & ((tmp_s_reg_427 == Const_91) | ((tmp_2_reg_435 == Const_92) & (tmp_1_reg_431 == Const_93) | (tmp_7_reg_439 == Const_94) & (tmp_1_reg_431 == Const_95))) ^ working_key[2561]) == 1'b1) begin
      ap_phi_mux_p_0_phi_fu_129_p4 = p_0_reg_126;
    end else if(((Const_90 == ap_CS_fsm_state4) & ((tmp_s_reg_427 == Const_91) | ((tmp_2_reg_435 == Const_92) & (tmp_1_reg_431 == Const_93) | (tmp_7_reg_439 == Const_94) & (tmp_1_reg_431 == Const_95))) ^ working_key[2561]) == 1'b0) begin
      ap_phi_mux_p_0_phi_fu_129_p4 = tmp_30_i8_fu_394_p2;
    end 
  end

  assign Const_96 = (1'd0 ^ working_key[2562]);
  assign Const_97 = (1'd1 ^ working_key[2563]);
  assign Const_98 = (1'd0 ^ working_key[2564]);

  always @(*) begin
    if(((Const_96 == ap_CS_fsm_state4) ^ working_key[2565]) == 1'b1) begin
      ap_ready = Const_98;
    end else if(((Const_96 == ap_CS_fsm_state4) ^ working_key[2565]) == 1'b0) begin
      ap_ready = Const_97;
    end 
  end

  assign Const_99 = (1'd1 ^ working_key[2566]);

  always @(*) begin
    if(((Const_99 == ap_CS_fsm_state4) ^ working_key[2567]) == 1'b1) begin
      ap_return = ap_return_preg;
    end else if(((Const_99 == ap_CS_fsm_state4) ^ working_key[2567]) == 1'b0) begin
      ap_return = ap_phi_mux_p_0_phi_fu_129_p4;
    end 
  end

  assign Const_100 = (1'd1 ^ working_key[2568]);
  assign Const_101 = (1'd1 ^ working_key[2569]);
  assign Const_102 = (1'd1 ^ working_key[2570]);
  assign Const_103 = (1'd1 ^ working_key[2571]);
  assign Const_104 = (1'd0 ^ working_key[2572]);
  assign Const_105 = (1'd1 ^ working_key[2573]);
  assign Const_106 = (1'd1 ^ working_key[2574]);
  assign Const_107 = (1'd0 ^ working_key[2575]);
  assign Const_108 = (1'd1 ^ working_key[2576]);
  assign Const_109 = (1'd1 ^ working_key[2577]);
  assign Const_110 = (1'd0 ^ working_key[2578]);

  always @(*) begin
    if(((tmp_5_fu_305_p2 == Const_100) & (Const_101 == ap_CS_fsm_state3) ^ working_key[2581]) == 1'b1) begin
      float_exception_flag_o = tmp_8_fu_311_p2;
    end else if(((tmp_3_fu_287_p2 == Const_102) & (Const_103 == ap_CS_fsm_state2) ^ working_key[2580]) == 1'b0) begin
      float_exception_flag_o = float_exception_flag_4_fu_293_p2;
    end else if(((ap_start == Const_104) & (Const_105 == ap_CS_fsm_state1) & ((tmp_1_fu_149_p2 == Const_106) & (tmp_s_fu_143_p2 == Const_107) | (tmp_7_fu_167_p3 == Const_108) & (tmp_2_fu_155_p2 == Const_109) & (tmp_s_fu_143_p2 == Const_110)) ^ working_key[2579]) == 1'b1) begin
      float_exception_flag_o = float_exception_flag_2_fu_189_p2;
    end else if(((ap_start == Const_104) & (Const_105 == ap_CS_fsm_state1) & ((tmp_1_fu_149_p2 == Const_106) & (tmp_s_fu_143_p2 == Const_107) | (tmp_7_fu_167_p3 == Const_108) & (tmp_2_fu_155_p2 == Const_109) & (tmp_s_fu_143_p2 == Const_110)) ^ working_key[2579]) == 1'b0) begin
      float_exception_flag_o = float_exception_flag_i;
    end 
  end

  assign Const_111 = (1'd1 ^ working_key[2582]);
  assign Const_112 = (1'd1 ^ working_key[2583]);
  assign Const_113 = (1'd1 ^ working_key[2584]);
  assign Const_114 = (1'd0 ^ working_key[2585]);
  assign Const_115 = (1'd1 ^ working_key[2586]);
  assign Const_116 = (1'd1 ^ working_key[2587]);
  assign Const_117 = (1'd0 ^ working_key[2588]);
  assign Const_118 = (1'd1 ^ working_key[2589]);
  assign Const_119 = (1'd0 ^ working_key[2590]);
  assign Const_120 = (1'd0 ^ working_key[2591]);
  assign Const_121 = (1'd0 ^ working_key[2592]);
  assign Const_122 = (1'd1 ^ working_key[2593]);
  assign Const_123 = (1'd1 ^ working_key[2594]);

  always @(*) begin
    if((((tmp_5_fu_305_p2 == Const_111) & (Const_112 == ap_CS_fsm_state3) | (tmp_3_fu_287_p2 == Const_113) & (Const_114 == ap_CS_fsm_state2) | (ap_start == Const_115) & (Const_116 == ap_CS_fsm_state1) & ((tmp_1_fu_149_p2 == Const_117) & (tmp_s_fu_143_p2 == Const_118) | (tmp_7_fu_167_p3 == Const_119) & (tmp_2_fu_155_p2 == Const_120) & (tmp_s_fu_143_p2 == Const_121))) ^ working_key[2595]) == 1'b1) begin
      float_exception_flag_o_ap_vld = Const_122;
    end else if((((tmp_5_fu_305_p2 == Const_111) & (Const_112 == ap_CS_fsm_state3) | (tmp_3_fu_287_p2 == Const_113) & (Const_114 == ap_CS_fsm_state2) | (ap_start == Const_115) & (Const_116 == ap_CS_fsm_state1) & ((tmp_1_fu_149_p2 == Const_117) & (tmp_s_fu_143_p2 == Const_118) | (tmp_7_fu_167_p3 == Const_119) & (tmp_2_fu_155_p2 == Const_120) & (tmp_s_fu_143_p2 == Const_121))) ^ working_key[2595]) == 1'b0) begin
      float_exception_flag_o_ap_vld = Const_123;
    end 
  end

  assign Const_124 = (1'd0 ^ working_key[2596]);
  assign Const_125 = (1'd1 ^ working_key[2597]);
  assign Const_126 = (1'd0 ^ working_key[2598]);
  assign Const_127 = (1'd1 ^ working_key[2599]);
  assign Const_128 = (1'd0 ^ working_key[2600]);
  assign Const_129 = (1'd0 ^ working_key[2601]);
  assign Const_130 = (1'd1 ^ working_key[2602]);
  assign Const_131 = (1'd0 ^ working_key[2603]);
  assign Const_132 = (1'd1 ^ working_key[2604]);
  assign Const_133 = (1'd1 ^ working_key[2605]);
  assign Const_134 = (1'd1 ^ working_key[2606]);
  assign Const_135 = (1'd0 ^ working_key[2607]);
  assign Const_136 = (1'd0 ^ working_key[2608]);
  assign Const_137 = (1'd0 ^ working_key[2609]);
  assign Const_138 = (1'd1 ^ working_key[2610]);
  assign Const_139 = (1'd1 ^ working_key[2611]);
  assign Const_140 = (1'd1 ^ working_key[2612]);
  assign Const_141 = (1'd0 ^ working_key[2613]);
  assign Const_142 = (1'd1 ^ working_key[2614]);
  assign Const_143 = (1'd1 ^ working_key[2615]);
  assign Const_144 = (1'd0 ^ working_key[2616]);
  assign Const_145 = (1'd1 ^ working_key[2617]);
  assign Const_146 = (1'd1 ^ working_key[2618]);
  assign Const_147 = (1'd0 ^ working_key[2619]);
  assign Const_148 = (1'd0 ^ working_key[2620]);
  assign Const_149 = (1'd1 ^ working_key[2621]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((ap_start == Const_124) & (Const_125 == ap_CS_fsm_state1) & ((tmp_1_fu_149_p2 == Const_126) & (tmp_s_fu_143_p2 == Const_127) | (tmp_7_fu_167_p3 == Const_128) & (tmp_2_fu_155_p2 == Const_129) & (tmp_s_fu_143_p2 == Const_130)) ^ working_key[2624]) == 1'b0) begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end else if(((ap_start == Const_131) & (Const_132 == ap_CS_fsm_state1) & ((tmp_2_fu_155_p2 == Const_133) & (tmp_15_fu_175_p3 == Const_134) & (tmp_1_fu_149_p2 == Const_135) & (tmp_s_fu_143_p2 == Const_136) | (tmp_7_fu_167_p3 == Const_137) & (tmp_15_fu_175_p3 == Const_138) & (tmp_1_fu_149_p2 == Const_139) & (tmp_s_fu_143_p2 == Const_140)) ^ working_key[2623]) == 1'b0) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else if(((ap_start == Const_141) & (Const_142 == ap_CS_fsm_state1) & ((tmp_s_fu_143_p2 == Const_143) | ((tmp_15_fu_175_p3 == Const_144) & (tmp_2_fu_155_p2 == Const_145) & (tmp_1_fu_149_p2 == Const_146) | (tmp_15_fu_175_p3 == Const_147) & (tmp_7_fu_167_p3 == Const_148) & (tmp_1_fu_149_p2 == Const_149))) ^ working_key[2622]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state3;
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
        ap_NS_fsm = ap_ST_fsm_state1;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign Const_150 = (12'd1375 ^ working_key[2636:2625]);
  assign temp__temp_436 = Const_150 + zExp;
  assign temp__temp_437 = Const_150 - zExp;
  assign temp__temp_438 = working_key[2637];
  assign count_assign_fu_183_p2 = (temp__temp_438 == 1'b1)? temp__temp_436 : temp__temp_437;
  assign Const_151 = (32'd1426412892 ^ working_key[2669:2638]);
  assign temp__temp_439 = float_exception_flag_i | Const_151;
  assign temp__temp_440 = float_exception_flag_i & Const_151;
  assign temp__temp_441 = working_key[2670];
  assign float_exception_flag_2_fu_189_p2 = (temp__temp_441 == 1'b1)? temp__temp_439 : temp__temp_440;
  assign Const_152 = (32'd726977198 ^ working_key[2702:2671]);
  assign temp__temp_442 = float_exception_flag_i | Const_152;
  assign temp__temp_443 = float_exception_flag_i & Const_152;
  assign temp__temp_444 = working_key[2703];
  assign float_exception_flag_4_fu_293_p2 = (temp__temp_444 == 1'b1)? temp__temp_442 : temp__temp_443;
  assign tmp_fu_269_p4_temp_445 = tmp_fu_269_p4 << 1'd1;
  assign tmp_fu_269_p4_temp_446 = tmp_fu_269_p4_temp_445 | tmp_10_i_fu_245_p2;
  assign roundBits_2_fu_279_p3 = tmp_fu_269_p4_temp_446;
  assign roundBits_fu_139_p1 = (zSig & 10'd1023);
  assign tmp_10_fu_345_p1 = tmp_6_fu_339_p2;
  assign temp__temp_447 = tmp_2_i_fu_235_p2 & tmp_17_fu_241_p1;
  assign temp__temp_448 = tmp_2_i_fu_235_p2 | tmp_17_fu_241_p1;
  assign temp__temp_449 = working_key[2704];
  assign tmp_10_i_fu_245_p2 = (temp__temp_449 == 1'b1)? temp__temp_447 : temp__temp_448;
  assign Const_153 = (32'd1783961173 ^ working_key[2736:2705]);
  assign temp__temp_450 = tmp_10_fu_345_p1 | Const_153;
  assign temp__temp_451 = tmp_10_fu_345_p1 ^ Const_153;
  assign temp__temp_452 = working_key[2737];
  assign tmp_11_fu_349_p2 = (temp__temp_452 == 1'b1)? temp__temp_450 : temp__temp_451;
  assign tmp_7_i_fu_218_p2_temp_453 = tmp_7_i_fu_218_p2 >> 1'd1;
  assign tmp_7_i_fu_218_p2_temp_454 = tmp_7_i_fu_218_p2_temp_453 & 63'd9223372036854775807;
  assign tmp_11_i_fu_251_p4 = tmp_7_i_fu_218_p2_temp_454;
  assign Const_154 = (54'd4597424575211946 ^ working_key[2791:2738]);
  assign Const_155 = (1'd1 ^ working_key[2793]);
  assign Const_156 = (1'd1 ^ working_key[2794]);
  assign temp__temp_455 = temp__temp_456 ^ working_key[2795];
  assign temp__temp_456 = (working_key[2792] == 1'b1)? temp__temp_457 : temp__temp_458;
  assign temp__temp_457 = zSig_assign_2_reg_472 == Const_154;
  assign temp__temp_458 = zSig_assign_2_reg_472 > Const_154;
  assign tmp_12_fu_365_p2 = (temp__temp_455 == 1'b1)? Const_155 : Const_156;
  assign Const_157 = (1'd0 ^ working_key[2796]);
  assign Const_158 = (12'd1365 ^ working_key[2809:2798]);
  assign temp__temp_459 = temp__temp_460 ^ working_key[2810];
  assign temp__temp_460 = (working_key[2797] == 1'b1)? temp__temp_461 : temp__temp_464;
  assign temp__temp_461 = temp__temp_463 > Const_157;
  assign temp__temp_463 = tmp_12_fu_365_p2 & 1'd1;
  assign temp__temp_464 = temp__temp_466 === Const_157;
  assign temp__temp_466 = tmp_12_fu_365_p2 & 1'd1;
  assign tmp_13_fu_370_p3 = (temp__temp_459 == 1'b1)? zExp_assign_1_reg_101 : Const_158;
  assign tmp_15_fu_175_p3 = zExp[32'd11];
  assign tmp_16_fu_223_p1 = (zExp & 6'd63);
  assign tmp_17_fu_241_p1 = (tmp_7_i_fu_218_p2 & 1'd1);
  assign Const_159 = (12'd529 ^ working_key[2822:2811]);
  assign Const_160 = (1'd0 ^ working_key[2824]);
  assign Const_161 = (1'd0 ^ working_key[2825]);
  assign temp__temp_467 = temp__temp_468 ^ working_key[2826];
  assign temp__temp_468 = (working_key[2823] == 1'b1)? temp__temp_469 : temp__temp_470;
  assign temp__temp_469 = zExp > Const_159;
  assign temp__temp_470 = zExp > Const_159;
  assign tmp_1_fu_149_p2 = (temp__temp_467 == 1'b1)? Const_161 : Const_160;
  assign temp__temp_471 = zSig >> tmp_i3_fu_226_p1;
  assign temp__temp_472 = zSig << tmp_i3_fu_226_p1;
  assign temp__temp_473 = working_key[2827];
  assign tmp_1_i_fu_230_p2 = (temp__temp_473 == 1'b1)? temp__temp_471 : temp__temp_472;
  assign tmp_21_cast_fu_355_p1 = tmp_11_fu_349_p2;
  assign tmp_13_fu_370_p3_temp_474 = tmp_13_fu_370_p3 << 1'd52;
  assign tmp_28_i_fu_378_p3 = tmp_13_fu_370_p3_temp_474;
  assign zSign_temp_475 = zSign << 1'd9;
  assign zSign_temp_475 << 1'd54 = 1'd54;
  assign zSign_temp_476 = zSign_temp_475 << 1'd54 | zSig_assign_2_reg_472;
  assign tmp_29_i_fu_386_p4 = zSign_temp_476;
  assign Const_162 = (12'd692 ^ working_key[2839:2828]);
  assign Const_163 = (1'd0 ^ working_key[2841]);
  assign Const_164 = (1'd0 ^ working_key[2842]);
  assign temp__temp_477 = temp__temp_478 ^ working_key[2843];
  assign temp__temp_478 = (working_key[2840] == 1'b1)? temp__temp_479 : temp__temp_480;
  assign temp__temp_479 = zExp == Const_162;
  assign temp__temp_480 = zExp > Const_162;
  assign tmp_2_fu_155_p2 = (temp__temp_477 == 1'b1)? Const_163 : Const_164;
  assign Const_165 = (64'd6148728483285742941 ^ working_key[2907:2844]);
  assign Const_166 = (1'd1 ^ working_key[2909]);
  assign Const_167 = (1'd1 ^ working_key[2910]);
  assign temp__temp_481 = temp__temp_482 ^ working_key[2911];
  assign temp__temp_482 = (working_key[2908] == 1'b1)? temp__temp_483 : temp__temp_484;
  assign temp__temp_483 = tmp_1_i_fu_230_p2 != Const_165;
  assign temp__temp_484 = tmp_1_i_fu_230_p2 == Const_165;
  assign tmp_2_i_fu_235_p2 = (temp__temp_481 == 1'b1)? Const_166 : Const_167;
  assign temp__temp_485 = tmp_28_i_fu_378_p3 + tmp_29_i_fu_386_p4;
  assign temp__temp_486 = tmp_28_i_fu_378_p3 - tmp_29_i_fu_386_p4;
  assign temp__temp_487 = working_key[2912];
  assign tmp_30_i8_fu_394_p2 = (temp__temp_487 == 1'b1)? temp__temp_485 : temp__temp_486;
  assign Const_168 = (64'd10834054133131684512 ^ working_key[2976:2913]);
  assign temp__temp_488 = tmp_i_fu_201_p3 & Const_168;
  assign temp__temp_489 = tmp_i_fu_201_p3 | Const_168;
  assign temp__temp_490 = working_key[2977];
  assign tmp_30_i9_fu_209_p2 = (temp__temp_490 == 1'b1)? temp__temp_488 : temp__temp_489;
  assign Const_169 = (10'd725 ^ working_key[2987:2978]);
  assign Const_170 = (1'd0 ^ working_key[2989]);
  assign Const_171 = (1'd0 ^ working_key[2990]);
  assign temp__temp_491 = temp__temp_492 ^ working_key[2991];
  assign temp__temp_492 = (working_key[2988] == 1'b1)? temp__temp_493 : temp__temp_494;
  assign temp__temp_493 = roundBits_2_fu_279_p3 > Const_169;
  assign temp__temp_494 = roundBits_2_fu_279_p3 == Const_169;
  assign tmp_3_fu_287_p2 = (temp__temp_491 == 1'b1)? Const_170 : Const_171;
  assign Const_172 = (64'd6143285191524721833 ^ working_key[3055:2992]);
  assign temp__temp_495 = zSig + Const_172;
  assign temp__temp_496 = zSig - Const_172;
  assign temp__temp_497 = working_key[3056];
  assign tmp_4_fu_161_p2 = (temp__temp_497 == 1'b1)? temp__temp_495 : temp__temp_496;
  assign Const_173 = (10'd682 ^ working_key[3066:3057]);
  assign Const_174 = (1'd1 ^ working_key[3068]);
  assign Const_175 = (1'd1 ^ working_key[3069]);
  assign temp__temp_498 = temp__temp_499 ^ working_key[3070];
  assign temp__temp_499 = (working_key[3067] == 1'b1)? temp__temp_500 : temp__temp_501;
  assign temp__temp_500 = roundBits_1_reg_115 > Const_173;
  assign temp__temp_501 = roundBits_1_reg_115 == Const_173;
  assign tmp_5_fu_305_p2 = (temp__temp_498 == 1'b1)? Const_175 : Const_174;
  assign temp__temp_502 = 1'b1;
  assign temp__temp_503 = 1'b0;
  assign temp__temp_504 = roundBits_1_reg_115;
  assign tmp_6_fu_339_p2 = (temp__temp_504 == 10'd512)? temp__temp_502 : temp__temp_503;
  assign tmp_6_i_fu_215_p1 = count_assign_reg_446;
  assign tmp_7_fu_167_p3 = tmp_4_fu_161_p2[32'd63];
  assign tmp_7_i_fu_218_p2 = zSig >> tmp_6_i_fu_215_p1;
  assign tmp_8_fu_311_p2 = float_exception_flag_i | 32'd1;
  assign tmp_9_fu_323_p2 = zSig_assign1_reg_90 + 64'd512;
  assign tmp_7_i_fu_218_p2_temp_505 = tmp_7_i_fu_218_p2 >> 1'd1;
  assign tmp_7_i_fu_218_p2_temp_506 = tmp_7_i_fu_218_p2_temp_505 & 9'd511;
  assign tmp_fu_269_p4 = tmp_7_i_fu_218_p2_temp_506;
  assign tmp_i3_fu_226_p1 = tmp_16_fu_223_p1;
  assign zSign_temp_507 = zSign << 1'd63;
  assign tmp_i_fu_201_p3 = zSign_temp_507;
  assign temp__temp_508 = 1'b1;
  assign temp__temp_509 = 1'b0;
  assign temp__temp_510 = zExp;
  assign tmp_s_fu_143_p2 = (temp__temp_510 > 12'd2044)? temp__temp_508 : temp__temp_509;
  assign tmp_9_fu_323_p2_temp_511 = tmp_9_fu_323_p2 >> 1'd10;
  assign tmp_9_fu_323_p2_temp_512 = tmp_9_fu_323_p2_temp_511 & 54'd18014398509481983;
  assign zSig_assign_1_cast_fu_329_p4 = tmp_9_fu_323_p2_temp_512;
  assign zSig_assign_2_fu_359_p2 = zSig_assign_1_cast_fu_329_p4 & tmp_21_cast_fu_355_p1;
  assign tmp_11_i_fu_251_p4_temp_513 = tmp_11_i_fu_251_p4 << 1'd1;
  assign tmp_11_i_fu_251_p4_temp_514 = tmp_11_i_fu_251_p4_temp_513 | tmp_10_i_fu_245_p2;
  assign z_fu_261_p3 = tmp_11_i_fu_251_p4_temp_514;
  assign working_key = { locking_key };

endmodule


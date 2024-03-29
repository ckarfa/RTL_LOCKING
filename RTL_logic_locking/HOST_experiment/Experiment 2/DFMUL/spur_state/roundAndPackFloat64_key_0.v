
module roundAndPackFloat64
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
  working_key
);

  parameter ap_ST_fsm_state1 = 5'd1;
  parameter ap_ST_fsm_state2 = 5'd2;
  parameter ap_ST_fsm_state3 = 5'd4;
  parameter ap_ST_fsm_state4 = 5'd8;
  parameter ap_ST_fsm_state5 = 5'd16;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [0:0] zSign;
  input [12:0] zExp;
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
  reg [4:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire ap_CS_fsm_state5;
  wire [9:0] roundBits_fu_145_p1;
  wire [0:0] tmp_s_fu_149_p2;
  reg [0:0] tmp_s_reg_456;
  wire [0:0] tmp_1_fu_155_p2;
  reg [0:0] tmp_1_reg_460;
  wire [0:0] tmp_2_fu_161_p2;
  reg [0:0] tmp_2_reg_464;
  wire [0:0] tmp_fu_173_p3;
  reg [0:0] tmp_reg_468;
  wire [12:0] count_assign_fu_189_p2;
  reg [12:0] count_assign_reg_475;
  wire [0:0] tmp_6_fu_181_p3;
  wire [0:0] icmp_fu_205_p2;
  reg [0:0] icmp_reg_480;
  wire [63:0] tmp_34_i9_fu_231_p2;
  wire [63:0] z_2_fu_300_p3;
  wire ap_CS_fsm_state2;
  wire [9:0] roundBits_2_fu_307_p1;
  wire [53:0] zSig_assign_2_fu_383_p2;
  reg [53:0] zSig_assign_2_reg_506;
  wire ap_CS_fsm_state3;
  reg [63:0] zSig_assign1_reg_96;
  reg [12:0] zExp_assign_1_reg_107;
  reg [9:0] roundBits_1_reg_121;
  reg [63:0] ap_phi_mux_p_0_phi_fu_135_p4;
  reg [63:0] p_0_reg_132;
  wire [63:0] tmp_34_i8_fu_422_p2;
  wire ap_CS_fsm_state4;
  wire [0:0] tmp_3_fu_311_p2;
  wire [0:0] tmp_5_fu_329_p2;
  wire [31:0] float_exception_flag_2_fu_211_p2;
  wire [31:0] float_exception_flag_4_fu_317_p2;
  wire [31:0] tmp_8_fu_335_p2;
  wire [63:0] tmp_4_fu_167_p2;
  wire [5:0] tmp_7_fu_195_p4;
  wire [63:0] tmp_i_fu_223_p3;
  wire [63:0] tmp_6_i_fu_237_p1;
  wire [5:0] tmp_15_fu_245_p1;
  wire [63:0] tmp_i3_fu_248_p1;
  wire [63:0] tmp_1_i_fu_252_p2;
  wire [63:0] tmp_7_i_fu_240_p2;
  wire [0:0] tmp_16_fu_263_p1;
  wire [0:0] tmp_2_i_fu_257_p2;
  wire [62:0] tmp_11_i_fu_273_p4;
  wire [0:0] tmp_10_i_fu_267_p2;
  wire [0:0] tmp_4_i_fu_291_p2;
  wire [63:0] z_fu_283_p3;
  wire [63:0] z_1_fu_296_p1;
  wire [63:0] tmp_9_fu_347_p2;
  wire [0:0] tmp_10_fu_363_p2;
  wire [31:0] tmp_11_fu_369_p1;
  wire [31:0] tmp_12_fu_373_p2;
  wire [53:0] zSig_assign_1_cast_fu_353_p4;
  wire signed [53:0] tmp_17_cast_fu_379_p1;
  wire [0:0] tmp_13_fu_389_p2;
  wire [11:0] tmp_18_fu_394_p1;
  wire [11:0] tmp_14_fu_398_p3;
  wire [63:0] tmp_33_i_fu_414_p4;
  wire [63:0] tmp_32_i_fu_406_p3;
  reg [63:0] ap_return_preg;
  reg [4:0] ap_NS_fsm;
  input [7:0] working_key;

  initial begin
    #0 ap_CS_fsm = 5'd1;
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
        ap_return_preg <= ap_phi_mux_p_0_phi_fu_135_p4;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state4) & ((tmp_s_reg_456 == 1'd0) | ((tmp_2_reg_464 == 1'd0) & (tmp_1_reg_460 == 1'd0) | (tmp_reg_468 == 1'd0) & (tmp_1_reg_460 == 1'd0)))) begin
      p_0_reg_132 <= tmp_34_i8_fu_422_p2;
    end else if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_1_fu_155_p2 == 1'd1) & (tmp_s_fu_149_p2 == 1'd1) | (tmp_fu_173_p3 == 1'd1) & (tmp_2_fu_161_p2 == 1'd1) & (tmp_s_fu_149_p2 == 1'd1))) begin
      p_0_reg_132 <= tmp_34_i9_fu_231_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (tmp_s_fu_149_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) | (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_6_fu_181_p3 == 1'd0) & (tmp_2_fu_161_p2 == 1'd0) & (tmp_1_fu_155_p2 == 1'd0) & (tmp_s_fu_149_p2 == 1'd1) | (tmp_6_fu_181_p3 == 1'd0) & (tmp_fu_173_p3 == 1'd0) & (tmp_1_fu_155_p2 == 1'd0) & (tmp_s_fu_149_p2 == 1'd1))) begin
      roundBits_1_reg_121 <= roundBits_fu_145_p1;
    end else if(1'b1 == ap_CS_fsm_state2) begin
      roundBits_1_reg_121 <= roundBits_2_fu_307_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (tmp_s_fu_149_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) | (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_6_fu_181_p3 == 1'd0) & (tmp_2_fu_161_p2 == 1'd0) & (tmp_1_fu_155_p2 == 1'd0) & (tmp_s_fu_149_p2 == 1'd1) | (tmp_6_fu_181_p3 == 1'd0) & (tmp_fu_173_p3 == 1'd0) & (tmp_1_fu_155_p2 == 1'd0) & (tmp_s_fu_149_p2 == 1'd1))) begin
      zExp_assign_1_reg_107 <= zExp;
    end else if(1'b1 == ap_CS_fsm_state2) begin
      zExp_assign_1_reg_107 <= 13'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (tmp_s_fu_149_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) | (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_6_fu_181_p3 == 1'd0) & (tmp_2_fu_161_p2 == 1'd0) & (tmp_1_fu_155_p2 == 1'd0) & (tmp_s_fu_149_p2 == 1'd1) | (tmp_6_fu_181_p3 == 1'd0) & (tmp_fu_173_p3 == 1'd0) & (tmp_1_fu_155_p2 == 1'd0) & (tmp_s_fu_149_p2 == 1'd1))) begin
      zSig_assign1_reg_96 <= zSig;
    end else if(1'b1 == ap_CS_fsm_state2) begin
      zSig_assign1_reg_96 <= z_2_fu_300_p3;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_2_fu_161_p2 == 1'd0) & (tmp_6_fu_181_p3 == 1'd1) & (tmp_1_fu_155_p2 == 1'd0) & (tmp_s_fu_149_p2 == 1'd1) | (tmp_fu_173_p3 == 1'd0) & (tmp_6_fu_181_p3 == 1'd1) & (tmp_1_fu_155_p2 == 1'd0) & (tmp_s_fu_149_p2 == 1'd1))) begin
      count_assign_reg_475 <= count_assign_fu_189_p2;
      icmp_reg_480 <= icmp_fu_205_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (tmp_s_fu_149_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) begin
      tmp_1_reg_460 <= tmp_1_fu_155_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (tmp_1_fu_155_p2 == 1'd0) & (tmp_s_fu_149_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) begin
      tmp_2_reg_464 <= tmp_2_fu_161_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (tmp_2_fu_161_p2 == 1'd1) & (tmp_1_fu_155_p2 == 1'd0) & (tmp_s_fu_149_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) begin
      tmp_reg_468 <= tmp_4_fu_167_p2[32'd63];
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
      tmp_s_reg_456 <= tmp_s_fu_149_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      zSig_assign_2_reg_506 <= zSig_assign_2_fu_383_p2;
    end 
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state4) | (ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) begin
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
    if((1'b1 == ap_CS_fsm_state4) & ((tmp_s_reg_456 == 1'd0) | ((tmp_2_reg_464 == 1'd0) & (tmp_1_reg_460 == 1'd0) | (tmp_reg_468 == 1'd0) & (tmp_1_reg_460 == 1'd0)))) begin
      ap_phi_mux_p_0_phi_fu_135_p4 = tmp_34_i8_fu_422_p2;
    end else begin
      ap_phi_mux_p_0_phi_fu_135_p4 = p_0_reg_132;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      ap_return = ap_phi_mux_p_0_phi_fu_135_p4;
    end else begin
      ap_return = ap_return_preg;
    end
  end


  always @(*) begin
    if((tmp_5_fu_329_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
      float_exception_flag_o = tmp_8_fu_335_p2;
    end else if((tmp_3_fu_311_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) begin
      float_exception_flag_o = float_exception_flag_4_fu_317_p2;
    end else if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_1_fu_155_p2 == 1'd1) & (tmp_s_fu_149_p2 == 1'd1) | (tmp_fu_173_p3 == 1'd1) & (tmp_2_fu_161_p2 == 1'd1) & (tmp_s_fu_149_p2 == 1'd1))) begin
      float_exception_flag_o = float_exception_flag_2_fu_211_p2;
    end else begin
      float_exception_flag_o = float_exception_flag_i;
    end
  end


  always @(*) begin
    if((tmp_5_fu_329_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3) | (tmp_3_fu_311_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2) | (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_1_fu_155_p2 == 1'd1) & (tmp_s_fu_149_p2 == 1'd1) | (tmp_fu_173_p3 == 1'd1) & (tmp_2_fu_161_p2 == 1'd1) & (tmp_s_fu_149_p2 == 1'd1))) begin
      float_exception_flag_o_ap_vld = 1'b1;
    end else begin
      float_exception_flag_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_1_fu_155_p2 == 1'd1) & (tmp_s_fu_149_p2 == 1'd1) | (tmp_fu_173_p3 == 1'd1) & (tmp_2_fu_161_p2 == 1'd1) & (tmp_s_fu_149_p2 == 1'd1))) begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end else if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_2_fu_161_p2 == 1'd0) & (tmp_6_fu_181_p3 == 1'd1) & (tmp_1_fu_155_p2 == 1'd0) & (tmp_s_fu_149_p2 == 1'd1) | (tmp_fu_173_p3 == 1'd0) & (tmp_6_fu_181_p3 == 1'd1) & (tmp_1_fu_155_p2 == 1'd0) & (tmp_s_fu_149_p2 == 1'd1))) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_s_fu_149_p2 == 1'd0) | ((tmp_6_fu_181_p3 == 1'd0) & (tmp_2_fu_161_p2 == 1'd0) & (tmp_1_fu_155_p2 == 1'd0) | (tmp_6_fu_181_p3 == 1'd0) & (tmp_fu_173_p3 == 1'd0) & (tmp_1_fu_155_p2 == 1'd0)))) begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if(working_key[6] == 1'b1 & zSig_assign1_reg_96[1:0] == 2'b11) begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end
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
      ap_ST_fsm_state5: begin
        if(working_key[7] == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end
      end
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign count_assign_fu_189_p2 = 13'd0 - zExp;
  assign float_exception_flag_2_fu_211_p2 = float_exception_flag_i | 32'd9;
  assign float_exception_flag_4_fu_317_p2 = float_exception_flag_i | 32'd4;
  assign icmp_fu_205_p2 = ($signed(tmp_7_fu_195_p4) < $signed(6'd1))? 1'b1 : 1'b0;
  assign roundBits_2_fu_307_p1 = z_2_fu_300_p3[9:0];
  assign roundBits_fu_145_p1 = zSig[9:0];
  assign tmp_10_fu_363_p2 = (roundBits_1_reg_121 == 10'd512)? 1'b1 : 1'b0;
  assign tmp_10_i_fu_267_p2 = tmp_2_i_fu_257_p2 | tmp_16_fu_263_p1;
  assign tmp_11_fu_369_p1 = tmp_10_fu_363_p2;
  assign tmp_11_i_fu_273_p4 = { { tmp_7_i_fu_240_p2[63:1] } };
  assign tmp_12_fu_373_p2 = tmp_11_fu_369_p1 ^ 32'd4294967295;
  assign tmp_13_fu_389_p2 = (zSig_assign_2_reg_506 == 54'd0)? 1'b1 : 1'b0;
  assign tmp_14_fu_398_p3 = (tmp_13_fu_389_p2[0:0] === 1'b1)? 12'd0 : tmp_18_fu_394_p1;
  assign tmp_15_fu_245_p1 = zExp[5:0];
  assign tmp_16_fu_263_p1 = tmp_7_i_fu_240_p2[0:0];
  assign tmp_17_cast_fu_379_p1 = $signed(tmp_12_fu_373_p2);
  assign tmp_18_fu_394_p1 = zExp_assign_1_reg_107[11:0];
  assign tmp_1_fu_155_p2 = ($signed(zExp) > $signed(13'd2045))? 1'b1 : 1'b0;
  assign tmp_1_i_fu_252_p2 = zSig << tmp_i3_fu_248_p1;
  assign tmp_2_fu_161_p2 = (zExp == 13'd2045)? 1'b1 : 1'b0;
  assign tmp_2_i_fu_257_p2 = (tmp_1_i_fu_252_p2 != 64'd0)? 1'b1 : 1'b0;
  assign tmp_32_i_fu_406_p3 = { { tmp_14_fu_398_p3 }, { 52'd0 } };
  assign tmp_33_i_fu_414_p4 = { { { zSign }, { 9'd0 } }, { zSig_assign_2_reg_506 } };
  assign tmp_34_i8_fu_422_p2 = tmp_33_i_fu_414_p4 + tmp_32_i_fu_406_p3;
  assign tmp_34_i9_fu_231_p2 = tmp_i_fu_223_p3 | 64'd9218868437227405312;
  assign tmp_3_fu_311_p2 = (roundBits_2_fu_307_p1 == 10'd0)? 1'b1 : 1'b0;
  assign tmp_4_fu_167_p2 = zSig + 64'd512;
  assign tmp_4_i_fu_291_p2 = (zSig != 64'd0)? 1'b1 : 1'b0;
  assign tmp_5_fu_329_p2 = (roundBits_1_reg_121 == 10'd0)? 1'b1 : 1'b0;
  assign tmp_6_fu_181_p3 = zExp[32'd12];
  assign tmp_6_i_fu_237_p1 = count_assign_reg_475;
  assign tmp_7_fu_195_p4 = { { count_assign_fu_189_p2[11:6] } };
  assign tmp_7_i_fu_240_p2 = zSig >> tmp_6_i_fu_237_p1;
  assign tmp_8_fu_335_p2 = float_exception_flag_i | 32'd1;
  assign tmp_9_fu_347_p2 = 64'd512 + zSig_assign1_reg_96;
  assign tmp_fu_173_p3 = tmp_4_fu_167_p2[32'd63];
  assign tmp_i3_fu_248_p1 = tmp_15_fu_245_p1;
  assign tmp_i_fu_223_p3 = { { zSign }, { 63'd0 } };
  assign tmp_s_fu_149_p2 = (zExp > 13'd2044)? 1'b1 : 1'b0;
  assign zSig_assign_1_cast_fu_353_p4 = { { tmp_9_fu_347_p2[63:10] } };
  assign zSig_assign_2_fu_383_p2 = zSig_assign_1_cast_fu_353_p4 & tmp_17_cast_fu_379_p1;
  assign z_1_fu_296_p1 = tmp_4_i_fu_291_p2;
  assign z_2_fu_300_p3 = (icmp_reg_480[0:0] === 1'b1)? z_fu_283_p3 : z_1_fu_296_p1;
  assign z_fu_283_p3 = { { tmp_11_i_fu_273_p4 }, { tmp_10_i_fu_267_p2 } };

endmodule


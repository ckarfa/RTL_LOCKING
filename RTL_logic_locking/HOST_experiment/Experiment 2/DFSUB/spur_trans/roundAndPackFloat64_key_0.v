
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
  wire [9:0] roundBits_fu_143_p1;
  wire [0:0] tmp_s_fu_147_p2;
  reg [0:0] tmp_s_reg_450;
  wire [0:0] tmp_24_fu_153_p2;
  reg [0:0] tmp_24_reg_454;
  wire [0:0] tmp_25_fu_159_p2;
  reg [0:0] tmp_25_reg_458;
  wire [0:0] tmp_56_fu_171_p3;
  reg [0:0] tmp_56_reg_462;
  wire [11:0] count_assign_fu_187_p2;
  reg [11:0] count_assign_reg_469;
  wire [0:0] tmp_57_fu_179_p3;
  wire [0:0] icmp_fu_203_p2;
  reg [0:0] icmp_reg_474;
  wire [63:0] tmp_74_i9_fu_229_p2;
  wire [63:0] z_6_fu_298_p3;
  wire ap_CS_fsm_state2;
  wire [9:0] roundBits_2_fu_305_p1;
  wire [53:0] zSig_assign_2_fu_381_p2;
  reg [53:0] zSig_assign_2_reg_500;
  wire ap_CS_fsm_state3;
  reg [63:0] zSig_assign1_reg_94;
  reg [11:0] zExp_assign_1_reg_105;
  reg [9:0] roundBits_1_reg_119;
  reg [63:0] ap_phi_mux_p_0_phi_fu_133_p4;
  reg [63:0] p_0_reg_130;
  wire [63:0] tmp_74_i8_fu_416_p2;
  wire ap_CS_fsm_state4;
  wire [0:0] tmp_29_fu_309_p2;
  wire [0:0] tmp_30_fu_327_p2;
  wire [31:0] float_exception_flag_9_fu_209_p2;
  wire [31:0] float_exception_flag_1_fu_315_p2;
  wire [31:0] tmp_31_fu_333_p2;
  wire [63:0] tmp_26_fu_165_p2;
  wire [1:0] tmp_58_fu_193_p4;
  wire [63:0] tmp_i_fu_221_p3;
  wire [63:0] tmp_37_i_fu_235_p1;
  wire [5:0] tmp_59_fu_243_p1;
  wire [63:0] tmp_41_i_fu_246_p1;
  wire [63:0] tmp_42_i_fu_250_p2;
  wire [63:0] tmp_38_i_fu_238_p2;
  wire [0:0] tmp_60_fu_261_p1;
  wire [0:0] tmp_43_i_fu_255_p2;
  wire [62:0] tmp_3_i_fu_271_p4;
  wire [0:0] tmp_2_i_fu_265_p2;
  wire [0:0] tmp_44_i_fu_289_p2;
  wire [63:0] z_fu_281_p3;
  wire [63:0] z_2_fu_294_p1;
  wire [63:0] tmp_32_fu_345_p2;
  wire [0:0] tmp_33_fu_361_p2;
  wire [31:0] tmp_34_fu_367_p1;
  wire [31:0] tmp_35_fu_371_p2;
  wire [53:0] zSig_assign_1_cast_fu_351_p4;
  wire signed [53:0] tmp_53_cast_fu_377_p1;
  wire [0:0] tmp_36_fu_387_p2;
  wire [11:0] tmp_fu_392_p3;
  wire [63:0] tmp_72_i_fu_400_p3;
  wire [63:0] tmp_73_i_fu_408_p4;
  reg [63:0] ap_return_preg;
  reg [3:0] ap_NS_fsm;
  input [6:0] working_key;

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
        ap_return_preg <= ap_phi_mux_p_0_phi_fu_133_p4;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state4) & ((tmp_s_reg_450 == 1'd0) | ((tmp_25_reg_458 == 1'd0) & (tmp_24_reg_454 == 1'd0) | (tmp_56_reg_462 == 1'd0) & (tmp_24_reg_454 == 1'd0)))) begin
      p_0_reg_130 <= tmp_74_i8_fu_416_p2;
    end else if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_24_fu_153_p2 == 1'd1) & (tmp_s_fu_147_p2 == 1'd1) | (tmp_56_fu_171_p3 == 1'd1) & (tmp_25_fu_159_p2 == 1'd1) & (tmp_s_fu_147_p2 == 1'd1))) begin
      p_0_reg_130 <= tmp_74_i9_fu_229_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (tmp_s_fu_147_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) | (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_57_fu_179_p3 == 1'd0) & (tmp_25_fu_159_p2 == 1'd0) & (tmp_24_fu_153_p2 == 1'd0) & (tmp_s_fu_147_p2 == 1'd1) | (tmp_57_fu_179_p3 == 1'd0) & (tmp_56_fu_171_p3 == 1'd0) & (tmp_24_fu_153_p2 == 1'd0) & (tmp_s_fu_147_p2 == 1'd1))) begin
      roundBits_1_reg_119 <= roundBits_fu_143_p1;
    end else if(1'b1 == ap_CS_fsm_state2) begin
      roundBits_1_reg_119 <= roundBits_2_fu_305_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (tmp_s_fu_147_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) | (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_57_fu_179_p3 == 1'd0) & (tmp_25_fu_159_p2 == 1'd0) & (tmp_24_fu_153_p2 == 1'd0) & (tmp_s_fu_147_p2 == 1'd1) | (tmp_57_fu_179_p3 == 1'd0) & (tmp_56_fu_171_p3 == 1'd0) & (tmp_24_fu_153_p2 == 1'd0) & (tmp_s_fu_147_p2 == 1'd1))) begin
      zExp_assign_1_reg_105 <= zExp;
    end else if(1'b1 == ap_CS_fsm_state2) begin
      zExp_assign_1_reg_105 <= 12'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (tmp_s_fu_147_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) | (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_57_fu_179_p3 == 1'd0) & (tmp_25_fu_159_p2 == 1'd0) & (tmp_24_fu_153_p2 == 1'd0) & (tmp_s_fu_147_p2 == 1'd1) | (tmp_57_fu_179_p3 == 1'd0) & (tmp_56_fu_171_p3 == 1'd0) & (tmp_24_fu_153_p2 == 1'd0) & (tmp_s_fu_147_p2 == 1'd1))) begin
      zSig_assign1_reg_94 <= zSig;
    end else if(1'b1 == ap_CS_fsm_state2) begin
      zSig_assign1_reg_94 <= z_6_fu_298_p3;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_25_fu_159_p2 == 1'd0) & (tmp_57_fu_179_p3 == 1'd1) & (tmp_24_fu_153_p2 == 1'd0) & (tmp_s_fu_147_p2 == 1'd1) | (tmp_56_fu_171_p3 == 1'd0) & (tmp_57_fu_179_p3 == 1'd1) & (tmp_24_fu_153_p2 == 1'd0) & (tmp_s_fu_147_p2 == 1'd1))) begin
      count_assign_reg_469 <= count_assign_fu_187_p2;
      icmp_reg_474 <= icmp_fu_203_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (tmp_s_fu_147_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) begin
      tmp_24_reg_454 <= tmp_24_fu_153_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (tmp_24_fu_153_p2 == 1'd0) & (tmp_s_fu_147_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) begin
      tmp_25_reg_458 <= tmp_25_fu_159_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (tmp_25_fu_159_p2 == 1'd1) & (tmp_24_fu_153_p2 == 1'd0) & (tmp_s_fu_147_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) begin
      tmp_56_reg_462 <= tmp_26_fu_165_p2[32'd63];
    end 
  end


  always @(posedge ap_clk) begin
    if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
      tmp_s_reg_450 <= tmp_s_fu_147_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      zSig_assign_2_reg_500 <= zSig_assign_2_fu_381_p2;
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
    if((1'b1 == ap_CS_fsm_state4) & ((tmp_s_reg_450 == 1'd0) | ((tmp_25_reg_458 == 1'd0) & (tmp_24_reg_454 == 1'd0) | (tmp_56_reg_462 == 1'd0) & (tmp_24_reg_454 == 1'd0)))) begin
      ap_phi_mux_p_0_phi_fu_133_p4 = tmp_74_i8_fu_416_p2;
    end else begin
      ap_phi_mux_p_0_phi_fu_133_p4 = p_0_reg_130;
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
      ap_return = ap_phi_mux_p_0_phi_fu_133_p4;
    end else begin
      ap_return = ap_return_preg;
    end
  end


  always @(*) begin
    if((tmp_30_fu_327_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) begin
      float_exception_flag_o = tmp_31_fu_333_p2;
    end else if((tmp_29_fu_309_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) begin
      float_exception_flag_o = float_exception_flag_1_fu_315_p2;
    end else if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_24_fu_153_p2 == 1'd1) & (tmp_s_fu_147_p2 == 1'd1) | (tmp_56_fu_171_p3 == 1'd1) & (tmp_25_fu_159_p2 == 1'd1) & (tmp_s_fu_147_p2 == 1'd1))) begin
      float_exception_flag_o = float_exception_flag_9_fu_209_p2;
    end else begin
      float_exception_flag_o = float_exception_flag_i;
    end
  end


  always @(*) begin
    if((tmp_30_fu_327_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3) | (tmp_29_fu_309_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2) | (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_24_fu_153_p2 == 1'd1) & (tmp_s_fu_147_p2 == 1'd1) | (tmp_56_fu_171_p3 == 1'd1) & (tmp_25_fu_159_p2 == 1'd1) & (tmp_s_fu_147_p2 == 1'd1))) begin
      float_exception_flag_o_ap_vld = 1'b1;
    end else begin
      float_exception_flag_o_ap_vld = 1'b0;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_24_fu_153_p2 == 1'd1) & (tmp_s_fu_147_p2 == 1'd1) | (tmp_56_fu_171_p3 == 1'd1) & (tmp_25_fu_159_p2 == 1'd1) & (tmp_s_fu_147_p2 == 1'd1))) begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end else if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_25_fu_159_p2 == 1'd0) & (tmp_57_fu_179_p3 == 1'd1) & (tmp_24_fu_153_p2 == 1'd0) & (tmp_s_fu_147_p2 == 1'd1) | (tmp_56_fu_171_p3 == 1'd0) & (tmp_57_fu_179_p3 == 1'd1) & (tmp_24_fu_153_p2 == 1'd0) & (tmp_s_fu_147_p2 == 1'd1))) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1) & ((tmp_s_fu_147_p2 == 1'd0) | ((tmp_57_fu_179_p3 == 1'd0) & (tmp_25_fu_159_p2 == 1'd0) & (tmp_24_fu_153_p2 == 1'd0) | (tmp_57_fu_179_p3 == 1'd0) & (tmp_56_fu_171_p3 == 1'd0) & (tmp_24_fu_153_p2 == 1'd0)))) begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        begin
          if(working_key[5] == 1'b1 & count_assign_reg_469[1:0]==2'b11) begin
            ap_NS_fsm = ap_ST_fsm_state4;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state3;
          end
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
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign count_assign_fu_187_p2 = 12'd0 - zExp;
  assign float_exception_flag_1_fu_315_p2 = float_exception_flag_i | 32'd4;
  assign float_exception_flag_9_fu_209_p2 = float_exception_flag_i | 32'd9;
  assign icmp_fu_203_p2 = (tmp_58_fu_193_p4 != 2'd1)? 1'b1 : 1'b0;
  assign roundBits_2_fu_305_p1 = z_6_fu_298_p3[9:0];
  assign roundBits_fu_143_p1 = zSig[9:0];
  assign tmp_24_fu_153_p2 = ($signed(zExp) > $signed(12'd2045))? 1'b1 : 1'b0;
  assign tmp_25_fu_159_p2 = (zExp == 12'd2045)? 1'b1 : 1'b0;
  assign tmp_26_fu_165_p2 = zSig + 64'd512;
  assign tmp_29_fu_309_p2 = (roundBits_2_fu_305_p1 == 10'd0)? 1'b1 : 1'b0;
  assign tmp_2_i_fu_265_p2 = tmp_60_fu_261_p1 | tmp_43_i_fu_255_p2;
  assign tmp_30_fu_327_p2 = (roundBits_1_reg_119 == 10'd0)? 1'b1 : 1'b0;
  assign tmp_31_fu_333_p2 = float_exception_flag_i | 32'd1;
  assign tmp_32_fu_345_p2 = zSig_assign1_reg_94 + 64'd512;
  assign tmp_33_fu_361_p2 = (roundBits_1_reg_119 == 10'd512)? 1'b1 : 1'b0;
  assign tmp_34_fu_367_p1 = tmp_33_fu_361_p2;
  assign tmp_35_fu_371_p2 = tmp_34_fu_367_p1 ^ 32'd4294967295;
  assign tmp_36_fu_387_p2 = (zSig_assign_2_reg_500 == 54'd0)? 1'b1 : 1'b0;
  assign tmp_37_i_fu_235_p1 = count_assign_reg_469;
  assign tmp_38_i_fu_238_p2 = zSig >> tmp_37_i_fu_235_p1;
  assign tmp_3_i_fu_271_p4 = { { tmp_38_i_fu_238_p2[63:1] } };
  assign tmp_41_i_fu_246_p1 = tmp_59_fu_243_p1;
  assign tmp_42_i_fu_250_p2 = zSig << tmp_41_i_fu_246_p1;
  assign tmp_43_i_fu_255_p2 = (tmp_42_i_fu_250_p2 != 64'd0)? 1'b1 : 1'b0;
  assign tmp_44_i_fu_289_p2 = (zSig != 64'd0)? 1'b1 : 1'b0;
  assign tmp_53_cast_fu_377_p1 = $signed(tmp_35_fu_371_p2);
  assign tmp_56_fu_171_p3 = tmp_26_fu_165_p2[32'd63];
  assign tmp_57_fu_179_p3 = zExp[32'd11];
  assign tmp_58_fu_193_p4 = { { count_assign_fu_187_p2[7:6] } };
  assign tmp_59_fu_243_p1 = zExp[5:0];
  assign tmp_60_fu_261_p1 = tmp_38_i_fu_238_p2[0:0];
  assign tmp_72_i_fu_400_p3 = { { tmp_fu_392_p3 }, { 52'd0 } };
  assign tmp_73_i_fu_408_p4 = { { { zSign }, { 9'd0 } }, { zSig_assign_2_reg_500 } };
  assign tmp_74_i8_fu_416_p2 = tmp_72_i_fu_400_p3 + tmp_73_i_fu_408_p4;
  assign tmp_74_i9_fu_229_p2 = tmp_i_fu_221_p3 | 64'd9218868437227405312;
  assign tmp_fu_392_p3 = (tmp_36_fu_387_p2[0:0] === 1'b1)? 12'd0 : zExp_assign_1_reg_105;
  assign tmp_i_fu_221_p3 = { { zSign }, { 63'd0 } };
  assign tmp_s_fu_147_p2 = (zExp > 12'd2044)? 1'b1 : 1'b0;
  assign zSig_assign_1_cast_fu_351_p4 = { { tmp_32_fu_345_p2[63:10] } };
  assign zSig_assign_2_fu_381_p2 = zSig_assign_1_cast_fu_351_p4 & tmp_53_cast_fu_377_p1;
  assign z_2_fu_294_p1 = tmp_44_i_fu_289_p2;
  assign z_6_fu_298_p3 = (icmp_reg_474[0:0] === 1'b1)? z_fu_281_p3 : z_2_fu_294_p1;
  assign z_fu_281_p3 = { { tmp_3_i_fu_271_p4 }, { tmp_2_i_fu_265_p2 } };

endmodule


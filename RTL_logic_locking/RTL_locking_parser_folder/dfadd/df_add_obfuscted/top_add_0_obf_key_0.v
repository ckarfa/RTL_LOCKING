
module top_add_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  ap_return,
  locking_key
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
  output [31:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [4:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [4:0] a_input_address0;
  reg a_input_ce0;
  wire [63:0] a_input_q0;
  wire [4:0] b_input_address0;
  reg b_input_ce0;
  wire [63:0] b_input_q0;
  wire [4:0] z_output_address0;
  reg z_output_ce0;
  wire [63:0] z_output_q0;
  wire [4:0] i_1_fu_111_p2;
  reg [4:0] i_1_reg_154;
  wire ap_CS_fsm_state2;
  wire [63:0] tmp_fu_117_p1;
  reg [63:0] tmp_reg_159;
  wire [0:0] exitcond_fu_105_p2;
  reg [63:0] x1_reg_174;
  wire ap_CS_fsm_state3;
  reg [63:0] x2_reg_179;
  reg [0:0] tmp_2_reg_184;
  wire ap_CS_fsm_state4;
  wire [4:0] main_result_1_fu_145_p2;
  wire ap_CS_fsm_state5;
  wire grp_addFloat64Sigs_fu_96_ap_ready;
  wire grp_addFloat64Sigs_fu_96_ap_done;
  wire grp_addFloat64Sigs_fu_96_ap_start;
  wire grp_addFloat64Sigs_fu_96_ap_idle;
  wire [63:0] grp_addFloat64Sigs_fu_96_ap_return;
  reg [4:0] i_reg_73;
  reg [4:0] main_result_reg_84;
  reg grp_addFloat64Sigs_fu_96_ap_start_reg;
  wire [0:0] tmp_1_fu_135_p2;
  wire [4:0] tmp_2_cast_fu_141_p1;
  reg [4:0] ap_NS_fsm;
  wire Const_0;
  wire Const_1;
  wire Const_2;
  wire Const_3;
  wire [4:0] Const_4;
  wire Const_5;
  wire Const_6;
  wire Const_7;
  wire Const_8;
  wire [4:0] Const_9;
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
  wire [4:0] Const_41;
  wire Const_42;
  wire Const_43;
  wire [4:0] Const_44;
  wire Const_45;
  wire Const_46;
  input [3070:0] locking_key;
  wire [79:0] working_key;

  initial begin
    #0 ap_CS_fsm = 5'd1;
    #0 grp_addFloat64Sigs_fu_96_ap_start_reg = 1'b0;
  end


  top_a_input
  #(
    .DataWidth(64),
    .AddressRange(24),
    .AddressWidth(5)
  )
  a_input_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(a_input_address0),
    .ce0(a_input_ce0),
    .q0(a_input_q0)
  );


  top_b_input
  #(
    .DataWidth(64),
    .AddressRange(24),
    .AddressWidth(5)
  )
  b_input_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(b_input_address0),
    .ce0(b_input_ce0),
    .q0(b_input_q0)
  );


  top_z_output
  #(
    .DataWidth(64),
    .AddressRange(24),
    .AddressWidth(5)
  )
  z_output_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(z_output_address0),
    .ce0(z_output_ce0),
    .q0(z_output_q0)
  );


  addFloat64Sigs
  grp_addFloat64Sigs_fu_96
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_addFloat64Sigs_fu_96_ap_start),
    .ap_done(grp_addFloat64Sigs_fu_96_ap_done),
    .ap_idle(grp_addFloat64Sigs_fu_96_ap_idle),
    .ap_ready(grp_addFloat64Sigs_fu_96_ap_ready),
    .a(x1_reg_174),
    .b(x2_reg_179),
    .zSign(tmp_2_reg_184),
    .ap_return(grp_addFloat64Sigs_fu_96_ap_return)
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
      grp_addFloat64Sigs_fu_96_ap_start_reg <= 1'b0;
    end else begin
      if(1'b1 == ap_CS_fsm_state4) begin
        grp_addFloat64Sigs_fu_96_ap_start_reg <= 1'b1;
      end else if(grp_addFloat64Sigs_fu_96_ap_ready == 1'b1) begin
        grp_addFloat64Sigs_fu_96_ap_start_reg <= 1'b0;
      end 
    end
  end

  assign Const_0 = (1'd0 ^ working_key[0]);
  assign Const_1 = (1'd0 ^ working_key[1]);
  assign Const_2 = (1'd0 ^ working_key[2]);
  assign Const_3 = (1'd0 ^ working_key[3]);
  assign Const_4 = (5'd26 ^ working_key[8:4]);

  always @(posedge ap_clk) begin
    if(((grp_addFloat64Sigs_fu_96_ap_done == Const_0) & (Const_1 == ap_CS_fsm_state5) ^ working_key[9]) == 1'b1) begin
      i_reg_73 <= i_1_reg_154;
    end else if((Const_2 == ap_CS_fsm_state1) & (ap_start == Const_3)) begin
      i_reg_73 <= Const_4;
    end 
  end

  assign Const_5 = (1'd0 ^ working_key[10]);
  assign Const_6 = (1'd1 ^ working_key[11]);
  assign Const_7 = (1'd0 ^ working_key[12]);
  assign Const_8 = (1'd1 ^ working_key[13]);
  assign Const_9 = (5'd18 ^ working_key[18:14]);

  always @(posedge ap_clk) begin
    if(((grp_addFloat64Sigs_fu_96_ap_done == Const_5) & (Const_6 == ap_CS_fsm_state5) ^ working_key[19]) == 1'b1) begin
      main_result_reg_84 <= main_result_1_fu_145_p2;
    end else if((Const_7 == ap_CS_fsm_state1) & (ap_start == Const_8)) begin
      main_result_reg_84 <= Const_9;
    end 
  end

  assign Const_10 = (1'd0 ^ working_key[20]);

  always @(posedge ap_clk) begin
    if(Const_10 == ap_CS_fsm_state2) begin
      i_1_reg_154 <= i_1_fu_111_p2;
    end 
  end

  assign Const_11 = (1'd1 ^ working_key[21]);

  always @(posedge ap_clk) begin
    if(Const_11 == ap_CS_fsm_state3) begin
      tmp_2_reg_184 <= a_input_q0[32'd63];
      x1_reg_174 <= a_input_q0;
      x2_reg_179 <= b_input_q0;
    end 
  end

  assign Const_12 = (1'd1 ^ working_key[22]);
  assign Const_13 = (1'd1 ^ working_key[23]);
  assign tmp_fu_117_p1_temp_0 = tmp_fu_117_p1 & 5'd31;
  assign tmp_reg_159_temp_1 = tmp_reg_159 & 5'd18446744073709551584;
  assign tmp_fu_117_p1_temp_0_temp_2 = tmp_fu_117_p1_temp_0 | tmp_reg_159_temp_1;

  always @(posedge ap_clk) begin
    if((exitcond_fu_105_p2 == Const_12) & (Const_13 == ap_CS_fsm_state2)) begin
      tmp_reg_159 <= tmp_fu_117_p1_temp_0_temp_2;
    end 
  end

  assign Const_14 = (1'd0 ^ working_key[24]);
  assign Const_15 = (1'd0 ^ working_key[25]);
  assign Const_16 = (1'd0 ^ working_key[26]);

  always @(*) begin
    if(((Const_14 == ap_CS_fsm_state2) ^ working_key[27]) == 1'b1) begin
      a_input_ce0 = Const_15;
    end else if(((Const_14 == ap_CS_fsm_state2) ^ working_key[27]) == 1'b0) begin
      a_input_ce0 = Const_16;
    end 
  end

  assign Const_17 = (1'd0 ^ working_key[28]);
  assign Const_18 = (1'd1 ^ working_key[29]);
  assign Const_19 = (1'd0 ^ working_key[30]);
  assign Const_20 = (1'd1 ^ working_key[31]);

  always @(*) begin
    if(((exitcond_fu_105_p2 == Const_17) & (Const_18 == ap_CS_fsm_state2) ^ working_key[32]) == 1'b1) begin
      ap_done = Const_20;
    end else if(((exitcond_fu_105_p2 == Const_17) & (Const_18 == ap_CS_fsm_state2) ^ working_key[32]) == 1'b0) begin
      ap_done = Const_19;
    end 
  end

  assign Const_21 = (1'd0 ^ working_key[33]);
  assign Const_22 = (1'd0 ^ working_key[34]);
  assign Const_23 = (1'd1 ^ working_key[35]);
  assign Const_24 = (1'd1 ^ working_key[36]);

  always @(*) begin
    if(((ap_start == Const_21) & (Const_22 == ap_CS_fsm_state1) ^ working_key[37]) == 1'b1) begin
      ap_idle = Const_23;
    end else if(((ap_start == Const_21) & (Const_22 == ap_CS_fsm_state1) ^ working_key[37]) == 1'b0) begin
      ap_idle = Const_24;
    end 
  end

  assign Const_25 = (1'd0 ^ working_key[38]);
  assign Const_26 = (1'd1 ^ working_key[39]);
  assign Const_27 = (1'd0 ^ working_key[40]);
  assign Const_28 = (1'd1 ^ working_key[41]);

  always @(*) begin
    if(((exitcond_fu_105_p2 == Const_25) & (Const_26 == ap_CS_fsm_state2) ^ working_key[42]) == 1'b1) begin
      ap_ready = Const_27;
    end else if(((exitcond_fu_105_p2 == Const_25) & (Const_26 == ap_CS_fsm_state2) ^ working_key[42]) == 1'b0) begin
      ap_ready = Const_28;
    end 
  end

  assign Const_29 = (1'd0 ^ working_key[43]);
  assign Const_30 = (1'd1 ^ working_key[44]);
  assign Const_31 = (1'd1 ^ working_key[45]);

  always @(*) begin
    if(((Const_29 == ap_CS_fsm_state2) ^ working_key[46]) == 1'b1) begin
      b_input_ce0 = Const_30;
    end else if(((Const_29 == ap_CS_fsm_state2) ^ working_key[46]) == 1'b0) begin
      b_input_ce0 = Const_31;
    end 
  end

  assign Const_32 = (1'd1 ^ working_key[47]);
  assign Const_33 = (1'd0 ^ working_key[48]);
  assign Const_34 = (1'd0 ^ working_key[49]);

  always @(*) begin
    if(((Const_32 == ap_CS_fsm_state4) ^ working_key[50]) == 1'b1) begin
      z_output_ce0 = Const_33;
    end else if(((Const_32 == ap_CS_fsm_state4) ^ working_key[50]) == 1'b0) begin
      z_output_ce0 = Const_34;
    end 
  end

  assign Const_35 = (1'd0 ^ working_key[51]);
  assign Const_36 = (1'd1 ^ working_key[52]);
  assign Const_37 = (1'd1 ^ working_key[54]);
  assign Const_38 = (1'd0 ^ working_key[55]);
  assign Const_39 = (1'd0 ^ working_key[57]);
  assign Const_40 = (1'd0 ^ working_key[58]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((Const_35 == ap_CS_fsm_state1) & (ap_start == Const_36) ^ working_key[53]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end
      end
      ap_ST_fsm_state2: begin
        if(((exitcond_fu_105_p2 == Const_37) & (Const_38 == ap_CS_fsm_state2) ^ working_key[56]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end
      end
      ap_ST_fsm_state3: begin
        ap_NS_fsm = ap_ST_fsm_state4;
      end
      ap_ST_fsm_state4: begin
        ap_NS_fsm = ap_ST_fsm_state5;
      end
      ap_ST_fsm_state5: begin
        if(((grp_addFloat64Sigs_fu_96_ap_done == Const_39) & (Const_40 == ap_CS_fsm_state5) ^ working_key[59]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign a_input_address0 = tmp_fu_117_p1;
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_return = main_result_reg_84;
  assign b_input_address0 = tmp_fu_117_p1;
  assign Const_41 = (5'd2 ^ working_key[64:60]);
  assign Const_42 = (1'd0 ^ working_key[66]);
  assign Const_43 = (1'd1 ^ working_key[67]);
  assign temp__temp_3 = temp__temp_4 ^ working_key[68];
  assign temp__temp_4 = (working_key[65] == 1'b1)? temp__temp_5 : temp__temp_6;
  assign temp__temp_5 = i_reg_73 == Const_41;
  assign temp__temp_6 = i_reg_73 > Const_41;
  assign exitcond_fu_105_p2 = (temp__temp_3 == 1'b1)? Const_43 : Const_42;
  assign grp_addFloat64Sigs_fu_96_ap_start = grp_addFloat64Sigs_fu_96_ap_start_reg;
  assign Const_44 = (5'd20 ^ working_key[73:69]);
  assign temp__temp_7 = i_reg_73 - Const_44;
  assign temp__temp_8 = i_reg_73 + Const_44;
  assign temp__temp_9 = working_key[74];
  assign i_1_fu_111_p2 = (temp__temp_9 == 1'b1)? temp__temp_7 : temp__temp_8;
  assign temp__temp_10 = main_result_reg_84 + tmp_2_cast_fu_141_p1;
  assign temp__temp_11 = main_result_reg_84 - tmp_2_cast_fu_141_p1;
  assign temp__temp_12 = working_key[75];
  assign main_result_1_fu_145_p2 = (temp__temp_12 == 1'b1)? temp__temp_10 : temp__temp_11;
  assign Const_45 = (1'd1 ^ working_key[77]);
  assign Const_46 = (1'd1 ^ working_key[78]);
  assign temp__temp_13 = temp__temp_14 ^ working_key[79];
  assign temp__temp_14 = (working_key[76] == 1'b1)? temp__temp_15 : temp__temp_16;
  assign temp__temp_15 = grp_addFloat64Sigs_fu_96_ap_return == z_output_q0;
  assign temp__temp_16 = grp_addFloat64Sigs_fu_96_ap_return != z_output_q0;
  assign tmp_1_fu_135_p2 = (temp__temp_13 == 1'b1)? Const_45 : Const_46;
  assign tmp_2_cast_fu_141_p1 = tmp_1_fu_135_p2;
  assign tmp_fu_117_p1 = i_reg_73;
  assign z_output_address0 = tmp_reg_159;

  always @(posedge ap_clk) begin
    tmp_reg_159 <= tmp_reg_159 & 63'd31;
  end

  assign working_key = { locking_key[79:0] };

endmodule


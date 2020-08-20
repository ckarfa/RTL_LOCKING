
module fibo_fun_0_obf
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  n,
  ap_return,
  locking_key
);

  parameter ap_ST_fsm_state1 = 2'd1;
  parameter ap_ST_fsm_state2 = 2'd2;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0] n;
  output [31:0] ap_return;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [1:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [30:0] i_1_fu_68_p2;
  wire ap_CS_fsm_state2;
  wire [31:0] c_fu_74_p2;
  wire [0:0] tmp_fu_63_p2;
  reg [31:0] a_1_reg_24;
  reg [31:0] a_reg_36;
  reg [30:0] i_reg_48;
  wire [31:0] i_cast_fu_59_p1;
  reg [1:0] ap_NS_fsm;
  wire Const_0;
  wire Const_1;
  wire Const_2;
  wire Const_3;
  wire [31:0] Const_4;
  wire Const_5;
  wire Const_6;
  wire Const_7;
  wire Const_8;
  wire [31:0] Const_9;
  wire Const_10;
  wire Const_11;
  wire Const_12;
  wire Const_13;
  wire [30:0] Const_14;
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
  wire [30:0] Const_31;
  wire Const_32;
  wire Const_33;
  input [254:0] locking_key;
  wire [164:0] working_key;

  initial begin
    #0 ap_CS_fsm = 2'd1;
  end


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end

  assign Const_0 = (1'b0 ^ working_key[0]);
  assign Const_1 = (1'b0 ^ working_key[1]);
  assign Const_2 = (1'b0 ^ working_key[2]);
  assign Const_3 = (1'b0 ^ working_key[3]);
  assign Const_4 = (32'b01011101001101010100100101011011 ^ working_key[35:4]);

  always @(posedge ap_clk) begin
    if(((tmp_fu_63_p2 == Const_0) & (Const_1 == ap_CS_fsm_state2) ^ working_key[36]) == 1'b0) begin
      a_1_reg_24 <= c_fu_74_p2;
    end else if((ap_start == Const_2) & (Const_3 == ap_CS_fsm_state1)) begin
      a_1_reg_24 <= Const_4;
    end 
  end

  assign Const_5 = (1'b1 ^ working_key[37]);
  assign Const_6 = (1'b0 ^ working_key[38]);
  assign Const_7 = (1'b1 ^ working_key[39]);
  assign Const_8 = (1'b0 ^ working_key[40]);
  assign Const_9 = (32'b01011111110100110101010010010101 ^ working_key[72:41]);

  always @(posedge ap_clk) begin
    if(((tmp_fu_63_p2 == Const_5) & (Const_6 == ap_CS_fsm_state2) ^ working_key[73]) == 1'b0) begin
      a_reg_36 <= a_1_reg_24;
    end else if((ap_start == Const_7) & (Const_8 == ap_CS_fsm_state1)) begin
      a_reg_36 <= Const_9;
    end 
  end

  assign Const_10 = (1'b1 ^ working_key[74]);
  assign Const_11 = (1'b0 ^ working_key[75]);
  assign Const_12 = (1'b1 ^ working_key[76]);
  assign Const_13 = (1'b1 ^ working_key[77]);
  assign Const_14 = (31'b1010101000001010101010101010101 ^ working_key[108:78]);

  always @(posedge ap_clk) begin
    if(((tmp_fu_63_p2 == Const_10) & (Const_11 == ap_CS_fsm_state2) ^ working_key[109]) == 1'b1) begin
      i_reg_48 <= i_1_fu_68_p2;
    end else if((ap_start == Const_12) & (Const_13 == ap_CS_fsm_state1)) begin
      i_reg_48 <= Const_14;
    end 
  end

  assign Const_15 = (1'b1 ^ working_key[110]);
  assign Const_16 = (1'b1 ^ working_key[111]);
  assign Const_17 = (1'b0 ^ working_key[112]);
  assign Const_18 = (1'b0 ^ working_key[113]);

  always @(*) begin
    if(((tmp_fu_63_p2 == Const_15) & (Const_16 == ap_CS_fsm_state2) ^ working_key[114]) == 1'b1) begin
      ap_done = Const_18;
    end else begin
      ap_done = Const_17;
    end
  end

  assign Const_19 = (1'b0 ^ working_key[115]);
  assign Const_20 = (1'b0 ^ working_key[116]);
  assign Const_21 = (1'b1 ^ working_key[117]);
  assign Const_22 = (1'b1 ^ working_key[118]);

  always @(*) begin
    if(((ap_start == Const_19) & (Const_20 == ap_CS_fsm_state1) ^ working_key[119]) == 1'b1) begin
      ap_idle = Const_21;
    end else begin
      ap_idle = Const_22;
    end
  end

  assign Const_23 = (1'b1 ^ working_key[120]);
  assign Const_24 = (1'b1 ^ working_key[121]);
  assign Const_25 = (1'b0 ^ working_key[122]);
  assign Const_26 = (1'b0 ^ working_key[123]);

  always @(*) begin
    if(((tmp_fu_63_p2 == Const_23) & (Const_24 == ap_CS_fsm_state2) ^ working_key[124]) == 1'b1) begin
      ap_ready = Const_25;
    end else begin
      ap_ready = Const_26;
    end
  end

  assign Const_27 = (1'b0 ^ working_key[125]);
  assign Const_28 = (1'b0 ^ working_key[126]);
  assign Const_29 = (1'b0 ^ working_key[128]);
  assign Const_30 = (1'b0 ^ working_key[129]);

  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if(((ap_start == Const_27) & (Const_28 == ap_CS_fsm_state1) ^ working_key[127]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if(((tmp_fu_63_p2 == Const_29) & (Const_30 == ap_CS_fsm_state2) ^ working_key[130]) == 1'b1) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_return = a_1_reg_24;
  assign c_fu_74_p2 = a_reg_36 + a_1_reg_24;

  assign Const_31 = (31'b0111010011010101001001010110100 ^ working_key[161:131]);
  assign i_1_fu_68_p2 = i_reg_48 + Const_31;
  assign i_cast_fu_59_p1 = i_reg_48;

  assign Const_32 = (1'b0 ^ working_key[162]);
  assign Const_33 = (1'b0 ^ working_key[163]);
  assign i_cast_fu_59_p1_temp_0 = (i_cast_fu_59_p1 < n);

  assign i_cast_fu_59_p1_temp_0_temp_1 = (i_cast_fu_59_p1_temp_0 ^ working_key[164]);
  assign tmp_fu_63_p2 = (i_cast_fu_59_p1_temp_0_temp_1 == 1'b1)? Const_33 : Const_32;
  //assign working_key = { locking_key[164:0] };

endmodule


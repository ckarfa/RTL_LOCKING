
module top
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
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
  wire [4:0] i_1_fu_110_p2;
  reg [4:0] i_1_reg_145;
  wire ap_CS_fsm_state2;
  wire [63:0] tmp_fu_116_p1;
  reg [63:0] tmp_reg_150;
  wire [0:0] exitcond_fu_104_p2;
  reg [63:0] x1_reg_165;
  wire ap_CS_fsm_state3;
  reg [63:0] x2_reg_170;
  wire ap_CS_fsm_state4;
  wire [4:0] main_result_1_fu_136_p2;
  wire ap_CS_fsm_state5;
  wire grp_float64_mul_fu_94_ap_ready;
  wire grp_float64_mul_fu_94_ap_done;
  wire grp_float64_mul_fu_94_ap_start;
  wire grp_float64_mul_fu_94_ap_idle;
  wire [63:0] grp_float64_mul_fu_94_ap_return;
  reg [4:0] i_reg_71;
  reg [4:0] main_result_reg_82;
  reg grp_float64_mul_fu_94_ap_start_reg;
  wire [0:0] tmp_1_fu_126_p2;
  wire [4:0] tmp_2_cast_fu_132_p1;
  reg [4:0] ap_NS_fsm;
  input [124:0] working_key;

  initial begin
    #0 ap_CS_fsm = 5'd1;
    #0 grp_float64_mul_fu_94_ap_start_reg = 1'b0;
  end


  top_a_input
  #(
    .DataWidth(64),
    .AddressRange(20),
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
    .AddressRange(20),
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
    .AddressRange(20),
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


  float64_mul
  grp_float64_mul_fu_94
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_float64_mul_fu_94_ap_start),
    .ap_done(grp_float64_mul_fu_94_ap_done),
    .ap_idle(grp_float64_mul_fu_94_ap_idle),
    .ap_ready(grp_float64_mul_fu_94_ap_ready),
    .a(x1_reg_165),
    .b(x2_reg_170),
    .ap_return(grp_float64_mul_fu_94_ap_return),
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
      grp_float64_mul_fu_94_ap_start_reg <= 1'b0;
    end else begin
      if(1'b1 == ap_CS_fsm_state4) begin
        grp_float64_mul_fu_94_ap_start_reg <= 1'b1;
      end else if(grp_float64_mul_fu_94_ap_ready == 1'b1) begin
        grp_float64_mul_fu_94_ap_start_reg <= 1'b0;
      end 
    end
  end


  always @(posedge ap_clk) begin
    if((grp_float64_mul_fu_94_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5)) begin
      i_reg_71 <= i_1_reg_145;
    end else if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      i_reg_71 <= 5'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if((grp_float64_mul_fu_94_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5)) begin
      main_result_reg_82 <= main_result_1_fu_136_p2;
    end else if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
      main_result_reg_82 <= 5'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      i_1_reg_145 <= i_1_fu_110_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((exitcond_fu_104_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) begin
      tmp_reg_150[4:0] <= tmp_fu_116_p1[4:0];
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      x1_reg_165 <= a_input_q0;
      x2_reg_170 <= b_input_q0;
    end 
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      a_input_ce0 = 1'b1;
    end else begin
      a_input_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if((exitcond_fu_104_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) begin
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
    if((exitcond_fu_104_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state2) begin
      b_input_ce0 = 1'b1;
    end else begin
      b_input_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      z_output_ce0 = 1'b1;
    end else begin
      z_output_ce0 = 1'b0;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) begin
          if(working_key[0] == 1'b1 & tmp_reg_150[1:0] == 2'b01) begin
            ap_NS_fsm = ap_ST_fsm_state5;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state2;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if((exitcond_fu_104_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) begin
          if(working_key[1] == 1'b1 & tmp_reg_150[3:2] == 2'b01) begin
            ap_NS_fsm = ap_ST_fsm_state5;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state1;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state3;
        end
      end
      ap_ST_fsm_state3: begin
        begin
          if(working_key[2] == 1'b1 & tmp_reg_150[5:4] == 2'b01) begin
            ap_NS_fsm = ap_ST_fsm_state5;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state4;
          end
        end
      end
      ap_ST_fsm_state4: begin
        ap_NS_fsm = ap_ST_fsm_state5;
      end
      ap_ST_fsm_state5: begin
        if((grp_float64_mul_fu_94_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5)) begin
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

  assign a_input_address0 = tmp_fu_116_p1;
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_return = main_result_reg_82;
  assign b_input_address0 = tmp_fu_116_p1;
  assign exitcond_fu_104_p2 = (i_reg_71 == 5'd20)? 1'b1 : 1'b0;
  assign grp_float64_mul_fu_94_ap_start = grp_float64_mul_fu_94_ap_start_reg;
  assign i_1_fu_110_p2 = i_reg_71 + 5'd1;
  assign main_result_1_fu_136_p2 = tmp_2_cast_fu_132_p1 + main_result_reg_82;
  assign tmp_1_fu_126_p2 = (grp_float64_mul_fu_94_ap_return != z_output_q0)? 1'b1 : 1'b0;
  assign tmp_2_cast_fu_132_p1 = tmp_1_fu_126_p2;
  assign tmp_fu_116_p1 = i_reg_71;
  assign z_output_address0 = tmp_reg_150;

  always @(posedge ap_clk) begin
    tmp_reg_150[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
  end


endmodule


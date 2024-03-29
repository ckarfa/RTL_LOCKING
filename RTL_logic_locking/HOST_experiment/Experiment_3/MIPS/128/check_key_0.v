
module check
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

  parameter ap_ST_fsm_state1 = 27'd1;
  parameter ap_ST_fsm_state2 = 27'd2;
  parameter ap_ST_fsm_state3 = 27'd4;
  parameter ap_ST_fsm_state4 = 27'd8;
  parameter ap_ST_fsm_state5 = 27'd16;
  parameter ap_ST_fsm_state6 = 27'd32;
  parameter ap_ST_fsm_state7 = 27'd64;
  parameter ap_ST_fsm_state8 = 27'd128;
  parameter ap_ST_fsm_state9 = 27'd256;
  parameter ap_ST_fsm_state10 = 27'd512;
  parameter ap_ST_fsm_state11 = 27'd1024;
  parameter ap_ST_fsm_state12 = 27'd2048;
  parameter ap_ST_fsm_state13 = 27'd4096;
  parameter ap_ST_fsm_state14 = 27'd8192;
  parameter ap_ST_fsm_state15 = 27'd16384;
  parameter ap_ST_fsm_state16 = 27'd32768;
  parameter ap_ST_fsm_state17 = 27'd65536;
  parameter ap_ST_fsm_state18 = 27'd131072;
  parameter ap_ST_fsm_state19 = 27'd262144;
  parameter ap_ST_fsm_state20 = 27'd524288;
  parameter ap_ST_fsm_state21 = 27'd1048576;
  parameter ap_ST_fsm_state22 = 27'd2097152;
  parameter ap_ST_fsm_state23 = 27'd4194304;
  parameter ap_ST_fsm_state24 = 27'd8388608;
  parameter ap_ST_fsm_state25 = 27'd16777216;
  parameter ap_ST_fsm_state26 = 27'd33554432;
  parameter ap_ST_fsm_state27 = 27'd67108864;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [31:0] ap_return;
  input [127:0] working_key;
  reg ap_done;
  reg ap_idle;
  reg ap_ready;
  reg [26:0] ap_CS_fsm;
  wire ap_CS_fsm_state1;
  wire [2:0] A_address0;
  reg A_ce0;
  wire [6:0] A_q0;
  wire [5:0] imem_address0;
  reg imem_ce0;
  wire [31:0] imem_q0;
  wire [2:0] outData_address0;
  reg outData_ce0;
  wire [6:0] outData_q0;
  wire [31:0] reg_q0;
  reg [31:0] reg_801;
  wire ap_CS_fsm_state11;
  reg [5:0] funct_reg_1787;
  wire [31:0] reg_q1;
  reg [31:0] reg_805;
  wire [5:0] i_2_fu_815_p2;
  wire ap_CS_fsm_state2;
  wire [6:0] i_3_fu_832_p2;
  reg [6:0] i_3_reg_1706;
  wire ap_CS_fsm_state3;
  wire [63:0] tmp_2_fu_838_p1;
  reg [63:0] tmp_2_reg_1711;
  wire [0:0] exitcond1_fu_826_p2;
  reg [31:0] pc_load_reg_1761;
  wire ap_CS_fsm_state5;
  wire signed [15:0] address_fu_878_p1;
  reg signed [15:0] address_reg_1774;
  wire ap_CS_fsm_state6;
  wire [5:0] funct_fu_882_p1;
  wire [31:0] pc_1_fu_886_p2;
  reg [31:0] pc_1_reg_1791;
  wire [5:0] tmp_1_fu_893_p4;
  reg [5:0] tmp_1_reg_1796;
  wire [31:0] n_inst_1_fu_903_p2;
  reg [31:0] n_inst_1_reg_1800;
  wire [31:0] shamt_cast_fu_961_p1;
  reg [31:0] shamt_cast_reg_1806;
  wire [4:0] rd_fu_965_p4;
  reg [4:0] rd_reg_1812;
  wire [4:0] grp_fu_766_p4;
  reg [4:0] rt_reg_1952;
  wire [7:0] tmp_116_fu_1175_p1;
  reg [7:0] tmp_116_reg_2008;
  wire [7:0] tmp_108_fu_1184_p1;
  reg [7:0] tmp_108_reg_2018;
  wire [0:0] tmp_100_fu_1213_p2;
  reg [0:0] tmp_100_reg_2043;
  wire ap_CS_fsm_state8;
  wire [0:0] tmp_95_fu_1219_p2;
  reg [0:0] tmp_95_reg_2048;
  wire [31:0] tmp_91_fu_1225_p2;
  reg [31:0] tmp_91_reg_2053;
  wire [31:0] tmp_87_fu_1231_p2;
  reg [31:0] tmp_87_reg_2058;
  wire [31:0] tmp_83_fu_1237_p2;
  reg [31:0] tmp_83_reg_2063;
  wire [31:0] tmp_80_fu_1242_p2;
  reg [31:0] tmp_80_reg_2068;
  wire [31:0] Lo_2_fu_1326_p1;
  reg [31:0] Lo_2_reg_2073;
  wire ap_CS_fsm_state12;
  reg [31:0] Hi_2_reg_2078;
  wire [31:0] Lo_1_fu_1354_p1;
  reg [31:0] Lo_1_reg_2083;
  reg [31:0] Hi_1_reg_2088;
  wire [31:0] tmp_55_fu_1384_p2;
  reg [31:0] tmp_55_reg_2093;
  wire ap_CS_fsm_state14;
  wire [31:0] tmp_51_fu_1390_p2;
  reg [31:0] tmp_51_reg_2098;
  wire [0:0] tmp_46_fu_1407_p2;
  reg [0:0] tmp_46_reg_2103;
  wire ap_CS_fsm_state16;
  wire [0:0] tmp_41_fu_1416_p2;
  reg [0:0] tmp_41_reg_2108;
  wire ap_CS_fsm_state20;
  wire [31:0] tmp_7_fu_1628_p2;
  reg [31:0] tmp_7_reg_2127;
  wire ap_CS_fsm_state23;
  wire [3:0] main_result_cast_fu_1649_p1;
  wire ap_CS_fsm_state25;
  wire [0:0] tmp_109_fu_1638_p2;
  wire [3:0] j_1_fu_1659_p2;
  reg [3:0] j_1_reg_2143;
  wire ap_CS_fsm_state26;
  wire [0:0] exitcond_fu_1653_p2;
  wire [3:0] main_result_fu_1689_p2;
  wire ap_CS_fsm_state27;
  reg [4:0] reg_address0;
  reg reg_ce0;
  reg reg_we0;
  reg [31:0] reg_d0;
  reg [4:0] reg_address1;
  reg reg_ce1;
  reg reg_we1;
  reg [31:0] reg_d1;
  reg [5:0] dmem_address0;
  reg dmem_ce0;
  reg dmem_we0;
  reg [31:0] dmem_d0;
  wire [31:0] dmem_q0;
  reg [5:0] i_reg_709;
  wire [0:0] exitcond2_fu_809_p2;
  reg [6:0] i_1_reg_720;
  wire ap_CS_fsm_state4;
  reg [31:0] n_inst_reg_731;
  reg [3:0] main_result1_reg_742;
  reg [3:0] j_reg_752;
  wire [63:0] tmp_fu_821_p1;
  wire [63:0] tmp_6_fu_873_p1;
  wire [63:0] tmp_103_fu_975_p1;
  wire [63:0] tmp_98_fu_980_p1;
  wire [63:0] tmp_99_fu_985_p1;
  wire [63:0] tmp_93_fu_990_p1;
  wire [63:0] tmp_94_fu_995_p1;
  wire [63:0] tmp_89_fu_1000_p1;
  wire [63:0] tmp_90_fu_1005_p1;
  wire [63:0] tmp_85_fu_1010_p1;
  wire [63:0] tmp_86_fu_1015_p1;
  wire [63:0] tmp_82_fu_1020_p1;
  wire [63:0] tmp_79_fu_1025_p1;
  wire [63:0] tmp_75_fu_1030_p1;
  wire [63:0] tmp_76_fu_1035_p1;
  wire [63:0] tmp_71_fu_1040_p1;
  wire [63:0] tmp_72_fu_1045_p1;
  wire [63:0] tmp_67_fu_1050_p1;
  wire [63:0] tmp_68_fu_1055_p1;
  wire [63:0] tmp_66_fu_1064_p1;
  wire [63:0] tmp_65_fu_1073_p1;
  wire [63:0] tmp_61_fu_1078_p1;
  wire [63:0] tmp_63_fu_1083_p1;
  wire [63:0] tmp_57_fu_1088_p1;
  wire [63:0] tmp_59_fu_1093_p1;
  wire [63:0] tmp_53_fu_1098_p1;
  wire [63:0] tmp_54_fu_1103_p1;
  wire [63:0] tmp_49_fu_1108_p1;
  wire [63:0] tmp_50_fu_1113_p1;
  wire [63:0] tmp_44_fu_1118_p1;
  wire [63:0] tmp_38_fu_1123_p1;
  wire [63:0] tmp_37_fu_1128_p1;
  wire [63:0] tmp_34_fu_1133_p1;
  wire [63:0] tmp_35_fu_1138_p1;
  wire [63:0] tmp_29_fu_1143_p1;
  wire [63:0] tmp_32_fu_1148_p1;
  wire [63:0] tmp_28_fu_1160_p1;
  wire [63:0] tmp_24_fu_1165_p1;
  wire [63:0] tmp_25_fu_1170_p1;
  wire [63:0] tmp_20_fu_1179_p1;
  wire [63:0] tmp_16_fu_1188_p1;
  wire [63:0] tmp_10_fu_1193_p1;
  wire [63:0] tmp_9_fu_1198_p1;
  wire [63:0] tmp_s_fu_1203_p1;
  wire [63:0] tmp_102_fu_1251_p1;
  wire ap_CS_fsm_state9;
  wire [63:0] tmp_97_fu_1259_p1;
  wire [63:0] tmp_92_fu_1263_p1;
  wire [63:0] tmp_88_fu_1267_p1;
  wire [63:0] tmp_84_fu_1271_p1;
  wire [63:0] tmp_81_fu_1275_p1;
  wire [63:0] tmp_78_fu_1286_p1;
  wire ap_CS_fsm_state10;
  wire [63:0] tmp_74_fu_1297_p1;
  wire [63:0] tmp_70_fu_1308_p1;
  wire [63:0] tmp_56_fu_1396_p1;
  wire ap_CS_fsm_state15;
  wire [63:0] tmp_52_fu_1400_p1;
  wire [63:0] tmp_48_fu_1426_p1;
  wire ap_CS_fsm_state17;
  wire [63:0] tmp_43_fu_1434_p1;
  wire [63:0] tmp_27_fu_1528_p1;
  wire ap_CS_fsm_state19;
  wire [63:0] tmp_22_fu_1552_p1;
  wire [63:0] tmp_23_fu_1557_p1;
  wire ap_CS_fsm_state21;
  wire [63:0] tmp_19_fu_1571_p1;
  wire ap_CS_fsm_state22;
  wire [63:0] tmp_15_fu_1603_p1;
  wire [63:0] tmp_4_fu_1621_p1;
  wire [63:0] tmp_8_fu_1634_p1;
  wire ap_CS_fsm_state24;
  wire [63:0] tmp_112_fu_1665_p1;
  reg [31:0] pc_fu_162;
  wire [31:0] pc_3_cast_fu_921_p1;
  wire [31:0] pc_2_cast_fu_942_p1;
  wire ap_CS_fsm_state7;
  wire [31:0] pc_7_fu_1457_p2;
  wire ap_CS_fsm_state18;
  wire [0:0] tmp_118_fu_1438_p3;
  wire [31:0] pc_6_fu_1478_p2;
  wire [0:0] grp_fu_795_p2;
  wire [31:0] pc_5_fu_1499_p2;
  reg [31:0] Hi_fu_166;
  wire ap_CS_fsm_state13;
  reg [31:0] Lo_fu_170;
  wire [31:0] tmp_117_fu_1153_p2;
  wire [31:0] tmp_101_fu_1247_p1;
  wire [31:0] tmp_96_fu_1255_p1;
  wire [31:0] tmp_77_fu_1279_p2;
  wire [31:0] tmp_73_fu_1290_p2;
  wire [31:0] tmp_69_fu_1301_p2;
  wire [31:0] tmp_47_fu_1422_p1;
  wire [31:0] tmp_42_fu_1430_p1;
  wire [31:0] tmp_18_fu_1564_p2;
  wire [31:0] tmp_14_fu_1594_p3;
  wire [31:0] tmp_18_cast_fu_1616_p1;
  wire signed [31:0] A_load_cast_fu_858_p1;
  wire [5:0] tmp_4_cast_fu_863_p4;
  wire [25:0] tmp_30_fu_909_p1;
  wire [27:0] pc_3_fu_913_p3;
  wire [25:0] tmp_13_fu_930_p1;
  wire [27:0] pc_2_fu_934_p3;
  wire [4:0] shamt_fu_951_p4;
  wire [4:0] grp_fu_776_p4;
  wire [31:0] hilo_1_fu_1320_p0;
  wire [31:0] hilo_1_fu_1320_p1;
  wire [63:0] hilo_1_fu_1320_p2;
  wire signed [31:0] tmp_58_fu_1340_p0;
  wire signed [31:0] tmp_60_fu_1344_p0;
  wire signed [31:0] hilo_fu_1348_p0;
  wire signed [31:0] hilo_fu_1348_p1;
  wire [63:0] hilo_fu_1348_p2;
  wire [31:0] tmp_45_fu_1404_p1;
  wire signed [31:0] tmp_39_fu_1413_p1;
  wire [17:0] tmp_107_fu_1446_p3;
  wire signed [31:0] tmp_125_cast_fu_1453_p1;
  wire [17:0] tmp_105_fu_1467_p3;
  wire signed [31:0] tmp_123_cast_fu_1474_p1;
  wire [17:0] tmp_104_fu_1488_p3;
  wire signed [31:0] tmp_121_cast_fu_1495_p1;
  wire [7:0] tmp_110_fu_1509_p1;
  wire [7:0] tmp_26_fu_1513_p2;
  wire [5:0] tmp_39_cast_fu_1518_p4;
  wire [7:0] tmp_106_fu_1533_p1;
  wire [7:0] tmp_21_fu_1537_p2;
  wire [5:0] tmp_31_cast_fu_1542_p4;
  wire [31:0] tmp_17_fu_1561_p1;
  wire [15:0] tmp_40_fu_1575_p1;
  wire [15:0] tmp_12_fu_1584_p4;
  wire [15:0] tmp_11_fu_1579_p2;
  wire [15:0] tmp_31_fu_1607_p1;
  wire [15:0] tmp_3_fu_1611_p2;
  wire signed [31:0] tmp_5_fu_1625_p1;
  wire [0:0] tmp_111_fu_1644_p2;
  wire signed [31:0] outData_load_cast_fu_1675_p1;
  wire [0:0] tmp_113_fu_1679_p2;
  wire [3:0] tmp_130_cast_fu_1685_p1;
  reg [26:0] ap_NS_fsm;
  wire [63:0] hilo_1_fu_1320_p00;
  wire [63:0] hilo_1_fu_1320_p10;
  wire [5:0] Const_0;
  wire [3:0] Const_1;
  wire [31:0] Const_2;
  wire [31:0] Const_3;
  wire [31:0] Const_4;
  

  initial begin
    #0 ap_CS_fsm = 27'd1;
  end


  check_A
  #(
    .DataWidth(7),
    .AddressRange(8),
    .AddressWidth(3)
  )
  A_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(A_address0),
    .ce0(A_ce0),
    .q0(A_q0)
  );


  check_imem
  #(
    .DataWidth(32),
    .AddressRange(44),
    .AddressWidth(6)
  )
  imem_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(imem_address0),
    .ce0(imem_ce0),
    .q0(imem_q0)
  );


  check_outData
  #(
    .DataWidth(7),
    .AddressRange(8),
    .AddressWidth(3)
  )
  outData_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(outData_address0),
    .ce0(outData_ce0),
    .q0(outData_q0)
  );


  check_reg
  #(
    .DataWidth(32),
    .AddressRange(32),
    .AddressWidth(5)
  )
  reg_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(reg_address0),
    .ce0(reg_ce0),
    .we0(reg_we0),
    .d0(reg_d0),
    .q0(reg_q0),
    .address1(reg_address1),
    .ce1(reg_ce1),
    .we1(reg_we1),
    .d1(reg_d1),
    .q1(reg_q1)
  );


  check_dmem
  #(
    .DataWidth(32),
    .AddressRange(64),
    .AddressWidth(6)
  )
  dmem_U
  (
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(dmem_address0),
    .ce0(dmem_ce0),
    .we0(dmem_we0),
    .d0(dmem_d0),
    .q0(dmem_q0)
  );


  always @(posedge ap_clk) begin
    if(ap_rst == 1'b1) begin
      ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
      ap_CS_fsm <= ap_NS_fsm;
    end
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd24) & (1'b1 == ap_CS_fsm_state13) & (tmp_1_reg_1796 == 6'd0)) begin
      Hi_fu_166 <= Hi_1_reg_2088;
    end else if((funct_reg_1787 == 6'd25) & (1'b1 == ap_CS_fsm_state13) & (tmp_1_reg_1796 == 6'd0)) begin
      Hi_fu_166 <= Hi_2_reg_2078;
    end else if((1'b1 == ap_CS_fsm_state3) & (exitcond1_fu_826_p2 == 1'd1)) begin
      Hi_fu_166 <= 32'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd24) & (1'b1 == ap_CS_fsm_state13) & (tmp_1_reg_1796 == 6'd0)) begin
      Lo_fu_170 <= Lo_1_reg_2083;
    end else if((funct_reg_1787 == 6'd25) & (1'b1 == ap_CS_fsm_state13) & (tmp_1_reg_1796 == 6'd0)) begin
      Lo_fu_170 <= Lo_2_reg_2073;
    end else if((1'b1 == ap_CS_fsm_state3) & (exitcond1_fu_826_p2 == 1'd1)) begin
      Lo_fu_170 <= 32'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state4) begin
      i_1_reg_720 <= i_3_reg_1706;
    end else if((1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_809_p2 == 1'd1)) begin
      i_1_reg_720 <= 7'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_809_p2 == 1'd0)) begin
      i_reg_709 <= i_2_fu_815_p2;
    end else if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
      i_reg_709 <= 6'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state27) begin
      j_reg_752 <= j_1_reg_2143;
    end else if((1'b1 == ap_CS_fsm_state25) & (tmp_109_fu_1638_p2 == 1'd1)) begin
      j_reg_752 <= 4'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state27) begin
      main_result1_reg_742 <= main_result_fu_1689_p2;
    end else if((1'b1 == ap_CS_fsm_state25) & (tmp_109_fu_1638_p2 == 1'd1)) begin
      main_result1_reg_742 <= main_result_cast_fu_1649_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state25) & (tmp_109_fu_1638_p2 == 1'd0)) begin
      n_inst_reg_731 <= n_inst_1_reg_1800;
    end else if((1'b1 == ap_CS_fsm_state3) & (exitcond1_fu_826_p2 == 1'd1)) begin
      n_inst_reg_731 <= 32'd0;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state18) & (tmp_1_reg_1796 == 6'd4) & (grp_fu_795_p2 == 1'd1)) begin
      pc_fu_162 <= pc_5_fu_1499_p2;
    end else if((1'b1 == ap_CS_fsm_state18) & (tmp_1_reg_1796 == 6'd5) & (grp_fu_795_p2 == 1'd0)) begin
      pc_fu_162 <= pc_6_fu_1478_p2;
    end else if((1'b1 == ap_CS_fsm_state18) & (tmp_1_reg_1796 == 6'd4) & (grp_fu_795_p2 == 1'd0) | (1'b1 == ap_CS_fsm_state18) & (tmp_1_reg_1796 == 6'd5) & (grp_fu_795_p2 == 1'd1) | (1'b1 == ap_CS_fsm_state18) & (tmp_1_reg_1796 == 6'd1) & (tmp_118_fu_1438_p3 == 1'd1)) begin
      pc_fu_162 <= pc_1_reg_1791;
    end else if((1'b1 == ap_CS_fsm_state18) & (tmp_1_reg_1796 == 6'd1) & (tmp_118_fu_1438_p3 == 1'd0)) begin
      pc_fu_162 <= pc_7_fu_1457_p2;
    end else if(1'b1 == ap_CS_fsm_state7) begin
      pc_fu_162 <= reg_q0;
    end else if(~(tmp_1_fu_893_p4 == 6'd15) & ~(tmp_1_fu_893_p4 == 6'd9) & ~(tmp_1_fu_893_p4 == 6'd12) & ~(tmp_1_fu_893_p4 == 6'd13) & ~(tmp_1_fu_893_p4 == 6'd14) & ~(tmp_1_fu_893_p4 == 6'd35) & ~(tmp_1_fu_893_p4 == 6'd43) & ~(tmp_1_fu_893_p4 == 6'd4) & ~(tmp_1_fu_893_p4 == 6'd5) & ~(tmp_1_fu_893_p4 == 6'd1) & ~(tmp_1_fu_893_p4 == 6'd10) & ~(tmp_1_fu_893_p4 == 6'd11) & ~(tmp_1_fu_893_p4 == 6'd3) & ~(tmp_1_fu_893_p4 == 6'd2) & ~(tmp_1_fu_893_p4 == 6'd0) & (1'b1 == ap_CS_fsm_state6) | ~(funct_fu_882_p1 == 6'd16) & ~(funct_fu_882_p1 == 6'd18) & ~(funct_fu_882_p1 == 6'd33) & ~(funct_fu_882_p1 == 6'd35) & ~(funct_fu_882_p1 == 6'd24) & ~(funct_fu_882_p1 == 6'd25) & ~(funct_fu_882_p1 == 6'd36) & ~(funct_fu_882_p1 == 6'd37) & ~(funct_fu_882_p1 == 6'd38) & ~(funct_fu_882_p1 == 6'd0) & ~(funct_fu_882_p1 == 6'd2) & ~(funct_fu_882_p1 == 6'd4) & ~(funct_fu_882_p1 == 6'd6) & ~(funct_fu_882_p1 == 6'd42) & ~(funct_fu_882_p1 == 6'd43) & ~(funct_fu_882_p1 == 6'd8) & (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0)) begin
      pc_fu_162 <= 32'd0;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd15) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd9) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd12) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd13) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd14) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd35) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd43) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd10) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd11) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd16) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd18) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd33) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd35) | (funct_fu_882_p1 == 6'd24) & (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) | (funct_fu_882_p1 == 6'd25) & (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd36) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd37) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd38) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd0) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd2) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd4) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd6) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd42) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd43)) begin
      pc_fu_162 <= pc_1_fu_886_p2;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd2)) begin
      pc_fu_162 <= pc_2_cast_fu_942_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd3)) begin
      pc_fu_162 <= pc_3_cast_fu_921_p1;
    end else if((1'b1 == ap_CS_fsm_state3) & (exitcond1_fu_826_p2 == 1'd1)) begin
      pc_fu_162 <= 32'd4194304;
    end 
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd24) & (1'b1 == ap_CS_fsm_state12)) begin
      Hi_1_reg_2088 <= { { hilo_fu_1348_p2[63:32] } };
      Lo_1_reg_2083 <= Lo_1_fu_1354_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd25) & (1'b1 == ap_CS_fsm_state12)) begin
      Hi_2_reg_2078 <= { { hilo_1_fu_1320_p2[63:32] } };
      Lo_2_reg_2073 <= Lo_2_fu_1326_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state6) begin
      address_reg_1774 <= address_fu_878_p1;
      funct_reg_1787 <= funct_fu_882_p1;
      n_inst_1_reg_1800 <= n_inst_1_fu_903_p2;
      pc_1_reg_1791 <= pc_1_fu_886_p2;
      tmp_1_reg_1796 <= { { imem_q0[31:26] } };
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      i_3_reg_1706 <= i_3_fu_832_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state26) begin
      j_1_reg_2143 <= j_1_fu_1659_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      pc_load_reg_1761 <= pc_fu_162;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0)) begin
      rd_reg_1812 <= { { imem_q0[15:11] } };
      shamt_cast_reg_1806[4:0] <= shamt_cast_fu_961_p1[4:0];
    end 
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd24) & (1'b1 == ap_CS_fsm_state11) | (funct_reg_1787 == 6'd25) & (1'b1 == ap_CS_fsm_state11)) begin
      reg_801 <= reg_q0;
      reg_805 <= reg_q1;
    end 
  end


  always @(posedge ap_clk) begin
    if(~(tmp_1_fu_893_p4 == 6'd3) & ~(tmp_1_fu_893_p4 == 6'd2) & ~(tmp_1_fu_893_p4 == 6'd0) & (1'b1 == ap_CS_fsm_state6)) begin
      rt_reg_1952 <= { { imem_q0[20:16] } };
    end 
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd43) & (1'b1 == ap_CS_fsm_state8)) begin
      tmp_100_reg_2043 <= tmp_100_fu_1213_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd35)) begin
      tmp_108_reg_2018 <= tmp_108_fu_1184_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd43)) begin
      tmp_116_reg_2008 <= tmp_116_fu_1175_p1;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state3) & (exitcond1_fu_826_p2 == 1'd0)) begin
      tmp_2_reg_1711[6:0] <= tmp_2_fu_838_p1[6:0];
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state16) & (tmp_1_reg_1796 == 6'd10)) begin
      tmp_41_reg_2108 <= tmp_41_fu_1416_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((1'b1 == ap_CS_fsm_state16) & (tmp_1_reg_1796 == 6'd11)) begin
      tmp_46_reg_2103 <= tmp_46_fu_1407_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd33) & (1'b1 == ap_CS_fsm_state14)) begin
      tmp_51_reg_2098 <= tmp_51_fu_1390_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd35) & (1'b1 == ap_CS_fsm_state14)) begin
      tmp_55_reg_2093 <= tmp_55_fu_1384_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if(1'b1 == ap_CS_fsm_state23) begin
      tmp_7_reg_2127 <= tmp_7_fu_1628_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd0) & (1'b1 == ap_CS_fsm_state8)) begin
      tmp_80_reg_2068 <= tmp_80_fu_1242_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd2) & (1'b1 == ap_CS_fsm_state8)) begin
      tmp_83_reg_2063 <= tmp_83_fu_1237_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd4) & (1'b1 == ap_CS_fsm_state8)) begin
      tmp_87_reg_2058 <= tmp_87_fu_1231_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd6) & (1'b1 == ap_CS_fsm_state8)) begin
      tmp_91_reg_2053 <= tmp_91_fu_1225_p2;
    end 
  end


  always @(posedge ap_clk) begin
    if((funct_reg_1787 == 6'd42) & (1'b1 == ap_CS_fsm_state8)) begin
      tmp_95_reg_2048 <= tmp_95_fu_1219_p2;
    end 
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state3) begin
      A_ce0 = 1'b1;
    end else begin
      A_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state26) & (exitcond_fu_1653_p2 == 1'd1)) begin
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
    if((1'b1 == ap_CS_fsm_state26) & (exitcond_fu_1653_p2 == 1'd1)) begin
      ap_ready = 1'b1;
    end else begin
      ap_ready = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state26) begin
      dmem_address0 = tmp_112_fu_1665_p1;
    end else if(1'b1 == ap_CS_fsm_state20) begin
      dmem_address0 = tmp_22_fu_1552_p1;
    end else if(1'b1 == ap_CS_fsm_state19) begin
      dmem_address0 = tmp_27_fu_1528_p1;
    end else if(1'b1 == ap_CS_fsm_state4) begin
      dmem_address0 = tmp_2_reg_1711;
    end else begin
      dmem_address0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state19) | (1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state26) | (1'b1 == ap_CS_fsm_state20)) begin
      dmem_ce0 = 1'b1;
    end else begin
      dmem_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state19) begin
      dmem_d0 = reg_q0;
    end else if(1'b1 == ap_CS_fsm_state4) begin
      dmem_d0 = A_load_cast_fu_858_p1;
    end else begin
      dmem_d0 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state19) | (1'b1 == ap_CS_fsm_state4)) begin
      dmem_we0 = 1'b1;
    end else begin
      dmem_we0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state5) begin
      imem_ce0 = 1'b1;
    end else begin
      imem_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state26) begin
      outData_ce0 = 1'b1;
    end else begin
      outData_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state24) begin
      reg_address0 = tmp_8_fu_1634_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd9)) begin
      reg_address0 = tmp_s_fu_1203_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd12)) begin
      reg_address0 = tmp_9_fu_1198_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd13)) begin
      reg_address0 = tmp_10_fu_1193_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd14)) begin
      reg_address0 = tmp_16_fu_1188_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd35)) begin
      reg_address0 = tmp_20_fu_1179_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd43)) begin
      reg_address0 = tmp_24_fu_1165_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd15)) begin
      reg_address0 = tmp_28_fu_1160_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd4)) begin
      reg_address0 = tmp_29_fu_1143_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd5)) begin
      reg_address0 = tmp_34_fu_1133_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd1)) begin
      reg_address0 = tmp_37_fu_1128_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd10)) begin
      reg_address0 = tmp_38_fu_1123_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd11)) begin
      reg_address0 = tmp_44_fu_1118_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd33)) begin
      reg_address0 = tmp_49_fu_1108_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd35)) begin
      reg_address0 = tmp_53_fu_1098_p1;
    end else if((funct_fu_882_p1 == 6'd24) & (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0)) begin
      reg_address0 = tmp_57_fu_1088_p1;
    end else if((funct_fu_882_p1 == 6'd25) & (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0)) begin
      reg_address0 = tmp_61_fu_1078_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd16)) begin
      reg_address0 = tmp_65_fu_1073_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd18)) begin
      reg_address0 = tmp_66_fu_1064_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd36)) begin
      reg_address0 = tmp_67_fu_1050_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd37)) begin
      reg_address0 = tmp_71_fu_1040_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd38)) begin
      reg_address0 = tmp_75_fu_1030_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd0)) begin
      reg_address0 = tmp_79_fu_1025_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd2)) begin
      reg_address0 = tmp_82_fu_1020_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd4)) begin
      reg_address0 = tmp_85_fu_1010_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd6)) begin
      reg_address0 = tmp_89_fu_1000_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd42)) begin
      reg_address0 = tmp_93_fu_990_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd43)) begin
      reg_address0 = tmp_98_fu_980_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd8)) begin
      reg_address0 = tmp_103_fu_975_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd3)) begin
      reg_address0 = 64'd31;
    end else if((1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_809_p2 == 1'd1)) begin
      reg_address0 = 64'd29;
    end else if((1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_809_p2 == 1'd0)) begin
      reg_address0 = tmp_fu_821_p1;
    end else begin
      reg_address0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state25) begin
      reg_address1 = 64'd0;
    end else if((1'b1 == ap_CS_fsm_state22) & (tmp_1_reg_1796 == 6'd12)) begin
      reg_address1 = tmp_4_fu_1621_p1;
    end else if((1'b1 == ap_CS_fsm_state22) & (tmp_1_reg_1796 == 6'd13)) begin
      reg_address1 = tmp_15_fu_1603_p1;
    end else if((1'b1 == ap_CS_fsm_state22) & (tmp_1_reg_1796 == 6'd14)) begin
      reg_address1 = tmp_19_fu_1571_p1;
    end else if(1'b1 == ap_CS_fsm_state21) begin
      reg_address1 = tmp_23_fu_1557_p1;
    end else if((1'b1 == ap_CS_fsm_state17) & (tmp_1_reg_1796 == 6'd10)) begin
      reg_address1 = tmp_43_fu_1434_p1;
    end else if((1'b1 == ap_CS_fsm_state17) & (tmp_1_reg_1796 == 6'd11)) begin
      reg_address1 = tmp_48_fu_1426_p1;
    end else if((funct_reg_1787 == 6'd33) & (1'b1 == ap_CS_fsm_state15)) begin
      reg_address1 = tmp_52_fu_1400_p1;
    end else if((funct_reg_1787 == 6'd35) & (1'b1 == ap_CS_fsm_state15)) begin
      reg_address1 = tmp_56_fu_1396_p1;
    end else if((funct_reg_1787 == 6'd36) & (1'b1 == ap_CS_fsm_state10)) begin
      reg_address1 = tmp_70_fu_1308_p1;
    end else if((funct_reg_1787 == 6'd37) & (1'b1 == ap_CS_fsm_state10)) begin
      reg_address1 = tmp_74_fu_1297_p1;
    end else if((funct_reg_1787 == 6'd38) & (1'b1 == ap_CS_fsm_state10)) begin
      reg_address1 = tmp_78_fu_1286_p1;
    end else if((funct_reg_1787 == 6'd0) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_address1 = tmp_81_fu_1275_p1;
    end else if((funct_reg_1787 == 6'd2) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_address1 = tmp_84_fu_1271_p1;
    end else if((funct_reg_1787 == 6'd4) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_address1 = tmp_88_fu_1267_p1;
    end else if((funct_reg_1787 == 6'd6) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_address1 = tmp_92_fu_1263_p1;
    end else if((funct_reg_1787 == 6'd42) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_address1 = tmp_97_fu_1259_p1;
    end else if((funct_reg_1787 == 6'd43) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_address1 = tmp_102_fu_1251_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd43)) begin
      reg_address1 = tmp_25_fu_1170_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd4)) begin
      reg_address1 = tmp_32_fu_1148_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd5)) begin
      reg_address1 = tmp_35_fu_1138_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd33)) begin
      reg_address1 = tmp_50_fu_1113_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd35)) begin
      reg_address1 = tmp_54_fu_1103_p1;
    end else if((funct_fu_882_p1 == 6'd24) & (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0)) begin
      reg_address1 = tmp_59_fu_1093_p1;
    end else if((funct_fu_882_p1 == 6'd25) & (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0)) begin
      reg_address1 = tmp_63_fu_1083_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd36)) begin
      reg_address1 = tmp_68_fu_1055_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd37)) begin
      reg_address1 = tmp_72_fu_1045_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd38)) begin
      reg_address1 = tmp_76_fu_1035_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd4)) begin
      reg_address1 = tmp_86_fu_1015_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd6)) begin
      reg_address1 = tmp_90_fu_1005_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd42)) begin
      reg_address1 = tmp_94_fu_995_p1;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd43)) begin
      reg_address1 = tmp_99_fu_985_p1;
    end else begin
      reg_address1 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state24) | (1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_809_p2 == 1'd1) | (1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_809_p2 == 1'd0) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd15) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd9) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd12) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd13) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd14) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd35) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd43) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd4) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd5) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd1) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd10) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd11) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd3) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd16) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd18) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd33) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd35) | (funct_fu_882_p1 == 6'd24) & (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) | (funct_fu_882_p1 == 6'd25) & (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd36) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd37) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd38) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd0) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd2) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd4) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd6) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd42) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd43) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd8)) begin
      reg_ce0 = 1'b1;
    end else begin
      reg_ce0 = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state25) | (1'b1 == ap_CS_fsm_state22) & (tmp_1_reg_1796 == 6'd12) | (1'b1 == ap_CS_fsm_state22) & (tmp_1_reg_1796 == 6'd13) | (1'b1 == ap_CS_fsm_state22) & (tmp_1_reg_1796 == 6'd14) | (funct_reg_1787 == 6'd36) & (1'b1 == ap_CS_fsm_state10) | (funct_reg_1787 == 6'd37) & (1'b1 == ap_CS_fsm_state10) | (funct_reg_1787 == 6'd38) & (1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state17) & (tmp_1_reg_1796 == 6'd10) | (1'b1 == ap_CS_fsm_state17) & (tmp_1_reg_1796 == 6'd11) | (funct_reg_1787 == 6'd33) & (1'b1 == ap_CS_fsm_state15) | (funct_reg_1787 == 6'd35) & (1'b1 == ap_CS_fsm_state15) | (funct_reg_1787 == 6'd0) & (1'b1 == ap_CS_fsm_state9) | (funct_reg_1787 == 6'd2) & (1'b1 == ap_CS_fsm_state9) | (funct_reg_1787 == 6'd4) & (1'b1 == ap_CS_fsm_state9) | (funct_reg_1787 == 6'd6) & (1'b1 == ap_CS_fsm_state9) | (funct_reg_1787 == 6'd42) & (1'b1 == ap_CS_fsm_state9) | (funct_reg_1787 == 6'd43) & (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd43) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd4) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd5) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd33) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd35) | (funct_fu_882_p1 == 6'd24) & (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) | (funct_fu_882_p1 == 6'd25) & (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd36) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd37) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd38) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd4) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd6) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd42) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd43)) begin
      reg_ce1 = 1'b1;
    end else begin
      reg_ce1 = 1'b0;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state24) begin
      reg_d0 = tmp_7_reg_2127;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd15)) begin
      reg_d0 = tmp_117_fu_1153_p2;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd16)) begin
      reg_d0 = Hi_fu_166;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd18)) begin
      reg_d0 = Lo_fu_170;
    end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd3)) begin
      reg_d0 = pc_1_fu_886_p2;
    end else if((1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_809_p2 == 1'd1)) begin
      reg_d0 = 32'd2147479548;
    end else if((1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_809_p2 == 1'd0)) begin
      reg_d0 = 32'd0;
    end else begin
      reg_d0 = 'bx;
    end
  end


  always @(*) begin
    if(1'b1 == ap_CS_fsm_state25) begin
      reg_d1 = 32'd0;
    end else if((1'b1 == ap_CS_fsm_state22) & (tmp_1_reg_1796 == 6'd12)) begin
      reg_d1 = tmp_18_cast_fu_1616_p1;
    end else if((1'b1 == ap_CS_fsm_state22) & (tmp_1_reg_1796 == 6'd13)) begin
      reg_d1 = tmp_14_fu_1594_p3;
    end else if((1'b1 == ap_CS_fsm_state22) & (tmp_1_reg_1796 == 6'd14)) begin
      reg_d1 = tmp_18_fu_1564_p2;
    end else if(1'b1 == ap_CS_fsm_state21) begin
      reg_d1 = dmem_q0;
    end else if((1'b1 == ap_CS_fsm_state17) & (tmp_1_reg_1796 == 6'd10)) begin
      reg_d1 = tmp_42_fu_1430_p1;
    end else if((1'b1 == ap_CS_fsm_state17) & (tmp_1_reg_1796 == 6'd11)) begin
      reg_d1 = tmp_47_fu_1422_p1;
    end else if((funct_reg_1787 == 6'd33) & (1'b1 == ap_CS_fsm_state15)) begin
      reg_d1 = tmp_51_reg_2098;
    end else if((funct_reg_1787 == 6'd35) & (1'b1 == ap_CS_fsm_state15)) begin
      reg_d1 = tmp_55_reg_2093;
    end else if((funct_reg_1787 == 6'd36) & (1'b1 == ap_CS_fsm_state10)) begin
      reg_d1 = tmp_69_fu_1301_p2;
    end else if((funct_reg_1787 == 6'd37) & (1'b1 == ap_CS_fsm_state10)) begin
      reg_d1 = tmp_73_fu_1290_p2;
    end else if((funct_reg_1787 == 6'd38) & (1'b1 == ap_CS_fsm_state10)) begin
      reg_d1 = tmp_77_fu_1279_p2;
    end else if((funct_reg_1787 == 6'd0) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_d1 = tmp_80_reg_2068;
    end else if((funct_reg_1787 == 6'd2) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_d1 = tmp_83_reg_2063;
    end else if((funct_reg_1787 == 6'd4) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_d1 = tmp_87_reg_2058;
    end else if((funct_reg_1787 == 6'd6) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_d1 = tmp_91_reg_2053;
    end else if((funct_reg_1787 == 6'd42) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_d1 = tmp_96_fu_1255_p1;
    end else if((funct_reg_1787 == 6'd43) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_d1 = tmp_101_fu_1247_p1;
    end else begin
      reg_d1 = 'bx;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state24) | (1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_809_p2 == 1'd1) | (1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_809_p2 == 1'd0) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd15) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd3) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd16) | (1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd18)) begin
      reg_we0 = 1'b1;
    end else begin
      reg_we0 = 1'b0;
    end
  end


  always @(*) begin
    if((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state25) | (1'b1 == ap_CS_fsm_state22) & (tmp_1_reg_1796 == 6'd12) | (1'b1 == ap_CS_fsm_state22) & (tmp_1_reg_1796 == 6'd13) | (1'b1 == ap_CS_fsm_state22) & (tmp_1_reg_1796 == 6'd14) | (funct_reg_1787 == 6'd36) & (1'b1 == ap_CS_fsm_state10) | (funct_reg_1787 == 6'd37) & (1'b1 == ap_CS_fsm_state10) | (funct_reg_1787 == 6'd38) & (1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state17) & (tmp_1_reg_1796 == 6'd10) | (1'b1 == ap_CS_fsm_state17) & (tmp_1_reg_1796 == 6'd11) | (funct_reg_1787 == 6'd33) & (1'b1 == ap_CS_fsm_state15) | (funct_reg_1787 == 6'd35) & (1'b1 == ap_CS_fsm_state15) | (funct_reg_1787 == 6'd0) & (1'b1 == ap_CS_fsm_state9) | (funct_reg_1787 == 6'd2) & (1'b1 == ap_CS_fsm_state9) | (funct_reg_1787 == 6'd4) & (1'b1 == ap_CS_fsm_state9) | (funct_reg_1787 == 6'd6) & (1'b1 == ap_CS_fsm_state9) | (funct_reg_1787 == 6'd42) & (1'b1 == ap_CS_fsm_state9) | (funct_reg_1787 == 6'd43) & (1'b1 == ap_CS_fsm_state9)) begin
      reg_we1 = 1'b1;
    end else begin
      reg_we1 = 1'b0;
    end
  end


  always @(*) begin
    case(ap_CS_fsm)
      ap_ST_fsm_state1: begin
        if((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)) begin
          if(working_key[0] == 1'b1 & n_inst_1_reg_1800[1:0] == 2'b11) begin
            ap_NS_fsm = ap_ST_fsm_state25;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state2;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end
      end
      ap_ST_fsm_state2: begin
        if((1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_809_p2 == 1'd1)) begin
          if(working_key[1] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state12;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state3;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state2;
        end
      end
      ap_ST_fsm_state3: begin
        if((1'b1 == ap_CS_fsm_state3) & (exitcond1_fu_826_p2 == 1'd1)) begin
          if(working_key[2] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state16;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state5;
          end
        end else begin
          ap_NS_fsm = ap_ST_fsm_state4;
        end
      end
      ap_ST_fsm_state4: begin
        begin
          if(working_key[3] == 1'b1 & n_inst_1_reg_1800[3:2] == 2'b11) begin
            ap_NS_fsm = ap_ST_fsm_state15;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state3;
          end
        end
      end
      ap_ST_fsm_state5: begin
        begin
          if(working_key[4] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state8;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state6;
          end
        end
      end
      ap_ST_fsm_state6: begin
        if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd9)) begin
          if(working_key[5] == 1'b1 & n_inst_1_reg_1800[5:4] == 2'b11) begin
            ap_NS_fsm = ap_ST_fsm_state9;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state23;
          end
        end else if((1'b1 == ap_CS_fsm_state6) & ((tmp_1_fu_893_p4 == 6'd12) | ((tmp_1_fu_893_p4 == 6'd13) | (tmp_1_fu_893_p4 == 6'd14)))) begin
          ap_NS_fsm = ap_ST_fsm_state22;
        end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd35)) begin
          ap_NS_fsm = ap_ST_fsm_state20;
        end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd43)) begin
          ap_NS_fsm = ap_ST_fsm_state19;
        end else if((1'b1 == ap_CS_fsm_state6) & ((tmp_1_fu_893_p4 == 6'd1) | ((tmp_1_fu_893_p4 == 6'd5) | (tmp_1_fu_893_p4 == 6'd4)))) begin
          ap_NS_fsm = ap_ST_fsm_state18;
        end else if((1'b1 == ap_CS_fsm_state6) & ((tmp_1_fu_893_p4 == 6'd10) | (tmp_1_fu_893_p4 == 6'd11))) begin
          ap_NS_fsm = ap_ST_fsm_state16;
        end else if((1'b1 == ap_CS_fsm_state6) & ((tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd33) | (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd35))) begin
          ap_NS_fsm = ap_ST_fsm_state14;
        end else if((1'b1 == ap_CS_fsm_state6) & ((funct_fu_882_p1 == 6'd24) & (tmp_1_fu_893_p4 == 6'd0) | (funct_fu_882_p1 == 6'd25) & (tmp_1_fu_893_p4 == 6'd0))) begin
          ap_NS_fsm = ap_ST_fsm_state11;
        end else if((1'b1 == ap_CS_fsm_state6) & ((tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd37) | (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd38) | (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd36))) begin
          ap_NS_fsm = ap_ST_fsm_state10;
        end else if((1'b1 == ap_CS_fsm_state6) & ((tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd42) | (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd43) | (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd6) | (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd4) | (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd2) | (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd0))) begin
          ap_NS_fsm = ap_ST_fsm_state8;
        end else if((1'b1 == ap_CS_fsm_state6) & (tmp_1_fu_893_p4 == 6'd0) & (funct_fu_882_p1 == 6'd8)) begin
          ap_NS_fsm = ap_ST_fsm_state7;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state13;
        end
      end
      ap_ST_fsm_state7: begin
        begin
          if(working_key[6] == 1'b1 & n_inst_1_reg_1800[9:8] == 2'b11) begin
            ap_NS_fsm = ap_ST_fsm_state11;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state13;
          end
        end
      end
      ap_ST_fsm_state8: begin
        begin
          if(working_key[7] == 1'b1 & n_inst_1_reg_1800[11:10] == 2'b11) begin
            ap_NS_fsm = ap_ST_fsm_state17;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state9;
          end
        end
      end
      ap_ST_fsm_state9: begin
        begin
          if(working_key[8] == 1'b1 & n_inst_1_reg_1800[13:12] == 2'b11) begin
            ap_NS_fsm = ap_ST_fsm_state10;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state13;
          end
        end
      end
      ap_ST_fsm_state10: begin
        begin
          if(working_key[9] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state18;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state13;
          end
        end
      end
      ap_ST_fsm_state11: begin
        begin
          if(working_key[10] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state17;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state12;
          end
        end
      end
      ap_ST_fsm_state12: begin
        begin
          if(working_key[11] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state21;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state13;
          end
        end
      end
      ap_ST_fsm_state13: begin
        begin
          if(working_key[12] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state15;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state25;
          end
        end
      end
      ap_ST_fsm_state14: begin
        begin
          if(working_key[13] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state27;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state15;
          end
        end
      end
      ap_ST_fsm_state15: begin
        begin
          if(working_key[14] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state16;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state13;
          end
        end
      end
      ap_ST_fsm_state16: begin
        begin
          if(working_key[15] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state22;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state17;
          end
        end
      end
      ap_ST_fsm_state17: begin
        begin
          if(working_key[16] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state20;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state13;
          end
        end
      end
      ap_ST_fsm_state18: begin
        begin
          if(working_key[17] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state20;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state13;
          end
        end
      end
      ap_ST_fsm_state19: begin
        begin
          if(working_key[18] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state22;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state13;
          end
        end
      end
      ap_ST_fsm_state20: begin
        begin
          if(working_key[19] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state24;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state21;
          end
        end
      end
      ap_ST_fsm_state21: begin
        begin
          if(working_key[20] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state26;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state13;
          end
        end
      end
      ap_ST_fsm_state22: begin
        begin
          if(working_key[21] == 1'b1) begin
            ap_NS_fsm = ap_ST_fsm_state27;
          end else begin
            ap_NS_fsm = ap_ST_fsm_state13;
          end
        end
      end
      ap_ST_fsm_state23: begin
        ap_NS_fsm = ap_ST_fsm_state24;
      end
      ap_ST_fsm_state24: begin
        ap_NS_fsm = ap_ST_fsm_state13;
      end
      ap_ST_fsm_state25: begin
        if((1'b1 == ap_CS_fsm_state25) & (tmp_109_fu_1638_p2 == 1'd1)) begin
          ap_NS_fsm = ap_ST_fsm_state26;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state5;
        end
      end
      ap_ST_fsm_state26: begin
        if((1'b1 == ap_CS_fsm_state26) & (exitcond_fu_1653_p2 == 1'd1)) begin
          ap_NS_fsm = ap_ST_fsm_state1;
        end else begin
          ap_NS_fsm = ap_ST_fsm_state27;
        end
      end
      ap_ST_fsm_state27: begin
        ap_NS_fsm = ap_ST_fsm_state26;
      end
      default: begin
        ap_NS_fsm = 'bx;
      end
    endcase
  end

  assign A_address0 = tmp_2_fu_838_p1;
  assign A_load_cast_fu_858_p1 = A_q0;
  assign Lo_1_fu_1354_p1 = hilo_fu_1348_p2[31:0];
  assign Lo_2_fu_1326_p1 = hilo_1_fu_1320_p2[31:0];
  assign address_fu_878_p1 = imem_q0[15:0];
  assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
  assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];
  assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];
  assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];
  assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];
  assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];
  assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];
  assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];
  assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];
  assign ap_CS_fsm_state18 = ap_CS_fsm[32'd17];
  assign ap_CS_fsm_state19 = ap_CS_fsm[32'd18];
  assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
  assign ap_CS_fsm_state20 = ap_CS_fsm[32'd19];
  assign ap_CS_fsm_state21 = ap_CS_fsm[32'd20];
  assign ap_CS_fsm_state22 = ap_CS_fsm[32'd21];
  assign ap_CS_fsm_state23 = ap_CS_fsm[32'd22];
  assign ap_CS_fsm_state24 = ap_CS_fsm[32'd23];
  assign ap_CS_fsm_state25 = ap_CS_fsm[32'd24];
  assign ap_CS_fsm_state26 = ap_CS_fsm[32'd25];
  assign ap_CS_fsm_state27 = ap_CS_fsm[32'd26];
  assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
  assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
  assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
  assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
  assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
  assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
  assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
  assign ap_return = main_result1_reg_742;
  assign exitcond1_fu_826_p2 = (i_1_reg_720 == 7'd64)? 1'b1 : 1'b0;
  assign Const_0 = 6'd10 ^ working_key[27:22];
  assign exitcond2_fu_809_p2 = (i_reg_709 == Const_0)? 1'b1 : 1'b0;
  assign Const_1 = 4'd2 ^ working_key[31:28];
  assign exitcond_fu_1653_p2 = (j_reg_752 == Const_1)? 1'b1 : 1'b0;
  assign funct_fu_882_p1 = imem_q0[5:0];
  assign grp_fu_766_p4 = { { imem_q0[20:16] } };
  assign grp_fu_776_p4 = { { imem_q0[25:21] } };
  assign grp_fu_795_p2 = (reg_q0 == reg_q1)? 1'b1 : 1'b0;
  assign hilo_1_fu_1320_p0 = hilo_1_fu_1320_p00;
  assign hilo_1_fu_1320_p00 = reg_801;
  assign hilo_1_fu_1320_p1 = hilo_1_fu_1320_p10;
  assign hilo_1_fu_1320_p10 = reg_805;
  assign hilo_1_fu_1320_p2 = hilo_1_fu_1320_p0 * hilo_1_fu_1320_p1;
  assign hilo_fu_1348_p0 = tmp_58_fu_1340_p0;
  assign hilo_fu_1348_p1 = tmp_60_fu_1344_p0;
  assign hilo_fu_1348_p2 = hilo_fu_1348_p0 * hilo_fu_1348_p1;
  assign i_2_fu_815_p2 = i_reg_709 + 6'd1;
  assign i_3_fu_832_p2 = i_1_reg_720 + 7'd1;
  assign imem_address0 = tmp_6_fu_873_p1;
  assign j_1_fu_1659_p2 = j_reg_752 + 4'd1;
  assign main_result_cast_fu_1649_p1 = tmp_111_fu_1644_p2;
  assign main_result_fu_1689_p2 = tmp_130_cast_fu_1685_p1 + main_result1_reg_742;
  assign Const_2 = 32'd3545535915 ^ working_key[63:32];
  assign n_inst_1_fu_903_p2 = Const_2 + n_inst_reg_731;
  assign outData_address0 = tmp_112_fu_1665_p1;
  assign outData_load_cast_fu_1675_p1 = outData_q0;
  assign Const_3 = (32'd3545535918 ^ working_key[95:64]);
  assign pc_1_fu_886_p2 = Const_3 + pc_load_reg_1761;
  assign pc_2_cast_fu_942_p1 = pc_2_fu_934_p3;
  assign pc_2_fu_934_p3 = { { tmp_13_fu_930_p1 }, { 2'd0 } };
  assign pc_3_cast_fu_921_p1 = pc_3_fu_913_p3;
  assign pc_3_fu_913_p3 = { { tmp_30_fu_909_p1 }, { 2'd0 } };
  assign pc_5_fu_1499_p2 = pc_load_reg_1761 + tmp_121_cast_fu_1495_p1;
  assign pc_6_fu_1478_p2 = pc_load_reg_1761 + tmp_123_cast_fu_1474_p1;
  assign pc_7_fu_1457_p2 = pc_load_reg_1761 + tmp_125_cast_fu_1453_p1;
  assign rd_fu_965_p4 = { { imem_q0[15:11] } };
  assign shamt_cast_fu_961_p1 = shamt_fu_951_p4;
  assign shamt_fu_951_p4 = { { imem_q0[10:6] } };
  assign tmp_100_fu_1213_p2 = (reg_q0 < reg_q1)? 1'b1 : 1'b0;
  assign tmp_101_fu_1247_p1 = tmp_100_reg_2043;
  assign tmp_102_fu_1251_p1 = rd_reg_1812;
  assign tmp_103_fu_975_p1 = grp_fu_776_p4;
  assign tmp_104_fu_1488_p3 = { { address_reg_1774 }, { 2'd0 } };
  assign tmp_105_fu_1467_p3 = { { address_reg_1774 }, { 2'd0 } };
  assign tmp_106_fu_1533_p1 = reg_q0[7:0];
  assign tmp_107_fu_1446_p3 = { { address_reg_1774 }, { 2'd0 } };
  assign tmp_108_fu_1184_p1 = imem_q0[7:0];
  assign Const_4 = (32'd2796104533 ^ working_key[127:96]);
  assign tmp_109_fu_1638_p2 = (pc_fu_162 == Const_4)? 1'b1 : 1'b0;
  assign tmp_10_fu_1193_p1 = grp_fu_776_p4;
  assign tmp_110_fu_1509_p1 = reg_q1[7:0];
  assign tmp_111_fu_1644_p2 = (n_inst_1_reg_1800 != 32'd611)? 1'b1 : 1'b0;
  assign tmp_112_fu_1665_p1 = j_reg_752;
  assign tmp_113_fu_1679_p2 = (dmem_q0 != outData_load_cast_fu_1675_p1)? 1'b1 : 1'b0;
  assign tmp_116_fu_1175_p1 = imem_q0[7:0];
  assign tmp_117_fu_1153_p2 = imem_q0 << 32'd16;
  assign tmp_118_fu_1438_p3 = reg_q0[32'd31];
  assign tmp_11_fu_1579_p2 = tmp_40_fu_1575_p1 | address_reg_1774;
  assign tmp_121_cast_fu_1495_p1 = $signed(tmp_104_fu_1488_p3);
  assign tmp_123_cast_fu_1474_p1 = $signed(tmp_105_fu_1467_p3);
  assign tmp_125_cast_fu_1453_p1 = $signed(tmp_107_fu_1446_p3);
  assign tmp_12_fu_1584_p4 = { { reg_q0[31:16] } };
  assign tmp_130_cast_fu_1685_p1 = tmp_113_fu_1679_p2;
  assign tmp_13_fu_930_p1 = imem_q0[25:0];
  assign tmp_14_fu_1594_p3 = { { tmp_12_fu_1584_p4 }, { tmp_11_fu_1579_p2 } };
  assign tmp_15_fu_1603_p1 = rt_reg_1952;
  assign tmp_16_fu_1188_p1 = grp_fu_776_p4;
  assign tmp_17_fu_1561_p1 = $unsigned(address_reg_1774);
  assign tmp_18_cast_fu_1616_p1 = tmp_3_fu_1611_p2;
  assign tmp_18_fu_1564_p2 = tmp_17_fu_1561_p1 ^ reg_q0;
  assign tmp_19_fu_1571_p1 = rt_reg_1952;
  assign tmp_1_fu_893_p4 = { { imem_q0[31:26] } };
  assign tmp_20_fu_1179_p1 = grp_fu_776_p4;
  assign tmp_21_fu_1537_p2 = tmp_108_reg_2018 + tmp_106_fu_1533_p1;
  assign tmp_22_fu_1552_p1 = tmp_31_cast_fu_1542_p4;
  assign tmp_23_fu_1557_p1 = rt_reg_1952;
  assign tmp_24_fu_1165_p1 = grp_fu_766_p4;
  assign tmp_25_fu_1170_p1 = grp_fu_776_p4;
  assign tmp_26_fu_1513_p2 = tmp_116_reg_2008 + tmp_110_fu_1509_p1;
  assign tmp_27_fu_1528_p1 = tmp_39_cast_fu_1518_p4;
  assign tmp_28_fu_1160_p1 = grp_fu_766_p4;
  assign tmp_29_fu_1143_p1 = grp_fu_776_p4;
  assign tmp_2_fu_838_p1 = i_1_reg_720;
  assign tmp_30_fu_909_p1 = imem_q0[25:0];
  assign tmp_31_cast_fu_1542_p4 = { { tmp_21_fu_1537_p2[7:2] } };
  assign tmp_31_fu_1607_p1 = reg_q0[15:0];
  assign tmp_32_fu_1148_p1 = grp_fu_766_p4;
  assign tmp_34_fu_1133_p1 = grp_fu_776_p4;
  assign tmp_35_fu_1138_p1 = grp_fu_766_p4;
  assign tmp_37_fu_1128_p1 = grp_fu_776_p4;
  assign tmp_38_fu_1123_p1 = grp_fu_776_p4;
  assign tmp_39_cast_fu_1518_p4 = { { tmp_26_fu_1513_p2[7:2] } };
  assign tmp_39_fu_1413_p1 = address_reg_1774;
  assign tmp_3_fu_1611_p2 = tmp_31_fu_1607_p1 & address_reg_1774;
  assign tmp_40_fu_1575_p1 = reg_q0[15:0];
  assign tmp_41_fu_1416_p2 = ($signed(reg_q0) < $signed(tmp_39_fu_1413_p1))? 1'b1 : 1'b0;
  assign tmp_42_fu_1430_p1 = tmp_41_reg_2108;
  assign tmp_43_fu_1434_p1 = rt_reg_1952;
  assign tmp_44_fu_1118_p1 = grp_fu_776_p4;
  assign tmp_45_fu_1404_p1 = $unsigned(address_reg_1774);
  assign tmp_46_fu_1407_p2 = (reg_q0 < tmp_45_fu_1404_p1)? 1'b1 : 1'b0;
  assign tmp_47_fu_1422_p1 = tmp_46_reg_2103;
  assign tmp_48_fu_1426_p1 = rt_reg_1952;
  assign tmp_49_fu_1108_p1 = grp_fu_776_p4;
  assign tmp_4_cast_fu_863_p4 = { { pc_fu_162[7:2] } };
  assign tmp_4_fu_1621_p1 = rt_reg_1952;
  assign tmp_50_fu_1113_p1 = grp_fu_766_p4;
  assign tmp_51_fu_1390_p2 = reg_q1 + reg_q0;
  assign tmp_52_fu_1400_p1 = rd_reg_1812;
  assign tmp_53_fu_1098_p1 = grp_fu_776_p4;
  assign tmp_54_fu_1103_p1 = grp_fu_766_p4;
  assign tmp_55_fu_1384_p2 = reg_q0 - reg_q1;
  assign tmp_56_fu_1396_p1 = rd_reg_1812;
  assign tmp_57_fu_1088_p1 = grp_fu_776_p4;
  assign tmp_58_fu_1340_p0 = reg_801;
  assign tmp_59_fu_1093_p1 = grp_fu_766_p4;
  assign tmp_5_fu_1625_p1 = address_reg_1774;
  assign tmp_60_fu_1344_p0 = reg_805;
  assign tmp_61_fu_1078_p1 = grp_fu_776_p4;
  assign tmp_63_fu_1083_p1 = grp_fu_766_p4;
  assign tmp_65_fu_1073_p1 = rd_fu_965_p4;
  assign tmp_66_fu_1064_p1 = rd_fu_965_p4;
  assign tmp_67_fu_1050_p1 = grp_fu_776_p4;
  assign tmp_68_fu_1055_p1 = grp_fu_766_p4;
  assign tmp_69_fu_1301_p2 = reg_q1 & reg_q0;
  assign tmp_6_fu_873_p1 = tmp_4_cast_fu_863_p4;
  assign tmp_70_fu_1308_p1 = rd_reg_1812;
  assign tmp_71_fu_1040_p1 = grp_fu_776_p4;
  assign tmp_72_fu_1045_p1 = grp_fu_766_p4;
  assign tmp_73_fu_1290_p2 = reg_q1 | reg_q0;
  assign tmp_74_fu_1297_p1 = rd_reg_1812;
  assign tmp_75_fu_1030_p1 = grp_fu_776_p4;
  assign tmp_76_fu_1035_p1 = grp_fu_766_p4;
  assign tmp_77_fu_1279_p2 = reg_q1 ^ reg_q0;
  assign tmp_78_fu_1286_p1 = rd_reg_1812;
  assign tmp_79_fu_1025_p1 = grp_fu_766_p4;
  assign tmp_7_fu_1628_p2 = $signed(reg_q0) + $signed(tmp_5_fu_1625_p1);
  assign tmp_80_fu_1242_p2 = reg_q0 << shamt_cast_reg_1806;
  assign tmp_81_fu_1275_p1 = rd_reg_1812;
  assign tmp_82_fu_1020_p1 = grp_fu_766_p4;
  assign tmp_83_fu_1237_p2 = $signed(reg_q0) >>> shamt_cast_reg_1806;
  assign tmp_84_fu_1271_p1 = rd_reg_1812;
  assign tmp_85_fu_1010_p1 = grp_fu_766_p4;
  assign tmp_86_fu_1015_p1 = grp_fu_776_p4;
  assign tmp_87_fu_1231_p2 = reg_q0 << reg_q1;
  assign tmp_88_fu_1267_p1 = rd_reg_1812;
  assign tmp_89_fu_1000_p1 = grp_fu_766_p4;
  assign tmp_8_fu_1634_p1 = rt_reg_1952;
  assign tmp_90_fu_1005_p1 = grp_fu_776_p4;
  assign tmp_91_fu_1225_p2 = $signed(reg_q0) >>> reg_q1;
  assign tmp_92_fu_1263_p1 = rd_reg_1812;
  assign tmp_93_fu_990_p1 = grp_fu_776_p4;
  assign tmp_94_fu_995_p1 = grp_fu_766_p4;
  assign tmp_95_fu_1219_p2 = ($signed(reg_q0) < $signed(reg_q1))? 1'b1 : 1'b0;
  assign tmp_96_fu_1255_p1 = tmp_95_reg_2048;
  assign tmp_97_fu_1259_p1 = rd_reg_1812;
  assign tmp_98_fu_980_p1 = grp_fu_776_p4;
  assign tmp_99_fu_985_p1 = grp_fu_766_p4;
  assign tmp_9_fu_1198_p1 = grp_fu_776_p4;
  assign tmp_fu_821_p1 = i_reg_709;
  assign tmp_s_fu_1203_p1 = grp_fu_776_p4;

  always @(posedge ap_clk) begin
    tmp_2_reg_1711[63:7] <= 57'b000000000000000000000000000000000000000000000000000000000;
    shamt_cast_reg_1806[31:5] <= 27'b000000000000000000000000000;
  end

  
endmodule


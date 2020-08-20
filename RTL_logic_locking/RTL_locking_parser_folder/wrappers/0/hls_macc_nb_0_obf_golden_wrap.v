
module hls_macc_nb
(
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  o1,
  o1_ap_vld,
  o2,
  o2_ap_vld,
  o3,
  o3_ap_vld,
  o4,
  o4_ap_vld,
  G1,
  G2,
  G3,
  G4,
  GG1,
  GG2
);

  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [31:0] i1;
  input [31:0] i2;
  input [31:0] i3;
  input [31:0] i4;
  input [31:0] i5;
  input [31:0] i6;
  output [31:0] o1;
  output o1_ap_vld;
  output [31:0] o2;
  output o2_ap_vld;
  output [31:0] o3;
  output o3_ap_vld;
  output [31:0] o4;
  output o4_ap_vld;
  input [31:0] G1;
  input [31:0] G2;
  input [31:0] G3;
  input [31:0] G4;
  input [31:0] GG1;
  input [31:0] GG2;

  hls_macc_nb_0_obf
  i0
  (
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .i4(i4),
    .i5(i5),
    .i6(i6),
    .o1(o1),
    .o1_ap_vld(o1_ap_vld),
    .o2(o2),
    .o2_ap_vld(o2_ap_vld),
    .o3(o3),
    .o3_ap_vld(o3_ap_vld),
    .o4(o4),
    .o4_ap_vld(o4_ap_vld),
    .G1(G1),
    .G2(G2),
    .G3(G3),
    .G4(G4),
    .GG1(GG1),
    .GG2(GG2),
    .working_key(3071'b11001010101010101010101010000010101010101010101010010101011111110100110101010010010101101010101110100110101010010010101101010100110010101010101010101010100000101010101010101010100101010111111101001101010100100101011010101011101001101010100100101011010111101100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101010011001010101010101010101010000010101010101010101010010101011111110100110101010010010101101010101110100110101010010010101101001100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101010011001010101010101010101010000010101010101010101010010101011111110100110101010010010101101010101110100110101010010010101101011110110010101010101010101010100000101010101010101010100101010111111101001101010100100101011010101011101001101010100100101011010101001100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101111111101100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101010011001010101010101010101010000010101010101010101010010101011111110100110101010010010101101010101110100110101010010010101101011110110010101010101010101010100000101010101010101010100101010111111101001101010100100101011010101011101001101010100100101011010101001100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101111011001010101010101010101010000010101010101010101010010101011111110100110101010010010101101010101110100110101010010010101101010100110010101010101010101010100000101010101010101010100101010111111101001101010100100101011010101011101001101010100100101011010111101100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101010011001010101010101010101010000010101010101010101010010101011111110100110101010010010101101010101110100110101010010010101101001100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101010011001010101010101010101010000010101010101010101010010101011111110100110101010010010101101010101110100110101010010010101101011110110010101010101010101010100000101010101010101010100101010111111101001101010100100101011010101011101001101010100100101011010101001100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101111111101100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101010011001010101010101010101010000010101010101010101010010101011111110100110101010010010101101010101110100110101010010010101101011110110010101010101010101010100000101010101010101010100101010111111101001101010100100101011010101011101001101010100100101011010101001100101010101010101010101000001010101010101010101001010101111111010011010101001001010110101010111010011010101001001010110101111)
  );


endmodule


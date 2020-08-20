module alu(in1, in2, in3, sel, out1, out2);
   input  [7:0] in1;
   input  [7:0] in2;
   input  [7:0] in3;
   input 	sel;
   
   output [7:0] out1;
   output [7:0] out2;

   assign out1 = sel ? in1 + in2 : in1 - in2;
   assign out2 = in3 * 8'd25;

endmodule // alu


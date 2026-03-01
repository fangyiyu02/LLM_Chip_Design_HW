module mux2to1(input wire in1, input wire in2, input wire select, output wire out);
  assign out = select ? in2 : in1;
endmodule
module mux4to1(input [1:0] sel, input [3:0] in, output wire out);
  wire m0_out, m1_out;

  mux2to1 u0 (.in1(in[0]), .in2(in[1]), .select(sel[0]), .out(m0_out));
  mux2to1 u1 (.in1(in[2]), .in2(in[3]), .select(sel[0]), .out(m1_out));
  mux2to1 u2 (.in1(m0_out), .in2(m1_out), .select(sel[1]), .out(out));
endmodule

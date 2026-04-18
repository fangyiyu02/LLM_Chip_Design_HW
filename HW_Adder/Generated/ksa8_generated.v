module BigCircle(output G, output P, input Gi, input Pi, input GiPrev, input PiPrev);
    wire and1, and2, or1;

    and(and1, Pi, GiPrev); // and for generate
    or(or1, Gi, and1);     // or for generate
    and(P, Pi, PiPrev);     // and for propagate
    assign G = or1;         // assign G
endmodule

// SmallCircle module
module SmallCircle(output Ci, input Gi);
    buf(Ci, Gi); // buffer to pass Gi to Ci
endmodule

// Square module
module Square(output G, output P, input Ai, input Bi);
    and(G, Ai, Bi); // generate
    xor(P, Ai, Bi); // propagate
endmodule

// Triangle module
module Triangle(output Si, input Pi, input CiPrev);
    xor(Si, Pi, CiPrev); // sum calculation
endmodule

// KSA8 module
module KSA8(output [7:0] sum, output cout, input [7:0] a, input [7:0] b);
    wire [7:0] g, p;         // Generate and Propagate
    wire [7:0] c;           // Carry signals
    wire [14:8] g1, p1;     // First stage wires
    wire [20:15] g2, p2;    // Second stage wires
    wire [24:21] g3, p3;    // Third stage wires
    
    // Fixed input carry
    wire cin = 1'b0;

    // Precompute bitwise generate and propagate
    Square sq[7:0](.G(g), .P(p), .Ai(a), .Bi(b));

    // Stage 1: Combine adjacent bits
    BigCircle bc0(g1[8], p1[8], g[0], p[0], g[1], p[1]);
    BigCircle bc1(g1[9], p1[9], g[2], p[2], g[3], p[3]);
    BigCircle bc2(g1[10], p1[10], g[4], p[4], g[5], p[5]);
    BigCircle bc3(g1[11], p1[11], g[6], p[6], g[7], p[7]);

    // Stage 2: Combine wider groups
    BigCircle bc4(g2[15], p2[15], g1[8], p1[8], g1[10], p1[10]);
    BigCircle bc5(g2[16], p2[16], g1[9], p1[9], g1[11], p1[11]);

    // Stage 3: Complete prefix computation for upper bits
    BigCircle bc6(g3[21], p3[21], g2[15], p2[15], g2[16], p2[16]);

    // Generate carry signals using SmallCircle
    SmallCircle sc0(c[0], g[0]);
    SmallCircle sc1(c[1], g[1]);
    SmallCircle sc2(c[2], g[2]);
    SmallCircle sc3(c[3], g[3]);
    SmallCircle sc4(c[4], g[4]);
    SmallCircle sc5(c[5], g[5]);
    SmallCircle sc6(c[6], g[6]);
    SmallCircle sc7(c[7], g[7]);

    // Sum calculation using Triangle
    Triangle t0(sum[0], p[0], cin);
    Triangle t1(sum[1], p[1], c[0]);
    Triangle t2(sum[2], p[2], c[1]);
    Triangle t3(sum[3], p[3], c[2]);
    Triangle t4(sum[4], p[4], c[3]);
    Triangle t5(sum[5], p[5], c[4]);
    Triangle t6(sum[6], p[6], c[5]);
    Triangle t7(sum[7], p[7], c[6]);

    // Final carry-out signal
    buf(cout, c[7]);

endmodule
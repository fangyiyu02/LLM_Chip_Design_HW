module RCA8(
    output [7:0] sum,
    output cout,
    input [7:0] a,
    input [7:0] b
);
    // Internal carry wire bus
    wire [7:1] c;

    // Instantiate the 1-bit full adders
    FA FA0 (
        .sum(sum[0]),
        .cout(c[1]),
        .a(a[0]),
        .b(b[0]),
        .cin(1'b0) // Carry-in for the least significant bit (0)
    );

    // Generate FA instances for bits 1 through 6
    genvar i;
    generate
        for (i = 1; i < 7; i = i + 1) begin : FA_INST
            FA FA_i (
                .sum(sum[i]),
                .cout(c[i + 1]),
                .a(a[i]),
                .b(b[i]),
                .cin(c[i]) // Each carries into the next full adder
            );
        end
    endgenerate

    // Instantiate the 1-bit full adder for the most significant bit
    FA FA7 (
        .sum(sum[7]),
        .cout(cout),
        .a(a[7]),
        .b(b[7]),
        .cin(c[7]) // Carry to the MSB
    );

endmodule

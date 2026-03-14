`timescale 1ns / 1ps

module tb_encoder4;

    // Inputs
    reg [3:0] in;

    // Outputs
    wire [1:0] pos;
    wire valid;

    // Instantiate the Unit Under Test (UUT)
    encoder4 uut (
        .in(in), 
        .pos(pos),
        .valid(valid)
    );

    initial begin
        // Test case 1: All zeros
        in = 4'b0000;
        #10;
        $display("Test 1: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 2: Only bit 0 is 1
        in = 4'b0001;
        #10;
        $display("Test 2: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 3: Only bit 1 is 1
        in = 4'b0010;
        #10;
        $display("Test 3: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 4: Only bit 2 is 1
        in = 4'b0100;
        #10;
        $display("Test 4: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 5: Only bit 3 is 1
        in = 4'b1000;
        #10;
        $display("Test 5: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 6: Bits 0 and 1 are 1
        in = 4'b0011;
        #10;
        $display("Test 6: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 7: Bits 0 and 2 are 1
        in = 4'b0101;
        #10;
        $display("Test 7: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 8: Bits 0 and 3 are 1
        in = 4'b1001;
        #10;
        $display("Test 8: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 9: Bits 1 and 2 are 1
        in = 4'b0110;
        #10;
        $display("Test 9: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 10: Bits 1 and 3 are 1
        in = 4'b1010;
        #10;
        $display("Test 10: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 11: Bits 2 and 3 are 1
        in = 4'b1100;
        #10;
        $display("Test 11: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 12: Bits 0, 1, and 2 are 1
        in = 4'b0111;
        #10;
        $display("Test 12: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 13: Bits 0, 1, and 3 are 1
        in = 4'b1011;
        #10;
        $display("Test 13: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 14: Bits 0, 2, and 3 are 1
        in = 4'b1101;
        #10;
        $display("Test 14: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 15: Bits 1, 2, and 3 are 1
        in = 4'b1110;
        #10;
        $display("Test 15: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Test case 16: All bits are 1
        in = 4'b1111;
        #10;
        $display("Test 16: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Random test case 17
        in = 4'b1001;
        #10;
        $display("Test 17: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Random test case 18
        in = 4'b0110;
        #10;
        $display("Test 18: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Random test case 19
        in = 4'b0101;
        #10;
        $display("Test 19: in = %b, pos = %b, valid = %b", in, pos, valid);

        // Random test case 20
        in = 4'b1010;
        #10;
        $display("Test 20: in = %b, pos = %b, valid = %b", in, pos, valid);

        $finish;
    end
      
endmodule
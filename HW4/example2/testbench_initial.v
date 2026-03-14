module testbench;
    // Declare input signals
    reg [3:0] a;
    reg [3:0] b;
    // Declare output signals
    wire [3:0] sum;
    wire carry;

    // Instantiate the module under test
    adder4bit uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // Test pattern 1: Add zeros
        a = 4'b0000; b = 4'b0000;
        #10 $display("Test 1: a=0000, b=0000");

        // Test pattern 2: Maximum values without carry
        a = 4'b0111; b = 4'b0111;
        #10 $display("Test 2: a=0111, b=0111");

        // Test pattern 3: Minimum and maximum value
        a = 4'b0000; b = 4'b1111;
        #10 $display("Test 3: a=0000, b=1111");

        // Test pattern 4: Maximum value and one
        a = 4'b1111; b = 4'b0001;
        #10 $display("Test 4: a=1111, b=0001");

        // Test pattern 5: Middle range values
        a = 4'b0101; b = 4'b0011;
        #10 $display("Test 5: a=0101, b=0011");

        // Test pattern 6: Edge case - carry over
        a = 4'b1000; b = 4'b1000;
        #10 $display("Test 6: a=1000, b=1000");

        // Test pattern 7: Random values
        a = 4'b1010; b = 4'b0101;
        #10 $display("Test 7: a=1010, b=0101");

        // Test pattern 8: Random values
        a = 4'b1110; b = 4'b0010;
        #10 $display("Test 8: a=1110, b=0010");

        // Test pattern 9: Random values
        a = 4'b1101; b = 4'b0110;
        #10 $display("Test 9: a=1101, b=0110");

        // Test pattern 10: Lower boundary values
        a = 4'b0001; b = 4'b0000;
        #10 $display("Test 10: a=0001, b=0000");

        // Test pattern 11: Upper boundary values
        a = 4'b1111; b = 4'b1111;
        #10 $display("Test 11: a=1111, b=1111");
        
        // Finish the simulation
        $finish;
    end
endmodule
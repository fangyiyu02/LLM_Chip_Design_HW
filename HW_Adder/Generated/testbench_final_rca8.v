module RCA8_tb;
    reg [7:0] a, b;
    wire [7:0] sum;
    wire cout;

    integer passed_tests = 0;
    integer failed_tests = 0;

    // Instantiate the DUT
    RCA8 dut (
        .sum(sum),
        .cout(cout),
        .a(a),
        .b(b)
    );

    initial begin
        // Test Pattern 1: All zeros
        a = 8'b00000000;
        b = 8'b00000000;
        #10;
        $display("Test 1: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
        #10;
        if (sum === 8'b00000000 && cout === 1'b0) begin
            $display("✓ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b00000000, cout, 1'b0);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b00000000, cout, 1'b0);
            failed_tests = failed_tests + 1;
        end

        // Test Pattern 2: All ones
        a = 8'b11111111;
        b = 8'b11111111;
        #10;
        $display("Test 2: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
        #10;
        if (sum === 8'b11111110 && cout === 1'b1) begin
            $display("✓ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11111110, cout, 1'b1);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11111110, cout, 1'b1);
            failed_tests = failed_tests + 1;
        end

        // Test Pattern 3: Alternating bits
        a = 8'b01010101;
        b = 8'b10101010;
        #10;
        $display("Test 3: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
        #10;
        if (sum === 8'b11111111 && cout === 1'b0) begin
            $display("✓ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11111111, cout, 1'b0);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11111111, cout, 1'b0);
            failed_tests = failed_tests + 1;
        end

        // Test Pattern 4: Maximum and minimum values
        a = 8'b11111111;
        b = 8'b00000000;
        #10;
        $display("Test 4: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
        #10;
        if (sum === 8'b11111111 && cout === 1'b0) begin
            $display("✓ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11111111, cout, 1'b0);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11111111, cout, 1'b0);
            failed_tests = failed_tests + 1;
        end

        // Test Pattern 5: One bit set
        a = 8'b00000001;
        b = 8'b00000001;
        #10;
        $display("Test 5: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
        #10;
        if (sum === 8'b00000010 && cout === 1'b0) begin
            $display("✓ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b00000010, cout, 1'b0);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b00000010, cout, 1'b0);
            failed_tests = failed_tests + 1;
        end

        // Test Pattern 6: Zero and one
        a = 8'b00000000;
        b = 8'b00000001;
        #10;
        $display("Test 6: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
        #10;
        if (sum === 8'b00000001 && cout === 1'b0) begin
            $display("✓ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b00000001, cout, 1'b0);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b00000001, cout, 1'b0);
            failed_tests = failed_tests + 1;
        end

        // Test Pattern 7: Random values
        a = 8'b11001100;
        b = 8'b00110011;
        #10;
        $display("Test 7: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
        #10;
        if (sum === 8'b11111111 && cout === 1'b0) begin
            $display("✓ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11111111, cout, 1'b0);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11111111, cout, 1'b0);
            failed_tests = failed_tests + 1;
        end

        // Test Pattern 8: Near overflow
        a = 8'b11111110;
        b = 8'b00000001;
        #10;
        $display("Test 8: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
        #10;
        if (sum === 8'b11111111 && cout === 1'b0) begin
            $display("✓ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11111111, cout, 1'b0);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11111111, cout, 1'b0);
            failed_tests = failed_tests + 1;
        end

        // Test Pattern 9: All high bits
        a = 8'b10000000;
        b = 8'b10000000;
        #10;
        $display("Test 9: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
        #10;
        if (sum === 8'b00000000 && cout === 1'b1) begin
            $display("✓ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b00000000, cout, 1'b1);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b00000000, cout, 1'b1);
            failed_tests = failed_tests + 1;
        end

        // Test Pattern 10: Lower nibble only
        a = 8'b00001111;
        b = 8'b00000000;
        #10;
        $display("Test 10: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
        #10;
        if (sum === 8'b00001111 && cout === 1'b0) begin
            $display("✓ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b00001111, cout, 1'b0);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b00001111, cout, 1'b0);
            failed_tests = failed_tests + 1;
        end

        // Test Pattern 11: Upper nibble only
        a = 8'b11110000;
        b = 8'b00000000;
        #10;
        $display("Test 11: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
        #10;
        if (sum === 8'b11110000 && cout === 1'b0) begin
            $display("✓ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11110000, cout, 1'b0);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11110000, cout, 1'b0);
            failed_tests = failed_tests + 1;
        end

        // Test Pattern 12: Mixed pattern
        a = 8'b10101010;
        b = 8'b01010101;
        #10;
        $display("Test 12: a = %b, b = %b, sum = %b, cout = %b", a, b, sum, cout);
        #10;
        if (sum === 8'b11111111 && cout === 1'b0) begin
            $display("✓ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11111111, cout, 1'b0);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Sum: %b (expected: %b), Cout: %b (expected: %b)", sum, 8'b11111111, cout, 1'b0);
            failed_tests = failed_tests + 1;
        end

        // Test Summary
        $display("Test Summary: Total: %d, Passed: %d, Failed: %d", passed_tests + failed_tests, passed_tests, failed_tests);

        $finish;
    end
endmodule
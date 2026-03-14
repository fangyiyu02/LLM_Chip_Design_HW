module tb_encoder4();
    reg [3:0] in;
    wire [1:0] pos;
    wire valid;
    integer passed_tests, failed_tests;

    // Instantiate the module under test
    encoder4 uut (
        .in(in),
        .pos(pos),
        .valid(valid)
    );

    initial begin
        passed_tests = 0;
        failed_tests = 0;

        // Test pattern 1: All inputs are 0
        in = 4'b0000;
        #10;
        $display("Test 1: in = %b", in);
        if (valid === 1'b0 && pos === 2'b00) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 0, Pos: 00", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 2: Only in[0] is 1
        in = 4'b0001;
        #10;
        $display("Test 2: in = %b", in);
        if (valid === 1'b1 && pos === 2'b00) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 00", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 3: Only in[1] is 1
        in = 4'b0010;
        #10;
        $display("Test 3: in = %b", in);
        if (valid === 1'b1 && pos === 2'b01) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 01", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 4: Only in[2] is 1
        in = 4'b0100;
        #10;
        $display("Test 4: in = %b", in);
        if (valid === 1'b1 && pos === 2'b10) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 10", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 5: Only in[3] is 1
        in = 4'b1000;
        #10;
        $display("Test 5: in = %b", in);
        if (valid === 1'b1 && pos === 2'b11) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 11", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 6: in[0] and in[1] are 1
        in = 4'b0011;
        #10;
        $display("Test 6: in = %b", in);
        if (valid === 1'b1 && pos === 2'b01) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 01", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 7: in[1] and in[2] are 1
        in = 4'b0110;
        #10;
        $display("Test 7: in = %b", in);
        if (valid === 1'b1 && pos === 2'b10) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 10", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 8: in[2] and in[3] are 1
        in = 4'b1100;
        #10;
        $display("Test 8: in = %b", in);
        if (valid === 1'b1 && pos === 2'b11) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 11", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 9: in[0] and in[2] are 1
        in = 4'b0101;
        #10;
        $display("Test 9: in = %b", in);
        if (valid === 1'b1 && pos === 2'b10) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 10", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 10: All inputs are 1
        in = 4'b1111;
        #10;
        $display("Test 10: in = %b", in);
        if (valid === 1'b1 && pos === 2'b11) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 11", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 11: Random pattern
        in = 4'b1010;
        #10;
        $display("Test 11: in = %b", in);
        if (valid === 1'b1 && pos === 2'b11) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 11", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 12: Random pattern
        in = 4'b1101;
        #10;
        $display("Test 12: in = %b", in);
        if (valid === 1'b1 && pos === 2'b11) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 11", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 13: Random pattern
        in = 4'b0111;
        #10;
        $display("Test 13: in = %b", in);
        if (valid === 1'b1 && pos === 2'b10) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 10", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 14: Random pattern
        in = 4'b1011;
        #10;
        $display("Test 14: in = %b", in);
        if (valid === 1'b1 && pos === 2'b11) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 11", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 15: Random pattern
        in = 4'b1001;
        #10;
        $display("Test 15: in = %b", in);
        if (valid === 1'b1 && pos === 2'b11) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 11", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 16: Random pattern
        in = 4'b0110;
        #10;
        $display("Test 16: in = %b", in);
        if (valid === 1'b1 && pos === 2'b10) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 10", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 17: Random pattern
        in = 4'b0011;
        #10;
        $display("Test 17: in = %b", in);
        if (valid === 1'b1 && pos === 2'b01) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 01", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 18: Random pattern
        in = 4'b0100;
        #10;
        $display("Test 18: in = %b", in);
        if (valid === 1'b1 && pos === 2'b10) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 10", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 19: Random pattern
        in = 4'b0010;
        #10;
        $display("Test 19: in = %b", in);
        if (valid === 1'b1 && pos === 2'b01) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 01", valid, pos);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 20: Random pattern
        in = 4'b0001;
        #10;
        $display("Test 20: in = %b", in);
        if (valid === 1'b1 && pos === 2'b00) begin
            $display("✓ Valid: %b, Pos: %b", valid, pos);
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Valid: %b, Pos: %b, Expected Valid: 1, Pos: 00", valid, pos);
            failed_tests = failed_tests + 1;
        end

        $display("Test Summary: Total Tests = %0d, Passed = %0d, Failed = %0d", passed_tests + failed_tests, passed_tests, failed_tests);
        $finish;
    end
endmodule
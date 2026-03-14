module tb_mux2to1;
    // Declare signals
    reg a;
    reg b;
    reg sel;
    wire y;

    // Instantiate the module under test
    mux2to1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin
        integer passed_tests;
        integer failed_tests;
        passed_tests = 0;
        failed_tests = 0;

        // Test pattern 1: a=0, b=0, sel=0
        a = 0; b = 0; sel = 0;
        #10;
        $display("Test 1: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        if (y === 0) begin
            $display("✓ Test 1 passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 1 failed: Expected y=0, Got y=%b", y);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 2: a=0, b=0, sel=1
        a = 0; b = 0; sel = 1;
        #10;
        $display("Test 2: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        if (y === 0) begin
            $display("✓ Test 2 passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 2 failed: Expected y=0, Got y=%b", y);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 3: a=0, b=1, sel=0
        a = 0; b = 1; sel = 0;
        #10;
        $display("Test 3: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        if (y === 0) begin
            $display("✓ Test 3 passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 3 failed: Expected y=0, Got y=%b", y);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 4: a=0, b=1, sel=1
        a = 0; b = 1; sel = 1;
        #10;
        $display("Test 4: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        if (y === 1) begin
            $display("✓ Test 4 passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 4 failed: Expected y=1, Got y=%b", y);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 5: a=1, b=0, sel=0
        a = 1; b = 0; sel = 0;
        #10;
        $display("Test 5: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        if (y === 1) begin
            $display("✓ Test 5 passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 5 failed: Expected y=1, Got y=%b", y);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 6: a=1, b=0, sel=1
        a = 1; b = 0; sel = 1;
        #10;
        $display("Test 6: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        if (y === 0) begin
            $display("✓ Test 6 passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 6 failed: Expected y=0, Got y=%b", y);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 7: a=1, b=1, sel=0
        a = 1; b = 1; sel = 0;
        #10;
        $display("Test 7: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        if (y === 1) begin
            $display("✓ Test 7 passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 7 failed: Expected y=1, Got y=%b", y);
            failed_tests = failed_tests + 1;
        end

        // Test pattern 8: a=1, b=1, sel=1
        a = 1; b = 1; sel = 1;
        #10;
        $display("Test 8: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);
        if (y === 1) begin
            $display("✓ Test 8 passed");
            passed_tests = passed_tests + 1;
        end else begin
            $display("✗ Test 8 failed: Expected y=1, Got y=%b", y);
            failed_tests = failed_tests + 1;
        end

        $display("Test Summary: Total tests = %0d, Passed = %0d, Failed = %0d", 
                 passed_tests + failed_tests, passed_tests, failed_tests);
        $finish;
    end
endmodule
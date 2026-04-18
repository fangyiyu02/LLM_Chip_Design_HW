`timescale 1ns/1ps

module testbench;
    reg [7:0] a, b;
    wire [7:0] sum;
    wire cout;
    wire [7:0] g, p;
    wire [14:8] g1, p1;
    wire [20:15] g2, p2;
    wire [24:21] g3, p3;
    wire [7:0] c;

    integer passed_tests = 0;
    integer failed_tests = 0;

    // Instantiate the Kogge-Stone Adder
    KSA8 dut (
        .sum(sum),
        .cout(cout),
        .a(a),
        .b(b)
    );

    task check_output;
        input [7:0] expected_sum;
        input expected_cout;
        begin
            if (sum === expected_sum && cout === expected_cout) begin
                $display("✓ Test Passed: Expected sum=0x%h, cout=%b", expected_sum, expected_cout);
                passed_tests = passed_tests + 1;
            end else begin
                $display("✗ Test Failed: Expected sum=0x%h, cout=%b, Got sum=0x%h, cout=%b", expected_sum, expected_cout, sum, cout);
                failed_tests = failed_tests + 1;
            end
        end
    endtask

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, testbench);

        // Test case 0: 0 + 0
        a = 8'b00000000; b = 8'b00000000; #10;
        $display("Test 0: a=0x%h, b=0x%h, sum=0x%h, cout=%b", a, b, sum, cout);
        check_output(8'b00000000, 1'b0);

        // Test case 1: small numbers without carry propagation
        a = 8'b00000001; b = 8'b00000001; #10;
        $display("Test 1: a=0x%h, b=0x%h, sum=0x%h, cout=%b", a, b, sum, cout);
        check_output(8'b00000010, 1'b0);

        // Test case 2: cases with partial carry propagation
        a = 8'b00001111; b = 8'b00000001; #10;
        $display("Test 2: a=0x%h, b=0x%h, sum=0x%h, cout=%b", a, b, sum, cout);
        check_output(8'b00010000, 1'b0);

        // Test case 3: cases with full carry propagation
        a = 8'b11111111; b = 8'b00000001; #10;
        $display("Test 3: a=0x%h, b=0x%h, sum=0x%h, cout=%b", a, b, sum, cout);
        check_output(8'b00000000, 1'b1);

        // Test case 4: 8'hFF + 8'h01
        a = 8'b11111111; b = 8'b00000001; #10;
        $display("Test 4: a=0x%h, b=0x%h, sum=0x%h, cout=%b", a, b, sum, cout);
        check_output(8'b00000000, 1'b1);

        // Random Test case 5
        a = 8'b10101010; b = 8'b01010101; #10;
        $display("Test 5: a=0x%h, b=0x%h, sum=0x%h, cout=%b", a, b, sum, cout);
        check_output(8'b11111111, 1'b0);

        // Random Test case 6
        a = 8'b11001100; b = 8'b00110011; #10;
        $display("Test 6: a=0x%h, b=0x%h, sum=0x%h, cout=%b", a, b, sum, cout);
        check_output(8'b11111111, 1'b0);

        // Random Test case 7
        a = 8'b10000001; b = 8'b01111110; #10;
        $display("Test 7: a=0x%h, b=0x%h, sum=0x%h, cout=%b", a, b, sum, cout);
        check_output(8'b11111111, 1'b0);

        // Random Test case 8
        a = 8'b11110000; b = 8'b00001111; #10;
        $display("Test 8: a=0x%h, b=0x%h, sum=0x%h, cout=%b", a, b, sum, cout);
        check_output(8'b11111111, 1'b0);

        // Random Test case 9
        a = 8'b01010101; b = 8'b10101010; #10;
        $display("Test 9: a=0x%h, b=0x%h, sum=0x%h, cout=%b", a, b, sum, cout);
        check_output(8'b11111111, 1'b0);

        $display("Total Tests Run: %d", passed_tests + failed_tests);
        $display("Total Passed Tests: %d", passed_tests);
        $display("Total Failed Tests: %d", failed_tests);

        $finish;
    end
endmodule
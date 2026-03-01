`timescale 1ns / 1ps

module full_addertb;
    // reg
    reg a, b, cin;
    
    // wire
    wire sum, cout;
    
    integer i;
    integer error_count = 0;
    reg [2:0] test_val;      // generated 0-7 loop input
    reg [1:0] expected_res;  

    // full adder 
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // (000)-(111)
        for (i = 0; i < 8; i = i + 1) begin
            test_val = i;
            
            // terminal
            a = test_val[2];
            b = test_val[1];
            cin = test_val[0];
            
            // calculated results
            expected_res = a + b + cin;
            
            #10; // 
            
            // count and expected
            if ({cout, sum} !== expected_res) begin
                $display("Error: a=%b, b=%b, cin=%b -> sum=%b, cout=%b (Expected: sum=%b, cout=%b)", 
                         a, b, cin, sum, cout, expected_res[0], expected_res[1]);
                error_count = error_count + 1;
            end
        end

        // final check
        if (error_count == 0) begin
            $display("Testbench ran successfully");
            $display("passed!");
        end else begin
            $display("Simulation failed with %d errors.", error_count);
        end
        
        $finish;
    end
endmodule
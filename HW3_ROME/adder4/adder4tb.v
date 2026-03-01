`timescale 1ns / 1ps

module adder4tb;
    // input
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    
    // output
    wire [3:0] sum;
    wire cout;
    
    // error count
    integer i;
    integer error_count = 0;
    
    reg [4:0] expected_res;

    adder4 uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // (a 0~15, b 0-15 cin 0~1)
        for (i = 0; i < 512; i = i + 1) begin
            // testing input
            a = i[8:5];
            b = i[4:1];
            cin = i[0];
            
            // calculate results
            expected_res = a + b + cin;
            
            #5; // 
            
            // comprison
            if ({cout, sum} !== expected_res) begin
                $display("Error: a=%d, b=%d, cin=%d -> sum=%d, cout=%b (Expected: sum=%d, cout=%b)", 
                         a, b, cin, sum, cout, expected_res[3:0], expected_res[4]);
                error_count = error_count + 1;
            end
        end

        // Final check
        if (error_count == 0) begin
            $display("Testbench ran successfully");
            $display("passed!"); 
        end else begin
            $display("Simulation failed with %d errors.", error_count);
        end
        
        $finish;
    end
endmodule
`timescale 1ns / 1ps

module adder8tb;
    // input
    reg [7:0] a;
    reg [7:0] b;
    reg cin;
    
    // output
    wire [7:0] sum;
    wire cout;
    
    // mistake counting
    integer i;
    integer error_count = 0;
    
    // compri ({cout, sum})
    reg [8:0] expected_res;

    adder8 uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // 
    task check_result;
        begin
            expected_res = a + b + cin;
            #5;
            if ({cout, sum} !== expected_res) begin
                $display("Error: a=%d, b=%d, cin=%d -> sum=%d, cout=%b (Expected: sum=%d, cout=%b)", 
                         a, b, cin, sum, cout, expected_res[7:0], expected_res[8]);
                error_count = error_count + 1;
            end
        end
    endtask

    initial begin
        // 
        a = 0; b = 0; cin = 0; check_result();
        a = 255; b = 255; cin = 0; check_result();
        a = 255; b = 255; cin = 1; check_result();
        a = 127; b = 128; cin = 0; check_result();
        
        // 
        for (i = 0; i < 10000; i = i + 1) begin
            a = $random % 256;  
            b = $random % 256;
            cin = $random % 2;  
            
            check_result();
        end

        if (error_count == 0) begin
            $display("Testbench ran successfully");
            $display("passed!"); 
        end else begin
            $display("Simulation failed with %d errors.", error_count);
        end
        
        $finish;
    end
endmodule
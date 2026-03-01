`timescale 1ns / 1ps

module half_addertb;
    // reg
    reg a;
    reg b;
    
    //  wire
    wire sum;
    wire carry;
    
    // error count
    integer error_count = 0;

    // (UUT: Unit Under Test)
    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // 1: 0 + 0 = 0 (carry 0)
        a = 0; b = 0; #10;
        if (sum !== 0 || carry !== 0) begin
            $display("Error: a=%b, b=%b -> sum=%b, carry=%b (Expected: sum=0, carry=0)", a, b, sum, carry);
            error_count = error_count + 1;
        end

        // 2: 0 + 1 = 1 (carry 0)
        a = 0; b = 1; #10;
        if (sum !== 1 || carry !== 0) begin
            $display("Error: a=%b, b=%b -> sum=%b, carry=%b (Expected: sum=1, carry=0)", a, b, sum, carry);
            error_count = error_count + 1;
        end

        //  3: 1 + 0 = 1 (carry 0)
        a = 1; b = 0; #10;
        if (sum !== 1 || carry !== 0) begin
            $display("Error: a=%b, b=%b -> sum=%b, carry=%b (Expected: sum=1, carry=0)", a, b, sum, carry);
            error_count = error_count + 1;
        end

        //  4: 1 + 1 = 0 (carry 1)
        a = 1; b = 1; #10;
        if (sum !== 0 || carry !== 1) begin
            $display("Error: a=%b, b=%b -> sum=%b, carry=%b (Expected: sum=0, carry=1)", a, b, sum, carry);
            error_count = error_count + 1;
        end

        // final check passed!
        if (error_count == 0) begin
            $display("Testbench ran successfully");
            $display("passed!"); 
        end else begin
            $display("Simulation failed with %d errors.", error_count);
        end
        
        $finish;
    end
endmodule
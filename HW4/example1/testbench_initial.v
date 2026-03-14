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
        // Test pattern 1: a=0, b=0, sel=0
        a = 0; b = 0; sel = 0;
        #10;
        $display("Test 1: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

        // Test pattern 2: a=0, b=0, sel=1
        a = 0; b = 0; sel = 1;
        #10;
        $display("Test 2: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

        // Test pattern 3: a=0, b=1, sel=0
        a = 0; b = 1; sel = 0;
        #10;
        $display("Test 3: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

        // Test pattern 4: a=0, b=1, sel=1
        a = 0; b = 1; sel = 1;
        #10;
        $display("Test 4: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

        // Test pattern 5: a=1, b=0, sel=0
        a = 1; b = 0; sel = 0;
        #10;
        $display("Test 5: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

        // Test pattern 6: a=1, b=0, sel=1
        a = 1; b = 0; sel = 1;
        #10;
        $display("Test 6: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

        // Test pattern 7: a=1, b=1, sel=0
        a = 1; b = 1; sel = 0;
        #10;
        $display("Test 7: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

        // Test pattern 8: a=1, b=1, sel=1
        a = 1; b = 1; sel = 1;
        #10;
        $display("Test 8: a=%b, b=%b, sel=%b, y=%b", a, b, sel, y);

        $finish;
    end
endmodule
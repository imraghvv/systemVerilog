`include "interface.sv"
`include "test"
module testbenchtop;

    bit clk;
    bit rst;

    inf vif(clk, rst);
    test t1(vif);

    alu dut (.clk(vif.clk),
    .rst(vif.rst),
    .a(vif.a),
    .b(vif.b),
    .o(vif.o),
    .result(vif.result),
    .c(vif.c),
    .bo(vif.bo)   
    );

    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #5 rst = 0;
    end
    
endmodule
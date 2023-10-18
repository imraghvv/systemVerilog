`include "interface.sv"
`include "test"
module tbench_top;
  
  bit clk;
  bit reset;
  
  inf vif(clk,reset);
  test t1(vif);
  fadder dut(.clk(vif.clk),
          .reset(vif.reset),
          .a(vif.a),
          .b(vif.b),
          .cin(vif.cin),
          .s(vif.s),
          .cout(vif.cout)
          );
          
 
  always #5 clk = ~clk;
 
  initial begin
    reset = 1;
    #5 reset = 0;
  end
 
endmodule    
module fadder (
  input logic a,b,cin,clk,reset,
  output logic s, cout);

  logic x1, a1;

  always @(posedge clk) begin

    if (reset) begin
      s=0;
      cout=0;
    end else begin
      assign x1 = a^b;
      assign a1 = a&&b;
      assign s  = cin ^ x1;
      assign cout = (x1 && cin) || a1;    
    end  
    
  end
  
endmodule

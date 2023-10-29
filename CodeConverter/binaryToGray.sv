// Binary to gray code

module bg #(
  parameter width = 4
)(
  input     wire[width-1:0] bin,
  output    wire[width-1:0] gray

);

  assign gray[width-1] = bin[width-1];

  genvar i;
  for (i=width-2; i>=0; i=i-1)
    assign gray[i] = bin[i+1] ^ bin[i];

endmodule

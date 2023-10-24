module alu ( input clk, rst,
    input logic [1:0]a, b,
    input logic [1:0] o, 
    output logic [1:0]result,
    output logic [1:0]c,
    output logic [1:0]bo
    );

    always @ (posedge clk or rst)

    if (rst) begin
        result <= 0;      

    end else begin
        case (o)
            2'b00 :begin
                // $display ("Addition"); 
                result <= a ^ b; 
                c <= a&&b;
            end   // adder
            2'b01 : begin
                // $display ("multiplication"); 
                result <= a&&b; 
            end // multiplier
            2'b10 : begin
                // $display ("substractor");
                result <= a ^ b; 
                bo <= (~a)&& b;
            end //substractor
            2'b11 : begin
                //$display ("division"); 
                result <= a/b;
            end
            default: begin
                result <= 0;
                c <= 0 ;
                bo <= 0;        
            end
        endcase
    end

endmodule


    


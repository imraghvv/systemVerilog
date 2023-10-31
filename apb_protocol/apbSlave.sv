module apb_slave #(datawidth = 32,
addresswidth = 8) (
input clk,
input rst,
input [addresswidth-1:0]paddr,
input [datawidth-1:0] pwdata,
input pwrite,
input psel,
input penable,
output logic [datawidth-1:0]prdata
output logic pready;
);

typedef enum logic[1:0] {
    IDLE = 2'b00, SETUP = 2'b01, ACCESS = 2'b10} state;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        prdata <= 0;
        state <= IDLE;
    end else begin
        case (state)
        IDLE    : begin
            prdata <= 0;
            if (psel & !penable)
                state <= SETUP;
            else 
                state <= IDLE;
        end
        SETUP    : begin
            prdata <= 0;
            if (psel & penable)
            state <= ACCESS;
        end
        ACCESS    : begin
            if (psel & penable & pwrite )begin
            //write operation
            //XXXX <= pwdata;                
            end else if (psel & penable & !pwrite )begin
                //read operation
            // prdata <= XXXX;       
            end
            state <= IDLE; 
        end           
        endcase
    end
end

endmodule

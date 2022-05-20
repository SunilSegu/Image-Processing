`timescale 1ns / 1ps

module machine(input [7:0] threshold,
input [7:0] in,
input [7:0] value,
input [1:0] sel,
input  clk,
output reg [0:7] out
);
always@(posedge clk)
begin
case(sel)
    2'b00: begin
            out =in + value;
            if(out < in) out = 8'hff;   //increasesbrightness
            end
    2'b01: begin
            out = in - value;           //decreasesbrightness  
            if(out > in)out = 8'h00;    
            end
   2'b10: begin
            if(in > threshold) out = 8'hff;
            else out= 8'h00;           //Binarizing
           end
   2'b11: begin
            out = 8'hff - in;          //inverting
           end    
  endcase
end
endmodule

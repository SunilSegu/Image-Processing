`timescale 1ns / 1ps

module tb();
reg [7:0] threshold;
reg [7:0] in;
reg [7:0] value;
reg [1:0] sel;
reg  clk;
wire [0:7]out;
reg [0:7] A [0:98303];
reg [0:7] B [0:98303];
integer i;
initial clk = 1'b0;
always #0.005 clk = ~clk;

initial 
begin
    threshold = 160;
    value = 60;
    sel = 2'b11; 
    //s = 2'b00 for increasing brightness
    //s = 2'b01 for decreasing brightness
    //s = 2'b10 for applying threshold
    //s = 2'b11 for inverting image
    $readmemh("C:/Users/ppran/OneDrive/Desktop/input.txt",A);
    for(i=0;i < 98303; i= i+1)begin
        #0.005 in = A[i];
        if(i>0)B[i-1] = out;     
    end
    $writememh("C:/Users/ppran/OneDrive/Desktop/outputincre.txt",B);
end

machine ds1(threshold,in,value,sel,clk,out);
endmodule

`timescale 1ns/1ps

module  reg4_8(
input REG_WE,
input CLK,
input RESET,
input [1:0] N1,
input [1:0] N2,
input [1:0] ND,
input [7:0] DI,
output [7:0] Q1,
output [7:0] Q2
);

// 8位的4个元素的数组
reg [7:0] RF_DATA[3:0];
integer i;
//assign中的数组标号中可以引入变量
assign Q1=RF_DATA[N1];	
assign Q2=RF_DATA[N2];
// reset = 0时候清零
always@(negedge RESET or posedge CLK) begin
	if(~RESET) begin
		for(i=0;i<4;i=i+1) RF_DATA[i]<=8'b0;
	end
	else begin
		if(REG_WE) RF_DATA[ND] <= DI;
	end
end
endmodule

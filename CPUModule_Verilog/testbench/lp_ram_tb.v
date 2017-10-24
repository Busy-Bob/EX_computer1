`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/22 21:47:25
// Design Name: 
// Module Name: lp_ram_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lp_ram_tb;



reg sys_clk;
reg [7:0] addr;
reg wren,aclr;
reg [7:0] data;
wire [7:0] q;    
lpm_ram ram1(addr,sys_clk,wren,aclr,data,q);
initial begin 
     sys_clk<=0;
     addr <= 8'h08;
     wren <=0;
     aclr <=0;
     data <=8'h50;
     #10 wren=1;
     #16 wren=0; 
	  #16 addr=8'h00;
	  #16 addr=8'h08;
		#32 aclr = 1;
		#16 aclr = 0;
           
 end  
 always #8 sys_clk=~sys_clk;
    
 endmodule

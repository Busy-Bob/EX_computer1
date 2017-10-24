`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/02 10:14:36
// Design Name: 
// Module Name: Flag_tb
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


module Flag_tb;
reg   [7:0] Flagin ;
reg         Clk    ;
reg         Reset  ;
wire  [7:0] Flagout;

Flag Flag
(
   .Flagin (Flagin ),
   .Clk    (Clk    ),
   .Reset  (Reset  ),
   .Flagout(Flagout)
);

initial
begin
    Flagin = 8'h03;
    Clk    = 1'b0;
    Reset  = 1'b0;
    
    #20 Flagin=8'h04;
    #100 Flagin=8'h05;
    #100 Flagin=8'h06;
	 #100 Reset  = 1'b1;
   
end


always #50 Clk = ~Clk;
endmodule

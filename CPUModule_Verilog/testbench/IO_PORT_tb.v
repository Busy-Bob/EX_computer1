`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/21 17:11:16
// Design Name: 
// Module Name: IO_PORT_tb
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


module IO_PORT_tb;
    reg [7:0] addr,Din;
    wire [7:0]Dout;
    reg CLK,RE,WE;
    wire [7:0] IO0,IO1, IO2,IO3,IO4, IO5, IO6,IO7;
    wire io_read,io_write;
    
    IO_PORT IO(addr,Din, RE, WE, Dout,io_read,io_write,IO0,IO1, IO2,IO3,IO4, IO5, IO6,IO7);     
   
    reg [20:0]cnt;
    initial begin 
        cnt<=0;
        RE<=0;
        WE<=1;
        addr<=8'b0;  
        CLK<=0;
        Din<=8'b0;
    end  
    always #5 CLK<=~CLK;
    always #200 RE<=~RE;
    always #200 WE<=~WE;

    
    always @(posedge CLK) begin
        cnt<=cnt+1;
        if(cnt%20==0)
            addr[3:0] <= addr[3:0] + 1;
        if(cnt%500==0)
            Din<=Din+1;
            
    end
    
    
    endmodule

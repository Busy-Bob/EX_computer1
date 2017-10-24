`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/20 20:28:44
// Design Name: 
// Module Name: IO_PORT
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


module IO_PORT(
input [7:0] addr,
input [7:0] Din,
input RE,
input WE,
output reg [7:0] Dout,
output io_read,
output io_write,
inout [7:0] IO0,
inout [7:0] IO1,
inout [7:0] IO2,
inout [7:0] IO3,
inout [7:0] IO4,
inout [7:0] IO5,
inout [7:0] IO6,
inout [7:0] IO7
    );

reg [7:0] IO0_reg;
reg [7:0] IO1_reg;
reg [7:0] IO2_reg;
reg [7:0] IO3_reg;
reg [7:0] IO4_reg;
reg [7:0] IO5_reg;
reg [7:0] IO6_reg;
reg [7:0] IO7_reg;
assign IO0 = RE?IO0_reg:8'bz; //RE高电平就输出。低电平对外呈现高阻态
assign IO1 = RE?IO1_reg:8'bz;
assign IO2 = RE?IO2_reg:8'bz;
assign IO3 = RE?IO3_reg:8'bz;
assign IO4 = RE?IO4_reg:8'bz;
assign IO5 = RE?IO5_reg:8'bz;
assign IO6 = RE?IO6_reg:8'bz;
assign IO7 = RE?IO7_reg:8'bz;
assign io_read = (addr[7:3]==0)? RE:0;
assign io_write = (addr[7:3]==0)? WE:0;
always@(*) begin
    if(RE) begin
        case(addr)
            0:Dout<=IO0;
            1:Dout<=IO1;
            2:Dout<=IO2;
            3:Dout<=IO3;
            4:Dout<=IO4;
            5:Dout<=IO5;
            6:Dout<=IO6;
            7:Dout<=IO7;
            default:Dout<=8'b0000_0000;
          endcase      
    end
    if(WE) begin
        case(addr)
            0:IO0_reg<=Din;
            1:IO1_reg<=Din;
            2:IO2_reg<=Din;
            3:IO3_reg<=Din;
            4:IO4_reg<=Din;
            5:IO5_reg<=Din;
            6:IO6_reg<=Din;
            7:IO7_reg<=Din;
				default: ;
      endcase      
    end
end    


    
   
endmodule

`timescale 1ns / 1ps


module Flag(
     input wire [7:0] Flagin ,
     input wire       Clk    ,
     input wire       Reset  ,
     output reg [7:0] Flagout  = 8'h00
    );
    
    always@(posedge Clk ,posedge Reset )
    begin
        if(Reset)
            Flagout <= 8'h00;
        else 
            Flagout <= Flagin;

    end
    
endmodule

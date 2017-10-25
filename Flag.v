`timescale 1ns / 1ps

// reset 低位时清零
module Flag(
     input wire [7:0] Flagin ,
     input wire       Clk    ,
     input wire       Reset  ,
	  input wire 		 flagwrite,
     output reg [7:0] Flagout  = 8'h00
    );
    
    always@(posedge Clk)
    begin
        if((!Reset)|(!flagwrite))
            Flagout <= 8'h00;
        else 
            Flagout <= Flagin;

    end
    
endmodule

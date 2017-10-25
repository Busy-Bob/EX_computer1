module digital_write_ctrl(input wr, input [7:0] addr,
									output [1:0] OUT_wr);
	assign OUT_wr = (wr && (addr == 8'h00))? 2'b01 : ((wr && (addr == 8'h01))? 2'b10 : 2'b00 );
endmodule 
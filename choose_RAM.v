//地址小于等于x的时候输出a
module choose_RAM(input [7:0] IN_resulta, input [7:0] IN_resultb, input [7:0] IN_address,
							output [7:0] OUT_result);
	assign OUT_result = (IN_address < 8'd8)? IN_resulta : IN_resultb;
							
endmodule 
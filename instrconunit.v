module instrconunit(input BRANCH, input JUMP,input CLK, input RESET, input [7:0] imm,
							output reg [7:0] PC = 8'b0);
	//暂时使用同步复位信号。0为复位
always @(posedge CLK)
begin
	if(~RESET)
		PC = 0;
	else if(JUMP)
		PC = imm;
	else if(BRANCH)
		PC = PC + imm + 8'h01;
	else
		PC = PC + 8'h01;
end
							
endmodule 
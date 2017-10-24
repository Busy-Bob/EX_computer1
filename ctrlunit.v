module ctrlunit(input [3:0] op, input ZERO,
					output JUMP, output BRANCH, output [2:0] ALUC, output ALUSRCB, output WRITEMEM, output WRITEREG, output MEMTOREG, output REGDES, output WRFLAG);
	parameter AND = 4'b0000;
	parameter OR = 4'b0001;
	parameter ADD = 4'b0010;
	parameter SUB = 4'b0011;
	parameter SLT = 4'b0100;
	parameter SUBC = 4'b0101;
	parameter ADDC = 4'b0110;
	parameter JMP = 4'b0111;
	parameter ANDI = 4'b1000;
	parameter ORI = 4'b1001;
	parameter ADDI = 4'b1010;
	parameter LW = 4'b1011;
	parameter SW = 4'b1100;
	parameter BEQ = 4'b1101;
	parameter BNE = 4'b1110;
	parameter JMPB = 4'b1111;
	
	assign JUMP = (op == JMP)? 1 : 0;
	assign BRANCH = (((op == BEQ)&&(ZERO == 1'b1)) || ((op == BNE)&&(ZERO == 1'b0)) || ((op == JMPB)&&(ZERO == 1'b0)))? 1 : 0;
	assign ALUC = (op == SLT || op == JMPB)? 3'b011 : ((op == ADD || op == ADDI || op == LW || op == SW)? 3'b101 : ((op == OR || op == ORI)? 3'b110 : ((op == SUB || op == BNE || op == BEQ)? 3'b001 : ((op == AND || op == ANDI)? 3'b000 : ((op == SUBC)? 3'b010 : ((op == ADDC)? 3'b100 : 3'b111)) ) ) ) );
	assign ALUSRCB = (op == ADDI || op == ANDI || op == ORI || op == SW || op == LW )? 1 : 0;
	assign WRITEMEM = (op == SW)? 1 : 0;
	assign WRITEREG = (op == ADDI || op == ANDI || op == ORI || op == SLT || op == LW || op == SUBC || op == ADDC || op == ADD || op == SUB || op == AND || op == OR)? 1 : 0;
	assign MEMTOREG = (op == LW)? 1 : 0;
	assign REGDES = (op == AND || op == OR || op == ADD || op == SUB || op == SLT || op == SUBC || op == ADDC)? 1 : 0;
	assign WRFLAG = (op == ADDI || op == ADD || op == SUB || op == SUBC || op == ADDC)? 1 : 0;
	
	endmodule 
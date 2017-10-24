// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.0 Build 156 04/24/2013 SJ Full Version"
// CREATED		"Wed Oct 18 23:25:29 2017"

module test_computer(
	CLK,
	reset_pin,
	carryin,
	carryout
);


input wire	CLK;
input wire	reset_pin;
input wire	carryin;
output wire	carryout;

wire	[2:0] aluc;
wire	q0;
wire	q1;
wire	q10;
wire	q11;
wire	q12;
wire	q13;
wire	q14;
wire	q15;
wire	q2;
wire	Q20;
wire	Q21;
wire	Q22;
wire	Q23;
wire	Q24;
wire	Q25;
wire	Q26;
wire	Q27;
wire	q3;
wire	q4;
wire	q5;
wire	q6;
wire	q7;
wire	q8;
wire	q9;
wire	[7:0] ram_q;
wire	reset;
wire	[7:0] result;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[7:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	[7:0] SYNTHESIZED_WIRE_11;
wire	[1:0] SYNTHESIZED_WIRE_12;
wire	[7:0] SYNTHESIZED_WIRE_13;
wire	[7:0] SYNTHESIZED_WIRE_14;

wire	[7:0] GDFX_TEMP_SIGNAL_2;
wire	[7:0] GDFX_TEMP_SIGNAL_6;
wire	[7:0] GDFX_TEMP_SIGNAL_9;
wire	[7:0] GDFX_TEMP_SIGNAL_3;
wire	[7:0] GDFX_TEMP_SIGNAL_5;
wire	[3:0] GDFX_TEMP_SIGNAL_4;
wire	[1:0] GDFX_TEMP_SIGNAL_7;
wire	[1:0] GDFX_TEMP_SIGNAL_0;
wire	[1:0] GDFX_TEMP_SIGNAL_8;
wire	[1:0] GDFX_TEMP_SIGNAL_1;


assign	GDFX_TEMP_SIGNAL_2 = {Q27,Q26,Q25,Q24,Q23,Q22,Q21,Q20};
assign	GDFX_TEMP_SIGNAL_6 = {Q27,Q26,Q25,Q24,Q23,Q22,Q21,Q20};
assign	Q27 = GDFX_TEMP_SIGNAL_9[7];
assign	Q26 = GDFX_TEMP_SIGNAL_9[6];
assign	Q25 = GDFX_TEMP_SIGNAL_9[5];
assign	Q24 = GDFX_TEMP_SIGNAL_9[4];
assign	Q23 = GDFX_TEMP_SIGNAL_9[3];
assign	Q22 = GDFX_TEMP_SIGNAL_9[2];
assign	Q21 = GDFX_TEMP_SIGNAL_9[1];
assign	Q20 = GDFX_TEMP_SIGNAL_9[0];

assign	GDFX_TEMP_SIGNAL_3 = {q7,q6,q5,q4,q3,q2,q1,q0};
assign	GDFX_TEMP_SIGNAL_5 = {q7,q6,q5,q4,q3,q2,q1,q0};
assign	GDFX_TEMP_SIGNAL_4 = {q15,q14,q13,q12};
assign	GDFX_TEMP_SIGNAL_7 = {q11,q10};
assign	GDFX_TEMP_SIGNAL_0 = {q9,q8};
assign	GDFX_TEMP_SIGNAL_8 = {q9,q8};
assign	GDFX_TEMP_SIGNAL_1 = {q7,q6};

assign	SYNTHESIZED_WIRE_7 =  ~CLK;


busmux_0	b2v_inst12(
	.sel(SYNTHESIZED_WIRE_0),
	.dataa(GDFX_TEMP_SIGNAL_0),
	.datab(GDFX_TEMP_SIGNAL_1),
	.result(SYNTHESIZED_WIRE_12));


busmux_1	b2v_inst13(
	.sel(SYNTHESIZED_WIRE_1),
	.dataa(GDFX_TEMP_SIGNAL_2),
	.datab(GDFX_TEMP_SIGNAL_3),
	.result(SYNTHESIZED_WIRE_14));


busmux_2	b2v_inst14(
	.sel(SYNTHESIZED_WIRE_2),
	.dataa(result),
	.datab(ram_q),
	.result(SYNTHESIZED_WIRE_11));

assign	SYNTHESIZED_WIRE_10 =  ~CLK;


ctrlunit	b2v_inst2(
	.ZERO(SYNTHESIZED_WIRE_3),
	.op(GDFX_TEMP_SIGNAL_4),
	.JUMP(SYNTHESIZED_WIRE_5),
	.BRANCH(SYNTHESIZED_WIRE_4),
	.ALUSRCB(SYNTHESIZED_WIRE_1),
	.WRITEMEM(SYNTHESIZED_WIRE_6),
	.WRITEREG(SYNTHESIZED_WIRE_9),
	.MEMTOREG(SYNTHESIZED_WIRE_2),
	.REGDES(SYNTHESIZED_WIRE_0),
	
	.ALUC(aluc));
	defparam	b2v_inst2.ADD = 4'b0010;
	defparam	b2v_inst2.ADDC = 4'b0110;
	defparam	b2v_inst2.ADDI = 4'b1010;
	defparam	b2v_inst2.AND = 4'b0000;
	defparam	b2v_inst2.ANDI = 4'b1000;
	defparam	b2v_inst2.BEQ = 4'b1101;
	defparam	b2v_inst2.BNE = 4'b1110;
	defparam	b2v_inst2.JMP = 4'b0111;
	defparam	b2v_inst2.LW = 4'b1011;
	defparam	b2v_inst2.OR = 4'b0001;
	defparam	b2v_inst2.ORI = 4'b1001;
	defparam	b2v_inst2.SLT = 4'b0100;
	defparam	b2v_inst2.SUB = 4'b0011;
	defparam	b2v_inst2.SUBC = 4'b0101;
	defparam	b2v_inst2.SW = 4'b1100;


instrconunit	b2v_inst3(
	.BRANCH(SYNTHESIZED_WIRE_4),
	.JUMP(SYNTHESIZED_WIRE_5),
	.CLK(CLK),
	.RESET(reset),
	.imm(GDFX_TEMP_SIGNAL_5),
	.PC(SYNTHESIZED_WIRE_8));


lpm_ram	b2v_inst4(
	.CLK(CLK),
	.wren(SYNTHESIZED_WIRE_6),
	.aclr(reset),
	.addr(result),
	.data(GDFX_TEMP_SIGNAL_6),
	.q(ram_q));
	defparam	b2v_inst4.RAM_SIZE = 256;


lpm_rom_256_16	b2v_inst5(
	.clock(SYNTHESIZED_WIRE_7),
	.address(SYNTHESIZED_WIRE_8),
	.q({q15,q14,q13,q12,q11,q10,q9,q8,q7,q6,q5,q4,q3,q2,q1,q0}));


reg4_8	b2v_inst6(
	.REG_WE(SYNTHESIZED_WIRE_9),
	.CLK(SYNTHESIZED_WIRE_10),
	.RESET(reset),
	.DI(SYNTHESIZED_WIRE_11),
	.N1(GDFX_TEMP_SIGNAL_7),
	.N2(GDFX_TEMP_SIGNAL_8),
	.ND(SYNTHESIZED_WIRE_12),
	.Q1(SYNTHESIZED_WIRE_13),
	.Q2(GDFX_TEMP_SIGNAL_9));


alu8	b2v_inst8(
	.carry_in(carryin),
	.ALUOP(aluc),
	.DATA_A(SYNTHESIZED_WIRE_13),
	.DATA_B(SYNTHESIZED_WIRE_14),
	.carry_out(carryout),
	.ZERO(SYNTHESIZED_WIRE_3),
	.RESULT(result));

assign	reset = reset_pin;

endmodule

module busmux_0(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [1:0] dataa;
input [1:0] datab;
output [1:0] result;

endmodule

module busmux_1(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [7:0] dataa;
input [7:0] datab;
output [7:0] result;

endmodule

module busmux_2(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [7:0] dataa;
input [7:0] datab;
output [7:0] result;

endmodule

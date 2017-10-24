// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.0 Build 156 04/24/2013 SJ Full Version"
// CREATED		"Wed Oct 18 23:34:37 2017"

module alu8(
	carry_in,
	ALUOP,
	DATA_A,
	DATA_B,
	ZERO,
	carry_out,
	RESULT
);


input wire	carry_in;
input wire	[2:0] ALUOP;
input wire	[7:0] DATA_A;
input wire	[7:0] DATA_B;
output wire	ZERO;
output wire	carry_out;
output wire	[7:0] RESULT;

wire	[2:0] cs;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_7;
wire	[7:0] SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[7:0] SYNTHESIZED_WIRE_11;

assign	ZERO = SYNTHESIZED_WIRE_2;
assign	RESULT = SYNTHESIZED_WIRE_3;



assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1 & cs[0] & SYNTHESIZED_WIRE_2;


zero_detect	b2v_inst1(
	.data(SYNTHESIZED_WIRE_3),
	.zero(SYNTHESIZED_WIRE_2));

assign	SYNTHESIZED_WIRE_1 =  ~cs[1];

assign	carry_out = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;


zero_convert	b2v_inst2(
	.zero(SYNTHESIZED_WIRE_6),
	.data(SYNTHESIZED_WIRE_8));


lpm_and_8	b2v_inst3(
	.data0x(DATA_A),
	.data1x(DATA_B),
	.result(SYNTHESIZED_WIRE_7));


lpm_or_8	b2v_inst4(
	.data0x(DATA_A),
	.data1x(DATA_B),
	.result(SYNTHESIZED_WIRE_9));


lpm_add_sub_8	b2v_inst5(
	.add_sub(cs[2]),
	.dataa(DATA_A),
	.datab(DATA_B),
	.result(SYNTHESIZED_WIRE_10));


muxunit	b2v_inst6(
	.data_and(SYNTHESIZED_WIRE_7),
	.data_cmp(SYNTHESIZED_WIRE_8),
	.data_or(SYNTHESIZED_WIRE_9),
	.data_plusminus(SYNTHESIZED_WIRE_10),
	.data_pmC(SYNTHESIZED_WIRE_11),
	.sel(cs),
	.result(SYNTHESIZED_WIRE_3));


lpm_add_sub_8_C	b2v_inst7(
	.add_sub(cs[2]),
	.cin(carry_in),
	.dataa(DATA_A),
	.datab(DATA_B),
	.cout(SYNTHESIZED_WIRE_4),
	.result(SYNTHESIZED_WIRE_11));

assign	SYNTHESIZED_WIRE_0 =  ~cs[2];


lpm_compare_8	b2v_inst9(
	.dataa(DATA_A),
	.datab(DATA_B),
	.alb(SYNTHESIZED_WIRE_6));

assign	cs = ALUOP;

endmodule

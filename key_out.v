// s0等待输入
// s1前一个数
// s2符号
// s3后一个数字
//OUT_flag 表示数量
//OUT_ctrl = OUT_finish + OUT_state + OUT_flag + 0;

module key_out(input IN_clk, input [3:0] IN_value, input IN_key, input IN_reset, input IN_wr,
					inout [7:0] OUT_SRCH, inout [7:0] OUT_SRCL, inout [7:0] OUT_DSTH, inout [7:0] OUT_DSTL, 
					inout [7:0] OUT_ALU_OP, inout [7:0] OUT_ctrl);
	assign OUT_SRCH = IN_wr? temp1[15:8] : 8'bz;
	assign OUT_SRCL = IN_wr? temp1[7:0] : 8'bz;
	assign OUT_DSTH = IN_wr? temp2[15:8] :8'bz;
	assign OUT_DSTL = IN_wr? temp2[7:0] : 8'bz;
	assign OUT_ctrl = IN_wr? {OUT_finish,state,/*OUT_flag,2'b0*/5'b0}:8'bz;
	assign OUT_ALU_OP = IN_wr? ALU_OP:8'bz;
	
	//reg IN_wr = 1'b1;
	reg [7:0]ALU_OP = 0;
	reg OUT_finish = 0;
	reg [2:0] OUT_flag = 0;
	reg [15:0] temp1 = 0; //用于第一个数
	reg [15:0] temp2 = 0; //用于第二个数
	reg [1:0] state = 0;
	parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3;
	
	always @(posedge IN_clk or negedge IN_reset)
	begin
		if(!IN_reset)
			begin
				state = s0;
				temp1 = 16'b0;
				temp2 = 16'b0;
				OUT_flag = 3'b01;
				OUT_finish = 1'b0;
				ALU_OP = 0;
			end
		else if(IN_key)
			case(state)
				s0: begin
					if(IN_value == 4'hF)
					begin
						state = s0;
						temp1 = 16'b0;
						temp2 = 16'b0;
						OUT_flag = 3'b0;
						OUT_finish = 1'b0;
						ALU_OP = 0;
					end
					else if(IN_value > 4'h9)
					begin
						temp1 = 16'b0;
						ALU_OP = IN_value;
						OUT_flag = 3'b00;
						temp2 = 8'b0;
						state = s2;
					end
					else
					begin
					if(OUT_flag < 3'd3)
					begin
						temp1 = temp1 * 4'd10+ IN_value;
						OUT_flag =OUT_flag + 3'b01;
					end
					else
					begin
						temp1 = temp1;
						OUT_flag =OUT_flag;
					end	
					state = s1;	
					end
						
						
				end
				
				s1: begin   
					if(IN_value == 4'hF)
						state = s1;
					else if(IN_value > 4'h9)
					begin
						state = s2;
						ALU_OP = IN_value;
						OUT_flag = 3'b00;
						temp2 = 16'b0;
					end
					else
					begin
						state = s1;
						if(OUT_flag < 3'd3)
							begin
								temp1 = temp1 * 4'd10 + IN_value;
								OUT_flag =OUT_flag + 3'b01;
							end
							else
							begin
								temp1 = temp1;
								OUT_flag =OUT_flag;
							end		
					end
				end
				
				s2:begin
					if(IN_value == 4'hF)
						state = s2;
					else if(IN_value > 4'h9)
					begin
						ALU_OP = IN_value;
						state = s2;
						OUT_finish = 1'b0;
						temp2 = 16'b0;
					end
					else
						begin
						if(!OUT_finish)
							state = s3;
						if(OUT_flag < 3'd3)
						begin
							temp2 = temp2 * 4'd10 + IN_value;
							OUT_flag =OUT_flag + 3'b01;
						end
						else
						begin
							temp2 = temp2;
							OUT_flag =OUT_flag;
						end	
						end
				end
				s3:begin
				if(IN_value == 4'hF)
				begin
					OUT_finish = 1'b1;
					state = s2;
					OUT_flag = 3'b0;
					ALU_OP = ALU_OP;
				end
				else if(IN_value > 4'h9)
					begin
						state = s3;
					end
				else
					if(OUT_flag < 3'd3)
					begin
						temp2 = temp2 * 4'd10 + IN_value;
						OUT_flag =OUT_flag + 3'b01;
					end
					else
					begin
						temp2 = temp2;
						OUT_flag =OUT_flag;
					end		
				end
			endcase
		else //没有按键
		begin
		//运算结束后先跳转到s2
			case(state)
			s0:begin state = s0; OUT_finish = 0; ALU_OP = 0;OUT_flag = 3'b0; temp1 = 16'b0; temp2 = 16'b0;end
			s1:state = s1;
			s2:begin state = s2; end
			s3:state = s3;
			default:state = s0;
			endcase
		end
	end
	
	
endmodule 
module key_scan(CLK,RESET,V1,V2,V3,V4,
				H1,H2,H3,H4,SRCH,SRCL,DSTH,DSTL,ALU_OP,finish);

//input and output
input CLK,RESET,V1,V2,V3,V4;
output H1,H2,H3,H4;
output [7:0] SRCH,SRCL,DSTH,DSTL;
output [7:0] ALU_OP;
output finish;

//reg
reg [7:0] SRCH,SRCL,DSTH,DSTL;
reg [7:0] ALU_OP;
reg choose,new_number;

//wire
wire [3:0] key_value;
wire [2:0] operator;
wire clk,numberflag,finish,opflag;

initial 
	begin
		SRCH<=0;
		SRCL<=0;
		DSTH<=0;
		DSTL<=0;
		ALU_OP<=0;
		choose<=0;
		new_number<=0;
	end

	
//read from key_in
key_in keyboard_in(CLK,RESET,{V1,V2,V3,V4},{H1,H2,H3,H4},finish,operator,key_value,numberflag,opflag);

always @ (negedge RESET or posedge numberflag or posedge finish or posedge opflag)
	begin
		if(!RESET) begin
			SRCH<=0; SRCL<=0; DSTH<=0; DSTL<=0; new_number<=0; end
		else begin
			if (finish||opflag) new_number<=1;
			else begin
				if(!choose) begin 
					if(new_number) {SRCH,SRCL}<=key_value;
					else begin if({SRCH,SRCL}<=99) {SRCH,SRCL}<={SRCH,SRCL}*10+key_value; end 
				end
				else begin
					if(new_number) {DSTH,DSTL}<=key_value;
					else begin if({DSTH,DSTL}<=99) {DSTH,DSTL}<={DSTH,DSTL}*10+key_value; end
				end
				new_number<=0;
			end
		end
	end	

always @ (negedge RESET or posedge opflag or posedge finish)
	begin
		if(!RESET) begin choose<=0; ALU_OP<=0; end
		else begin
			if(opflag) begin choose<=1; ALU_OP<={5'b00000,operator}; end
			else begin choose<=0; ALU_OP<=0; end
		end
	end

endmodule

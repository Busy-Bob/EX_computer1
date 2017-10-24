module key_in(clk,RST,V,H,equal,operator,key_value,numberflag,opflag);
input clk,RST;
input [3:0] V;
output equal,numberflag,opflag;
output [3:0] H,key_value;
output [2:0] operator;
reg pressflag,numberflag,opflag,rst_pressflag,equal;
reg [2:0] operator;
reg [1:0] nH;
reg [3:0] H,key_value;
reg [4:0] delay;
reg [3:0] release_count;
reg [1:0] fangdou;

initial
	begin
		nH<=0;
		equal<=0;
		pressflag<=0;
		delay<=0;
		H<=4'b1111;
		rst_pressflag<=0;
		release_count<=0;
		numberflag<=0;
		operator<=0;
		opflag<=0;
		fangdou<=0;
	end


//judge if a key is pressed
always @ (posedge clk or negedge RST)
	begin
	if(!RST) begin rst_pressflag=0; pressflag=0; end
	else begin
		if(V!=0)
			begin
				delay=delay+1;
				if(delay==5) 
					begin pressflag=1;delay=0; end
			end
		else
			delay=0;
		if(rst_pressflag) pressflag=0;
		if(release_count==6) rst_pressflag=1;
		else rst_pressflag=0; 
		end
	end


//when the key pressed, do this	
always @ (posedge (clk&&pressflag) or negedge RST)
	begin
	if(!RST) begin
		nH=0;
		release_count=0;
		numberflag=0;
		opflag=0;
		H=4'b1111;
		equal=0;
		key_value=0;
		operator=0;
		fangdou=0;
	end
	else begin
		if((!numberflag)&&(!opflag)&&(!equal))
			begin
				case({H[3:0],V[3:0]})
					8'b10001000:begin key_value=1;fangdou=fangdou+1;if(fangdou==2) begin numberflag=1; fangdou=0;end end
					8'b01001000:begin key_value=2;fangdou=fangdou+1;if(fangdou==2) begin numberflag=1; fangdou=0;end end
					8'b00101000:begin key_value=3;fangdou=fangdou+1;if(fangdou==2) begin numberflag=1; fangdou=0;end end
					8'b10000100:begin key_value=4;fangdou=fangdou+1;if(fangdou==2) begin numberflag=1; fangdou=0;end end
					8'b01000100:begin key_value=5;fangdou=fangdou+1;if(fangdou==2) begin numberflag=1; fangdou=0;end end
					8'b00100100:begin key_value=6;fangdou=fangdou+1;if(fangdou==2) begin numberflag=1; fangdou=0;end end
					8'b10000010:begin key_value=7;fangdou=fangdou+1;if(fangdou==2) begin numberflag=1; fangdou=0;end end
					8'b01000010:begin key_value=8;fangdou=fangdou+1;if(fangdou==2) begin numberflag=1; fangdou=0;end end
					8'b00100010:begin key_value=9;fangdou=fangdou+1;if(fangdou==2) begin numberflag=1; fangdou=0;end end
					8'b10000001:begin key_value=0;fangdou=fangdou+1;if(fangdou==2) begin numberflag=1; fangdou=0;end end
					8'b01000001:begin equal=1; end
					8'b00100001:begin operator=3'b101;fangdou=fangdou+1;if(fangdou==2) begin opflag=1; fangdou=0;end end
					8'b00011000:begin operator=3'b001;fangdou=fangdou+1;if(fangdou==2) begin opflag=1; fangdou=0;end end
					8'b00010100:begin operator=3'b010;fangdou=fangdou+1;if(fangdou==2) begin opflag=1; fangdou=0;end end
					8'b00010010:begin operator=3'b011;fangdou=fangdou+1;if(fangdou==2) begin opflag=1; fangdou=0;end end
					8'b00010001:begin operator=3'b100;fangdou=fangdou+1;if(fangdou==2) begin opflag=1; fangdou=0;end end
				endcase
			end
		H=(4'b1000>>nH);
		nH=nH+1;
		//judge if the key is released
		if(V==0)
			begin
				release_count=release_count+1;
				if(release_count==8)
					begin
						nH=0;
						release_count=0;
						numberflag=0;
						opflag=0;
						H=4'b1111;
						equal=0;
					end
			end
		else release_count=0;	
		end					
	end

endmodule

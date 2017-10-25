module clk_div
(
	input clk,
	output reg clk_out_250,
	output reg clk_out
);

reg [16:0] cnt_250; 
reg [16:0] cnt; 

always @(posedge clk) begin
	if (cnt_250 == 17'd49999)
		begin
			cnt_250 <= 17'd0;
			clk_out_250 <= ~clk_out_250;
		end
	else 
		cnt_250 <= cnt_250 + 17'd1;
		
	if (cnt == 17'd499)
		begin
			cnt <= 17'd0;
			clk_out <= ~clk_out;
		end
	else 
		cnt <= cnt + 17'd1;
end

endmodule

module lpm_ram(
input [7:0] addr,
input CLK,
input wren,
input aclr,
input [7:0] data,
output [7:0] q);

parameter RAM_SIZE = 256;
reg [7:0] RAMDATA [RAM_SIZE-1:0];
reg [7:0] read_data;
assign q = (aclr)?read_data:8'b0;

always@(posedge CLK) begin
        read_data<=RAMDATA[addr];
		  if(wren) RAMDATA[addr]<=data;
end


endmodule

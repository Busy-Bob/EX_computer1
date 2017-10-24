module keyboard(H,key,V);
input [3:0] H;
input [15:0] key;
output [3:0] V;

assign V[0]=(key[1]&&H[0])||(key[2]&&H[1])||(key[3]&&H[2])||(key[15]&&H[3]);
assign V[1]=(key[4]&&H[0])||(key[5]&&H[1])||(key[6]&&H[2])||(key[14]&&H[3]);
assign V[2]=(key[7]&&H[0])||(key[8]&&H[1])||(key[9]&&H[2])||(key[13]&&H[3]);
assign V[3]=(key[0]&&H[0])||(key[10]&&H[1])||(key[11]&&H[2])||(key[12]&&H[3]); 

endmodule 
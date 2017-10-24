module ALU(data_a,data_b,CS,carry_in,S,zero,carry_out);
input [7:0] data_a;
input [7:0] data_b;
input [2:0] CS;
input carry_in;
output reg [7:0] S;
output zero;
output  reg carry_out;

wire c0,c1,c2,c3;
wire [7:0] no_carry_sum,no_carry_sub,unsign_cmp,carry_sub,carry_sum;
assign zero = ~|S;
adder8 nocarry_sum(.A(data_a), .B(data_b),.cin(1'b0),.S(no_carry_sum), .carry_out(c0));
adder8 carrysum(.A(data_a), .B(data_b),.cin(carry_in),.S(carry_sum), .carry_out(c1));
adder8 nocarrysub(.A(data_a), .B(~data_b),.cin(1'b1),.S(no_carry_sub), .carry_out(c2));
adder8 carrysub(.A(data_a), .B(~data_b),.cin(~carry_in),.S(carry_sub), .carry_out(c3));

always@(*) begin
    case(CS)
        3'b000:S <= data_a & data_b;//与
        3'b001:S <= data_a | data_b;//或
        3'b010:S <= no_carry_sum;//不带进位加
        3'b011:S <= no_carry_sub;//不带借位减
        3'b100: //无符号比较
            begin 
                if(data_a<data_b)
                    S <= 8'b1;
                else
                    S <= 8'b0;
            end
        3'b101://带借位减
            begin
                S = carry_sub;
                carry_out <= c3;
             end
        3'b110://带进位加
            begin
                S <= carry_sum;
                carry_out <= c1;
            end 
    endcase     
end

endmodule

module adder8(A, B, cin, S, carry_out);
input cin;
input [7:0] A,B;
output carry_out;
output [7:0] S;

wire c1,c2;
adder4sup a4_1(.A(A[3:0]),.B(B[3:0]),.cin(cin),.S(S[3:0]),.co(c1));
adder4sup a4_2(.A(A[7:4]),.B(B[7:4]),.cin(c1),.S(S[7:4]),.co(carry_out));


endmodule


module adder4sup(A, B, cin, S, co);
input cin;
input [3:0] A,B;
output co;
output [3:0] S;

wire  [2:0] c;
wire  [3:0] g,p;

xor(p[0],A[0],B[0]);
and(g[0],A[0],B[0]);
xor(p[1],A[1],B[1]);
and(g[1],A[1],B[1]);
xor(p[2],A[2],B[2]);
and(g[2],A[2],B[2]);
xor(p[3],A[3],B[3]);
and(g[3],A[3],B[3]);

xor(S[0],cin,A[0],B[0]);
xor(S[1],c[0],A[1],B[1]);
xor(S[2],c[1],A[2],B[2]);
xor(S[3],c[2],A[3],B[3]);


assign c[0]=(g[0]||p[0])&&(g[0]||cin);
assign c[1]=(g[1]||p[1])&&(g[1]||g[0]||p[0])&&(g[1]||g[0]||cin);
assign c[2]=g[2]||(p[2]&&g[1])||(p[2]&&p[1]&&g[0])||(p[2]&&p[1]&&p[0]&&cin);
assign co=g[3]||(p[3]&&g[2])||(p[3]&&p[2]&&g[1])||(p[3]&&p[2]&&p[1]&&g[0])||(p[3]&&p[2]&&p[1]&&p[0]&&cin);

endmodule
module mux4_1(sel,IN0,IN1,IN2,IN3,out);
parameter N=48;
input [1:0] sel;
input [N-1:0] IN0,IN1,IN2,IN3;
output reg [N-1:0] out;

always @(*) begin
	case(sel)
		2'b00: out=IN0;
		2'b01: out=IN1;
		2'b10: out=IN2;
		2'b11: out=IN3; 
		endcase
end
endmodule
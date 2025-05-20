module mux_dsp (in,CE,out,clk,rst);
parameter RSTTYPE="SYNC";
parameter N= 8;
parameter sel= 1;
input [N-1:0]in;
input clk,rst,CE;
output [N-1:0]out;
reg [N-1:0]IN_REG;

generate  
case (RSTTYPE)
"SYNC" : always @(posedge clk) begin
	if (rst) begin
	    IN_REG<=0;
	end
	else if (CE) begin
		IN_REG<=in;
	end
end
"ASYNC" :always @(posedge clk ,posedge rst) begin
	if (rst) begin
	    IN_REG<=0;
	end
	else if (CE) begin
		IN_REG<=in;
	end
end
default: always @(posedge clk) begin
	if (rst) begin
	    IN_REG<=0;
	end
	else if (CE) begin
		IN_REG<=in;
	end
end
endcase
endgenerate

assign out = (sel==1)? IN_REG : in;
endmodule
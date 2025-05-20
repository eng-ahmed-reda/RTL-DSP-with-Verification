module post_adder (x,z,cin,cout,sel,out);
input [47:0]x,z;
input sel,cin;
output [47:0]out;
output cout;
wire [48:0]sum ;
assign sum =(sel==1)?(z-(x+cin)):(x+z+cin);
assign cout =sum[48];
assign out =sum[47:0];
endmodule
module DSP_tb();

reg [17:0] A,B,D,BCIN;
reg [47:0]C,PCIN;
reg [7:0]OPMODE;
reg clk,CARRYIN,RSTA,RSTB,RSTM,RSTP,RSTC,RSTD,RSTCARRYIN,RSTOPMODE,CEA,CEB,CEM,CEP,CEC,CED,CECARRYIN,CEOPMODE;

wire [17:0]BCOUT;
wire [47:0]PCOUT,P;
wire [35:0]M;
wire CARRYOUT,CARRYOUTF;

DSP m1 (A,B,D,BCIN,C,PCIN,OPMODE,clk,CARRYIN,RSTA,RSTB,RSTM,RSTP,RSTC,RSTD,RSTCARRYIN,RSTOPMODE,CEA,CEB,CEM,CEP,CEC,CED,CECARRYIN,CEOPMODE,BCOUT,PCOUT,P,M,CARRYOUT,CARRYOUTF);

initial 
begin
    clk=0;
    forever
        #1 clk=~clk;
end

initial
begin
 A=0;
 B=0;
 D=0;
 BCIN=0;
 C=0;
 PCIN=0;
 CARRYIN=0;
 
 CEA=0;
 CEB=0;
 CEM=0;
 CEP=0;
 CEC=0;
 CED=0;
 CECARRYIN=0;
 CEOPMODE=0;
 RSTA=1;
 RSTB=1;
 RSTM=1;
 RSTP=1;
 RSTC=1;
 RSTD=1;
 RSTCARRYIN=1;
 RSTOPMODE=1;
 
 @(negedge clk);
 
 RSTA=0;
 RSTB=0;
 RSTM=0;
 RSTP=0;
 RSTC=0;
 RSTD=0;
 RSTCARRYIN=0;
 RSTOPMODE=0;
 CEA=1;
 CEB=1;
 CEM=1;
 CEP=1;
 CEC=1;
 CED=1;
 CECARRYIN=1;
 CEOPMODE=1;
 repeat(1000) begin
 A=$random;
 B=$random;
 D=$random;
 BCIN=$random;
 C=$random;
 PCIN=$random;
 OPMODE=$random;
 CARRYIN=$random;
 @(negedge clk);
 end
 $stop;
end
endmodule
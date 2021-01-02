`timescale 1ns / 1ps

module topsim; 
// Inputs 
reg clkin; 
reg sm_clk;
reg reset; 
//wire [31:0]input2;
wire [6:0] sm_duan;//¶ÎÂë
wire [3:0] sm_wei;//ÄÄ¸öÊýÂë¹Ü

wire [31:0]index;
wire [31:0]aluRes;
wire [31:0]instruction;

reg [2:0] SW;
// Instantiate the Unit Under Test (UUT) 
topmy uut( 
.clkin(clkin), 
.sm_clk(sm_clk),
.reset(reset) ,
.PC(index),
.aluRes(aluRes),
.instruction(instruction),
//.input2(input2),
//.branch_Addr(branch_addr),
.sm_duan(sm_duan),
.sm_wei(sm_wei),

.SW(SW)


); 
//wire reg_dst,jmp,branch, memread, memwrite, memtoreg,alu_src; 
//ire[1:0] aluop;

initial begin 
// Initialize Inputs 
clkin = 0; 
reset = 1; 
//index=0;
// Wait 100 ns for global reset to finish 
SW = 3'b000;
#10; 
reset = 0; 
end 
parameter PERIOD = 20; 
always begin 
clkin = 1'b1; 
#(PERIOD / 2) clkin = 1'b0; 
#(PERIOD / 2) ; 
//index=index+1;
end 

always begin
    #895 reset = 1;
    #10 reset = 0;
end
always begin
sm_clk = 1;
#0.01 sm_clk = 0;
#0.01 ;
end
endmodule 

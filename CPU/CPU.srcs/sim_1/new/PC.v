`timescale 1ns / 1ps


module PC;
reg branch, zero,jmp;
reg clkin;wire [31:0] PC;
reg reset;
wire jal,jr;reg bne;
wire [31:0] instruction;
wire [31:0] branch_addr;
PCctr ut(
    .clkin(clkin),
    .reset(reset),
    .next_pc(PC),
    .branch(branch),
    .zero(zero),
    .jmp(jmp),
    .jal(jal),
    .jr(jr),
    .bne(bne),
    .branch_Addr(branch_addr),
    .instruction(instruction));    
assign instruction = 32'h0000_0004;
assign jal = 0;assign jr = 0;

parameter PERIOD = 20; 
initial begin
clkin = 0;
jmp = 0;
reset = 1;
branch = 0;
zero = 0;
bne = 0;
#10 clkin = 1;
#10 reset = 0;
end
always begin
clkin = 1;
#(PERIOD/2) clkin = 0;
#(PERIOD/2) ;
end
always begin
#500 
 branch = 1;
 zero = 1;
#20
 branch = 0;
 bne = 1;
#20 
 zero = 0;
end
endmodule


`timescale 1ns / 1ps

module PCctr(
    input clkin,
    input reset,
    output reg [31:0] next_pc,
	input zero,
	input jmp,
	input jal,
	input jr,
	input bne,
	input beq,
	//output wire [31:0]branch_Addr,
//	output wire [31:0]J_Addr,
	input [25:0]instruction
    
	);
reg[31:0] pc,add4;//pc+4 
initial 
begin
    add4 <= 0;
    pc <= 0;
end
wire [31:0] branch_Addr;
//wire   bne,  jal,jr; //跳转有关控制信号
wire PCSrc1, PCSrc2;
wire [1:0]PCSrc; //pc选择控制信号
wire [31:0] J_Addr ;//Branch跳转地址和j 跳转地址
//wire [31:0] instruction;//从ROM中读的指令
//reg [31:0] pc;
wire [31:0] addop;
assign addop = instruction[15:15]? {16'hffff,instruction[15:0]}:{16'h0000,instruction[15:0]};
assign branch_Addr = next_pc + addop;
assign J_Addr ={add4[31:28], instruction[25:0]}; 
//PC的多选器

assign PCSrc1 = (  (bne & zero) | (beq & ~zero))? 1'b1:1'b0;
//assign PCSrc1 = (branch & zero )?1'b1:1'b0; //bne
assign PCSrc2 = (jmp | jal)?1'b1:1'b0;
assign PCSrc={PCSrc2, PCSrc1};

//always@(posedge clkin)
//if(reset)begin
//    pc = 32'b0;
//    add4 = pc;
//end

always@(posedge clkin)
begin
    if(reset)begin
    pc = 32'b0;
    add4 = 32'b0;
    end
    else begin
    case(PCSrc)
        2'b00: next_pc = add4;//没有分支也没有jump
        2'b01: next_pc = branch_Addr; //有Branch
        2'b10: next_pc = J_Addr ;//有j
        2'b11: next_pc = J_Addr ;//有j
        default: next_pc = add4 ;
    endcase
    pc = next_pc;
    add4 = pc+1;
    end
       
end


endmodule

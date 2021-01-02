`timescale 1ns / 1ps
module ctr(
    input [5:0] opCode, input [5:0] func,
    output reg regDst, output reg aluSrc, output reg memToReg, output reg regWrite, output reg memRead, output reg memWrite, output reg branch,
    output reg ExtOp, //符号扩展方式，1 为 sign-extend，0 为 zero-extend
    output reg[3:0] aluop, // 经过 ALU 控制译码决定 ALU 功能
    output reg jmp,
    output reg jr,
    output reg jal,
    output reg bne,
    output reg beq
);

always@(opCode) begin
// 操作码改变时改变控制信号
    case(opCode)
6'b001010: begin
    regDst = 0;  aluSrc = 1; memToReg = 0;
    regWrite = 1; memRead = 0; memWrite = 0; branch = 0; aluop = 4'b0001; jmp = 0; ExtOp = 1;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 'slti' 指令 

6'b001011: begin
    regDst = 0;  aluSrc = 1; memToReg = 0;
    regWrite = 1; memRead = 0; memWrite = 0; branch = 0; aluop = 4'b0001; jmp = 0; ExtOp = 0;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 'sltiu' 指令 


6'b000010: begin
    regDst = 0;  aluSrc = 0; memToReg = 0;
    regWrite = 0; memRead = 0; memWrite = 0; branch = 0; aluop = 4'b1111; jmp = 1; ExtOp = 1;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 'J 型' 指令操作码: 000010，无需 ALU

6'b000011:begin
    regDst = 1;  aluSrc = 0; memToReg = 0;
    regWrite = 1; memRead = 0; memWrite = 0; branch = 0; aluop = 4'b1111; jmp = 1; ExtOp = 1;
    jr = 0;jal = 1;bne = 0;beq = 0;
end // 'Jal' type，不需要ALU

6'b000000: begin
    regDst = 1; aluSrc = 0;  memToReg = 0;
    regWrite = 1; memRead = 0; memWrite = 0; aluop = 4'b0000; jmp = 0;
    jr = 0;jal = 0;bne = 0;beq = 0;
    case(func) 
        6'b100001: begin ExtOp = 0; branch = 0; end // addu
        6'b100011: begin ExtOp = 0; branch = 0; end // subu
        6'b101011: begin ExtOp = 0; branch = 0; end // sltu
        //6'b000000: begin ExtOp = 1; branch = 0; end // sll
        6'b000100: begin ExtOp = 0; branch = 1; end // sllv
        6'b000011: begin ExtOp = 1; branch = 0; end // sra
        6'b000111: begin ExtOp = 1; branch = 1; end // srav
        //6'b000010: begin ExtOp = 1; branch = 0; end // srl
        6'b000110: begin ExtOp = 1; branch = 1; end // srlv
        default: begin ExtOp = 1; branch = 0; end
    endcase
end // 'R 型' 指令操作码: 000000

//'I'型指令操作码
6'b100011: begin
    regDst = 0;  aluSrc = 1; memToReg = 1;
    regWrite = 1; memRead = 1; memWrite = 0; branch = 0; aluop = 4'b0011; jmp = 0; ExtOp = 1;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 'lw' 指令操作码: 100011

6'b101011: begin
    regDst = 0;  aluSrc = 1; memToReg = 0;
    regWrite = 0; memRead = 0; memWrite = 1; branch = 0; aluop = 4'b0011; jmp = 0; ExtOp = 1;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 'sw' 指令操作码: 101011

6'b000100: begin
    regDst = 0;  aluSrc = 0; memToReg = 0;
    regWrite = 0; memRead = 0; memWrite = 0; branch = 1; aluop = 4'b0110; jmp = 0; ExtOp = 1;
    jr = 0;jal = 0;bne = 0;beq = 1;
end // 'beq' 指令操作码: 000100

6'b000101: begin
    regDst = 0;  aluSrc = 0; memToReg = 0;
    regWrite = 0; memRead = 0; memWrite = 0; branch = 1; aluop = 4'b0110; jmp = 0; ExtOp = 1;
    jr = 0;jal = 0;bne = 1;beq = 0;
end // 'bne' 指令操作码: 000101

6'b001000: begin
    regDst = 0;  aluSrc = 1; memToReg = 0;
    regWrite = 1; memRead = 0; memWrite = 0;
    branch = 0; aluop = 4'b0011;jmp = 0;
    ExtOp = 1;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 'addi' 指令操作码: 001000

6'b001001:begin 
    regDst = 0; aluSrc = 1; memToReg = 0; 
    regWrite = 1; memRead = 0; memWrite = 0; branch = 0; aluop = 4'b0011; jmp = 0; ExtOp = 1;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 'addiu' 指令操作码: 001001

6'b001100: begin
    regDst = 0;  aluSrc = 1; memToReg = 0;
    regWrite = 1; memRead = 0; memWrite = 0; branch = 0; aluop = 4'b0100; jmp = 0; ExtOp = 1;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 'andi' 指令操作码: 001100

6'b001101: begin
    regDst = 0;  aluSrc = 1; memToReg = 0;
    regWrite = 1; memRead = 0; memWrite = 0; branch = 0; aluop = 4'b0010; jmp = 0; ExtOp = 1;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 'ori' 指令操作码: 001101

6'b001110: begin
    regDst = 0;  aluSrc = 1; memToReg = 0;
    regWrite = 1; memRead = 0; memWrite = 0; branch = 0; aluop = 4'b1000; jmp = 0; ExtOp = 1;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 'xori' 指令操作码: 001110


6'b001010: begin
    regDst = 0;  aluSrc = 1; memToReg = 0;
    regWrite = 1; memRead = 0; memWrite = 0; branch = 0; aluop = 4'b0100; jmp = 0; ExtOp = 1;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 'slti' 指令操作码: 001010

6'b001111: begin
    regDst = 0;  aluSrc = 1; memToReg = 0;
    regWrite = 1; memRead = 0; memWrite = 0; branch = 0; aluop = 4'b0111; jmp = 0; ExtOp = 0;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 'lui' 指令操作码: 001111

default: begin
    regDst = 0;  aluSrc = 0; memToReg = 0;
    regWrite = 0; memRead = 0; memWrite = 0; branch = 0; aluop = 4'b0xxx; jmp = 0; ExtOp = 0;
    jr = 0;jal = 0;bne = 0;beq = 0;
end // 默认设置
endcase end
endmodule

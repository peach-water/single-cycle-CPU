`timescale 1ns / 1ps
module aluctr(
    input [3:0] ALUOp, 
    input [5:0] funct, 
    output reg [4:0]  ALUCtr,
    input [31:0] instruction
);

always @(ALUOp or funct) //  如果操作码或者功能码变化执行操作
casex({ALUOp, funct}) // 拼接操作码和功能码便于下一步的判断
    10'b0000000011: ALUCtr = 4'b1011; // sra 
    10'b0000000111: ALUCtr = 5'b11011; // srav
    10'b0000100000: ALUCtr = 4'b0010; // add 
    10'b0000100001: ALUCtr = 4'b0010; // addu
    10'b0000100010: ALUCtr = 4'b0110; // sub 
    10'b0000100011: ALUCtr = 4'b0110; // subu
    10'b0000100100: ALUCtr = 4'b0000; // and
    10'b0000100101: ALUCtr = 4'b0001; // or 
    10'b0000100111: ALUCtr = 4'b0101; // nor
    10'b0000100110: ALUCtr = 4'b0100; // xor
    10'b0000101010: ALUCtr = 4'b0111; // slt
    10'b0000101011: ALUCtr = 4'b0111; // sltu
    10'b0000000000: ALUCtr = 4'b1000; // sll
    10'b0000000100: ALUCtr = 4'b1111; // sllv
    10'b0000000010: ALUCtr = 4'b1001; // srl
    10'b0000000110: ALUCtr = 5'b11001; // srlv
    10'b0001xxxxxx: ALUCtr = 4'b0111; // slti 
    10'b0010xxxxxx: ALUCtr = 4'b0001; // ori
    10'b0011xxxxxx: ALUCtr = 4'b0010; // lw，sw，addi 
    10'b0100xxxxxx: ALUCtr = 4'b0000; // andi
    10'b0111xxxxxx: ALUCtr = 4'b1101; // lui
    //10'b0101xxxxxx: ALUCtr = 4'b0011; // beq
    10'b0110xxxxxx: ALUCtr = 4'b0011; // bne，beq
    10'b1000xxxxxx: ALUCtr = 4'b0100; // xori
    default:ALUCtr = 5'b11111; 
endcase 

endmodule

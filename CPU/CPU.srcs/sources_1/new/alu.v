`timescale 1ns / 1ps

module alu(
    input clkin,
    input sm_clk,
    input [4:0] shamt,
    input [5:0] Opcode,
    input [5:0] func,
    input [31:0] input1,
    input [31:0] input2,
    input [4:0] aluCtr,
    input variable,
    output reg ZF, CF,OF, output reg[31:0] aluRes 
);
reg clk = 0;
reg [31:0] temp;
reg [31:0] cnt;
always@(sm_clk)begin
      cnt = cnt+1;
      if(cnt>=32'd10)
        clk=~clk;
            //cnt = 0;
end

always@(posedge clkin)begin
      cnt = 0;
end


always @(posedge clk) begin // 运算数或控制码变化时操作
//#0.001
case(aluCtr) 
4'b0000: begin//  与 and
    aluRes = input1 & input2; if(aluRes==0) ZF=1; else ZF=0;
end
4'b0001: begin// 或 or 
    aluRes = input1 | input2; if(aluRes==0) ZF=1; else ZF=0;
end
4'b0010: begin// 加addi add lw sw 
    {CF,aluRes} <= input1 + input2; 
    if(aluRes==0) ZF=1; else ZF=0;
    OF = input1[31]^input2[31]^aluRes[31]^CF;//溢出标志公式
end
4'b0011:begin//bne 
    aluRes=input1-input2;
    if(aluRes==0) ZF = 0;//这里的zero是指不为0，不相等
    else ZF=1;
end
4'b0100: begin//xor 
    aluRes=(~input1&input2)|(input1&~input2); if(aluRes==0) ZF=1;
    else ZF=0;
end 
4'b0101: begin// 或非nor 
    aluRes = ~(input1 | input2); if(aluRes==0) ZF=1;
    else ZF=0;
end
4'b0110: begin// 减sub 
    {CF,aluRes} = input1 - input2; if(aluRes == 0)
    ZF = 1; else ZF = 0;
    OF = input1[31]^input2[31]^aluRes[31]^CF;//溢出标志公式
end


4'b0111: begin// 小于设置slt slti
    if(input1<input2) aluRes = 1;
    else aluRes=0; if(aluRes==0) ZF=1; else ZF=0;
end

4'b1011:begin // sra
    aluRes=input2>>shamt;
    if(aluRes == 0) ZF=1; else ZF = 0;
end

5'b11011:begin // srav
    aluRes=input2>>input1;
    if(aluRes == 0) ZF=1; else ZF = 0;
end

//4'b1100:begin // sla slav
//    if(variable == 1)
//    aluRes=input2<<<input1;
//    else
//    aluRes=input2<<<shamt;
//    if(aluRes == 0) ZF=1; else ZF = 0;
//end

  4'b1000: begin// sll 
    if(variable == 0) // sll
    aluRes=input2<<shamt; 
    if(aluRes==0) ZF=1; else ZF=0;
    
end 
  4'b1111: begin// sllv 
  aluRes=input2<<input1;
  if(aluRes==0) ZF=1; else ZF=0;
  
end 
4'b1001: begin// srl 
    aluRes=input2>>shamt; 
    if(aluRes==0) ZF=1; else ZF=0;
end
5'b11001: begin// srlv 
    aluRes=input2>>input1;
    if(aluRes==0) ZF=1; else ZF=0;
end


4'b1010: begin//slti
    if(input1 < input2) aluRes = 1;
    else aluRes = 0;
    if(aluRes==0) ZF=1; else ZF=0;
end 
//4'b0010: begin//ori 
//    aluRes=input1|input2; if(aluRes==0) ZF=1; else ZF=0;
//end 
4'b1101: begin//lui 
    aluRes={input2[15:0],16'b0000_0000_0000_0000};
end 
default: 
begin
aluRes = -1; ZF=0;OF=0;
 end 
endcase
 end
endmodule

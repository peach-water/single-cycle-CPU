`timescale 1ns / 1ps

module topmy(
input clkin, reset,sm_clk,

output [31:0]PC,
output [31:0] aluRes,
output [31:0] instruction,

output wire [6:0] sm_duan,
output wire [3:0] sm_wei,
input [2:0] SW

);

//wire [31:0] instruction;
//wire [31:0] aluRes;
//wire [31:0] PC;
wire clk;
wire jal,jmp,bne,beq,jr;
wire [31:0] input2;
//�������ź���
//wire[31:0] expand2, mux4, mux5, address, jmpaddr;
//���ݴ洢��
wire[31:0] memreaddata;
// CPU �����ź���
wire reg_dst,variable , memread, memwrite, memtoreg,alu_src,ExtOp; 
wire[3:0] aluop;
wire regwrite;
// ALU �����ź���
wire ZF,OF,CF; //alu����Ϊ���־ 
// ALU�����ź���
wire[4:0] aluCtr;//����aluop��ָ���6λ ѡ��alu��������

wire [15:0]data;
// �Ĵ����ź���
wire[31:0] RsData, RtData;

wire[31:0] expand; wire[4:0] shamt;
wire [4:0]regWriteAddr;
wire[31:0]regWriteData;

assign shamt = instruction[10:6];
assign regWriteAddr = reg_dst ? instruction[15:11] : instruction[20:16];//д�Ĵ�����Ŀ��Ĵ�������rt��rd
assign data = aluRes[15:0];
assign regWriteData = memtoreg ? memreaddata : aluRes; //д��Ĵ�������������ALU�����ݼĴ��� 
assign input2 = alu_src ? expand : RtData; //ALU�ĵڶ������������ԼĴ����������ָ���16λ�ķ�����չ

//wire [31:0]PC;


// ����ָ��洢��
//IM_unit IM ( .clk(clkin), .Addr(PC), .instruction(instruction) );

//reg [7 : 0] addr;//ROM��ַ

fangdou fd(
    .clkin(clkin),
    .sm_clk(sm_clk),
    .clk(clk));

IM_unit romm(
    .clk(sm_clk), ///back
    .Addr(PC),
    .instruction(instruction));

PCctr point(.clkin(clkin),
    .reset(reset),
    .next_pc(PC),
    //.aluRes(aluRes),
    .jmp(jmp),
    .zero(ZF),
    .jal(jal),
    .jr(jr),
    .bne(bne),
    .beq(beq),
//    .branch_Addr(branch_Addr),
    .instruction(instruction[25:0])
 );

// ʵ����������ģ��
ctr mainctr(
.opCode(instruction[31:26]),
.func(instruction[5:0]),
.regDst(reg_dst),
.aluSrc(alu_src),
.memToReg(memtoreg),
.regWrite(regwrite),
.memRead(memread),
.memWrite(memwrite),
.branch(variable), // ���shift right �Ƿ���variable
.ExtOp(ExtOp),
.aluop(aluop),
.jmp(jmp),
.jr(jr),
.jal(jal),
.bne(bne),
.beq(beq));
//  ʵ���� ALU ����ģ��
aluctr aluctr1(
.ALUOp(aluop),
.funct(instruction[5:0]),
.ALUCtr(aluCtr),
.instruction(instruction)
);
// ��������������������������������������������������ʵ�����Ĵ���ģ��
RegFile regfile(
.R_Addr_A(instruction[25:21]),
.R_Addr_B(instruction[20:16]),
.Clk(!clkin),
.Clr(reset),
.W_Addr(regWriteAddr),
.W_Data(regWriteData),
.Write_Reg(regwrite),
.R_Data_A(RsData),
.R_Data_B(RtData)
);

// ��������������������������������������������ʵ����ALUģ��
alu alu(
.shamt(shamt),
.clkin(clkin),
.input1(RsData), //д��alu�ĵ�һ������������Rs
.input2(input2),
.Opcode(instruction[31:26]),
.func(instruction[5:0]),
.aluCtr(aluCtr),
.sm_clk(sm_clk),
.ZF(ZF),
.OF(OF),
.CF(CF),
.variable(variable),
.aluRes(aluRes));
//ʵ����������չģ��
signext signext(.inst(instruction[15:0]),.ExtOp(ExtOp), .data(expand)); //Exp = 1���1���������0
//ʵ�������ݴ洢��
 DM_unit dm(.clk(clkin), .Wr(memwrite),
            .reset(reset),           
             .DMAdr(RtData), 
             .wd(aluRes));//................ʵ�����������ʾģ��

    wire [31:0] display_content;
	wire [15:0] disp_num;
   //��ʾ����ѡ��	
   
	assign display_content = (SW[1:0] == 2'b00)? instruction:
	                    (SW[1:0] == 2'b01)? PC*4:
	                    (SW[1:0] == 2'b10)? aluRes:  memreaddata;
	//�ߵ�16λѡ��					 
	assign disp_num = (SW[2] == 1)? display_content[31:16]:display_content[15:0]; 
	//����������ʾ

//display Smg(.clk(sm_clk),.sm_wei(sm_wei),.data(disp_num),.sm_duan(sm_duan)); 
display_0 Smg(.clk(sm_clk),.sm_wei(sm_wei),.data(disp_num),.sm_duan(sm_duan)); 

endmodule

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
//复用器信号线
//wire[31:0] expand2, mux4, mux5, address, jmpaddr;
//数据存储器
wire[31:0] memreaddata;
// CPU 控制信号线
wire reg_dst,variable , memread, memwrite, memtoreg,alu_src,ExtOp; 
wire[3:0] aluop;
wire regwrite;
// ALU 控制信号线
wire ZF,OF,CF; //alu运算为零标志 
// ALU控制信号线
wire[4:0] aluCtr;//根据aluop和指令后6位 选择alu运算类型

wire [15:0]data;
// 寄存器信号线
wire[31:0] RsData, RtData;

wire[31:0] expand; wire[4:0] shamt;
wire [4:0]regWriteAddr;
wire[31:0]regWriteData;

assign shamt = instruction[10:6];
assign regWriteAddr = reg_dst ? instruction[15:11] : instruction[20:16];//写寄存器的目标寄存器来自rt或rd
assign data = aluRes[15:0];
assign regWriteData = memtoreg ? memreaddata : aluRes; //写入寄存器的数据来自ALU或数据寄存器 
assign input2 = alu_src ? expand : RtData; //ALU的第二个操作数来自寄存器堆输出或指令低16位的符号扩展

//wire [31:0]PC;


// 例化指令存储器
//IM_unit IM ( .clk(clkin), .Addr(PC), .instruction(instruction) );

//reg [7 : 0] addr;//ROM地址

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

// 实例化控制器模块
ctr mainctr(
.opCode(instruction[31:26]),
.func(instruction[5:0]),
.regDst(reg_dst),
.aluSrc(alu_src),
.memToReg(memtoreg),
.regWrite(regwrite),
.memRead(memread),
.memWrite(memwrite),
.branch(variable), // 输出shift right 是否是variable
.ExtOp(ExtOp),
.aluop(aluop),
.jmp(jmp),
.jr(jr),
.jal(jal),
.bne(bne),
.beq(beq));
//  实例化 ALU 控制模块
aluctr aluctr1(
.ALUOp(aluop),
.funct(instruction[5:0]),
.ALUCtr(aluCtr),
.instruction(instruction)
);
// 。。。。。。。。。。。。。。。。。。。。。。。。。实例化寄存器模块
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

// 。。。。。。。。。。。。。。。。。。。。。。实例化ALU模块
alu alu(
.shamt(shamt),
.clkin(clkin),
.input1(RsData), //写入alu的第一个操作数必是Rs
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
//实例化符号扩展模块
signext signext(.inst(instruction[15:0]),.ExtOp(ExtOp), .data(expand)); //Exp = 1填充1，否则填充0
//实例化数据存储器
 DM_unit dm(.clk(clkin), .Wr(memwrite),
            .reset(reset),           
             .DMAdr(RtData), 
             .wd(aluRes));//................实例化数码管显示模块

    wire [31:0] display_content;
	wire [15:0] disp_num;
   //显示内容选择	
   
	assign display_content = (SW[1:0] == 2'b00)? instruction:
	                    (SW[1:0] == 2'b01)? PC*4:
	                    (SW[1:0] == 2'b10)? aluRes:  memreaddata;
	//高低16位选择					 
	assign disp_num = (SW[2] == 1)? display_content[31:16]:display_content[15:0]; 
	//数码管输出显示

//display Smg(.clk(sm_clk),.sm_wei(sm_wei),.data(disp_num),.sm_duan(sm_duan)); 
display_0 Smg(.clk(sm_clk),.sm_wei(sm_wei),.data(disp_num),.sm_duan(sm_duan)); 

endmodule

`timescale 1ns / 1ps
module IM_unit(
    input clk,
    input [31:0] Addr,		//指令存储器地址编码 
    output [31:0]  instruction// 寄存器的值
);
//integer cnt = 3'd0;
//reg clk;
//reg clk_4hz;
//always @(Addr) begin
//    clk = 0;
//    #0.1 clk = 1;
//    #0.1 clk = 0;
//    #0.1 clk = 1;
//    #0.1 ;
//end

//降低时钟频率便于观察
reg clkin=0;
reg [31:0] cnt=1;
 //降低至 1s 一周期
always @(posedge clk)
begin
cnt=cnt+1;
 if (cnt == 32'd50000000) 
begin
 clkin = ~clkin;
 cnt = 0;
 end
clkin = ~clkin;// 仿真和板上实现的时候切换时钟
end


ins_mem rom(.clka(clkin),
    .addra(Addr[15:0]),
    .douta(instruction)
    );
endmodule 

//`timescale 1ns / 1ps
//module IM_unit( 
//input clk,
//input [31:0] Addr,		//指令存储器地址编码 
//output reg [31:0]  instruction// 寄存器的值
//);
////寄存器地址都是 4 位二进制数，因为寄存器只有 16 个，4 位就能表示所有寄存器
//reg [31:0] regs [0:31]; // 寄存器组

//initial 
//		begin
		
//		                   regs[0]  = 32'h24010008;
//                           regs[1]  = 32'h34020002;
//                           regs[2]  = 32'h00411820;
//                           regs[3]  = 32'h00621822;
//                           regs[4]  = 32'h00621824;
//                           regs[5]  = 32'h00621825;
//                           regs[6]  = 32'h00031840;
//                           regs[7]  = 32'h28430004;
//                           regs[8]  = 32'h30410002;
//                           regs[9]  = 32'h00221823;
//                           regs[10] = 32'h20630008;
//                           regs[11] = 32'h00221826;
//                           regs[12] = 32'h20420005;
//                           regs[13] = 32'h0022182a;
//                           regs[14] = 32'h0041182b;
//                           regs[15] = 32'h00221827;
//                           regs[16] = 32'h3c03000a;
//                           regs[17] = 32'h00031842;
//                           regs[18] = 32'h3863000a;
//                           regs[19] = 32'h00031842;
//                           regs[20] = 32'h2c23000b;
//                           regs[21] = 32'h08000016;
//                           regs[22] = 32'h00221825;
//                           regs[23] = 32'h00431806;
//                           regs[24] = 32'h20630001;

			
////			        regs[0]  = 32'h24010008;
////                    regs[1]  = 32'h34020002;
////                    regs[2]  = 32'h00411820;
////                    regs[3]  = 32'h00622822;
////                    regs[4]  = 32'h00a22024;
////                    regs[5]  = 32'h00824025;
////                    regs[6]  = 32'h00084040;
////                    regs[7]  = 32'h1501ffff;
////                    regs[8]  = 32'h28460004;
////                    regs[9]  = 32'h28c70000;
////                    regs[10] = 32'h24e70008;
////                    regs[11] = 32'h10e1ffff;
////                    regs[12] = 32'h240afffe;
////                    regs[13] = 32'h254a0001;
////                    regs[14] = 32'h0540fffe;
////                    regs[15] = 32'h304b0002;
////                    regs[16] = 32'h08000012;
////                    regs[17] = 32'h00824025;
////                    regs[18] = 32'h20630001;
////                    regs[19] = 32'h00221823;
////                    regs[20] = 32'h00221826;
////                    regs[21] = 32'h0022182a;
////                    regs[22] = 32'h0041182b;
////                    regs[23] = 32'h00221827;
////                    regs[24] = 32'h3c03000a;
////                    regs[25] = 32'h00031883;
////                    regs[26] = 32'h00031842;
////                    regs[27] = 32'h3863000a;
////                    regs[28] = 32'h2c23000b;
////                    regs[29] = 32'h00431804;
////                    regs[30] = 32'h00431806;
////                    regs[31] = 32'h00431807;

                    

//end
//always @( Addr ) // 时钟上升沿操作

//instruction=regs[Addr] ; //  取指令
//endmodule 


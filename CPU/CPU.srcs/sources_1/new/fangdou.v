`timescale 1ns / 1ps


module fangdou(
    input sm_clk,
    output clkin,
    input clk
    );
parameter size = 1000000;
reg [21:0] count_low = 21'd0;
reg [21:0] count_high = 21'd0;
reg out = 1'b0;
always@(posedge sm_clk)begin
    if(clk == 1'b1)begin
        count_high = count_high + 1;
        count_low <= 0;
        end
    else begin
        count_high = 0;
        count_low <= count_low + 1;
    end
end

always@(posedge sm_clk)begin
    if(count_low == size)
        out = 0;
    if(count_high == size)
        out = 1;
end
assign clkin = out;
endmodule

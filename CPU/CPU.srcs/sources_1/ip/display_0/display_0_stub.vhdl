-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Wed Nov 25 09:14:25 2020
-- Host        : DESKTOP-AM4RCB5 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/Vivado_project/CPU/CPU.srcs/sources_1/ip/display_0/display_0_stub.vhdl
-- Design      : display_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_0 is
  Port ( 
    clk : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sm_wei : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sm_duan : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );

end display_0;

architecture stub of display_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,data[15:0],sm_wei[3:0],sm_duan[6:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "display,Vivado 2017.4";
begin
end;

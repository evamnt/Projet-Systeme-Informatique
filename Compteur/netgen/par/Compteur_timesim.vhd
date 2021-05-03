--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: O.87xd
--  \   \         Application: netgen
--  /   /         Filename: Compteur_timesim.vhd
-- /___/   /\     Timestamp: Wed Apr 14 08:07:10 2021
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 3 -pcf Compteur.pcf -rpw 100 -tpw 0 -ar Structure -tm Compteur -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim Compteur.ncd Compteur_timesim.vhd 
-- Device	: 6slx16csg324-3 (PRODUCTION 1.21 2012-01-07)
-- Input file	: Compteur.ncd
-- Output file	: /home/moenne-l/4IR/TD_ArchiMat/Compteur/netgen/par/Compteur_timesim.vhd
-- # of Entities	: 1
-- Design Name	: Compteur
-- Xilinx	: /usr/local/insa/Xilinx.ISE/13.4/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity Compteur is
  port (
    CK : in STD_LOGIC := 'X'; 
    RST : in STD_LOGIC := 'X'; 
    SENS : in STD_LOGIC := 'X'; 
    LOAD : in STD_LOGIC := 'X'; 
    EN : in STD_LOGIC := 'X'; 
    Din : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    Dout : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end Compteur;

architecture Structure of Compteur is
  signal CK_BUFGP_IBUFG_0 : STD_LOGIC; 
  signal CK_BUFGP : STD_LOGIC; 
  signal Mcount_count : STD_LOGIC; 
  signal LOAD_IBUF_0 : STD_LOGIC; 
  signal SENS_IBUF_0 : STD_LOGIC; 
  signal Q_n0025_inv : STD_LOGIC; 
  signal EN_IBUF_0 : STD_LOGIC; 
  signal Din_0_IBUF_0 : STD_LOGIC; 
  signal Din_1_IBUF_0 : STD_LOGIC; 
  signal Din_2_IBUF_0 : STD_LOGIC; 
  signal Din_3_IBUF_0 : STD_LOGIC; 
  signal RST_inv : STD_LOGIC; 
  signal Din_4_IBUF_0 : STD_LOGIC; 
  signal Din_5_IBUF_0 : STD_LOGIC; 
  signal Din_6_IBUF_0 : STD_LOGIC; 
  signal Din_7_IBUF_0 : STD_LOGIC; 
  signal Mcount_count_mand1 : STD_LOGIC; 
  signal Mcount_count_mand2 : STD_LOGIC; 
  signal Mcount_count1_27 : STD_LOGIC; 
  signal Mcount_count2 : STD_LOGIC; 
  signal Mcount_count3 : STD_LOGIC; 
  signal Mcount_count4 : STD_LOGIC; 
  signal Mcount_count_mand_15 : STD_LOGIC; 
  signal Mcount_count_mand3 : STD_LOGIC; 
  signal Mcount_count_mand4 : STD_LOGIC; 
  signal Mcount_count_mand5 : STD_LOGIC; 
  signal Mcount_count_mand6 : STD_LOGIC; 
  signal Mcount_count5 : STD_LOGIC; 
  signal Mcount_count6 : STD_LOGIC; 
  signal Mcount_count7 : STD_LOGIC; 
  signal Mcount_count8 : STD_LOGIC; 
  signal CK_BUFGP_IBUFG_90 : STD_LOGIC; 
  signal LOAD_IBUF_93 : STD_LOGIC; 
  signal EN_IBUF_96 : STD_LOGIC; 
  signal SENS_IBUF_99 : STD_LOGIC; 
  signal ProtoComp7_IINV_OUT : STD_LOGIC; 
  signal RST_inv_non_inverted : STD_LOGIC; 
  signal Din_0_IBUF_106 : STD_LOGIC; 
  signal Din_1_IBUF_109 : STD_LOGIC; 
  signal Din_2_IBUF_112 : STD_LOGIC; 
  signal Din_3_IBUF_115 : STD_LOGIC; 
  signal Din_4_IBUF_118 : STD_LOGIC; 
  signal Din_5_IBUF_123 : STD_LOGIC; 
  signal Din_6_IBUF_128 : STD_LOGIC; 
  signal Din_7_IBUF_133 : STD_LOGIC; 
  signal NlwBufferSignal_CK_BUFGP_BUFG_IN : STD_LOGIC; 
  signal NlwBufferSignal_count_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_count_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_count_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_count_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_count_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_count_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_count_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_count_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_Dout_4_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout_5_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout_6_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout_7_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_Dout_3_OBUF_I : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal NLW_Mcount_count_cy_3_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcount_count_cy_3_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcount_count_cy_3_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcount_count_xor_7_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcount_count_xor_7_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcount_count_xor_7_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcount_count_xor_7_CO_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mcount_count_xor_7_DI_3_UNCONNECTED : STD_LOGIC; 
  signal count : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal Mcount_count_cy : STD_LOGIC_VECTOR ( 3 downto 3 ); 
  signal Mcount_count_lut : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  CK_BUFGP_BUFG : X_CKBUF
    generic map(
      LOC => "BUFGMUX_X3Y13",
      PATHPULSE => 202 ps
    )
    port map (
      I => NlwBufferSignal_CK_BUFGP_BUFG_IN,
      O => CK_BUFGP
    );
  count_3 : X_SFF
    generic map(
      LOC => "SLICE_X10Y2",
      INIT => '0'
    )
    port map (
      CE => Q_n0025_inv,
      CLK => NlwBufferSignal_count_3_CLK,
      I => Mcount_count4,
      O => count(3),
      SRST => RST_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  Mcount_count_lut_3_Q : X_LUT6
    generic map(
      LOC => "SLICE_X10Y2",
      INIT => X"EE22DD11EE22DD11"
    )
    port map (
      ADR2 => '1',
      ADR3 => Din_3_IBUF_0,
      ADR0 => SENS_IBUF_0,
      ADR4 => count(3),
      ADR1 => LOAD_IBUF_0,
      ADR5 => '1',
      O => Mcount_count_lut(3)
    );
  Mcount_count_mand_2 : X_LUT5
    generic map(
      LOC => "SLICE_X10Y2",
      INIT => X"33330000"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR2 => '1',
      ADR4 => count(3),
      ADR1 => LOAD_IBUF_0,
      O => Mcount_count_mand3
    );
  count_2 : X_SFF
    generic map(
      LOC => "SLICE_X10Y2",
      INIT => '0'
    )
    port map (
      CE => Q_n0025_inv,
      CLK => NlwBufferSignal_count_2_CLK,
      I => Mcount_count3,
      O => count(2),
      SRST => RST_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  Mcount_count_cy_3_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X10Y2"
    )
    port map (
      CI => '0',
      CYINIT => Mcount_count,
      CO(3) => Mcount_count_cy(3),
      CO(2) => NLW_Mcount_count_cy_3_CO_2_UNCONNECTED,
      CO(1) => NLW_Mcount_count_cy_3_CO_1_UNCONNECTED,
      CO(0) => NLW_Mcount_count_cy_3_CO_0_UNCONNECTED,
      DI(3) => Mcount_count_mand3,
      DI(2) => Mcount_count_mand2,
      DI(1) => Mcount_count_mand1,
      DI(0) => Mcount_count_mand_15,
      O(3) => Mcount_count4,
      O(2) => Mcount_count3,
      O(1) => Mcount_count2,
      O(0) => Mcount_count1_27,
      S(3) => Mcount_count_lut(3),
      S(2) => Mcount_count_lut(2),
      S(1) => Mcount_count_lut(1),
      S(0) => Mcount_count_lut(0)
    );
  Mcount_count_lut_2_Q : X_LUT6
    generic map(
      LOC => "SLICE_X10Y2",
      INIT => X"BB8888BBBB8888BB"
    )
    port map (
      ADR2 => '1',
      ADR0 => Din_2_IBUF_0,
      ADR3 => SENS_IBUF_0,
      ADR4 => count(2),
      ADR1 => LOAD_IBUF_0,
      ADR5 => '1',
      O => Mcount_count_lut(2)
    );
  Mcount_count_mand_1 : X_LUT5
    generic map(
      LOC => "SLICE_X10Y2",
      INIT => X"33330000"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR2 => '1',
      ADR4 => count(2),
      ADR1 => LOAD_IBUF_0,
      O => Mcount_count_mand2
    );
  count_1 : X_SFF
    generic map(
      LOC => "SLICE_X10Y2",
      INIT => '0'
    )
    port map (
      CE => Q_n0025_inv,
      CLK => NlwBufferSignal_count_1_CLK,
      I => Mcount_count2,
      O => count(1),
      SRST => RST_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  Mcount_count_lut_1_Q : X_LUT6
    generic map(
      LOC => "SLICE_X10Y2",
      INIT => X"FA0AF505FA0AF505"
    )
    port map (
      ADR1 => '1',
      ADR3 => Din_1_IBUF_0,
      ADR0 => SENS_IBUF_0,
      ADR4 => count(1),
      ADR2 => LOAD_IBUF_0,
      ADR5 => '1',
      O => Mcount_count_lut(1)
    );
  Mcount_count_mand_0 : X_LUT5
    generic map(
      LOC => "SLICE_X10Y2",
      INIT => X"0F0F0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR4 => count(1),
      ADR2 => LOAD_IBUF_0,
      O => Mcount_count_mand1
    );
  count_0 : X_SFF
    generic map(
      LOC => "SLICE_X10Y2",
      INIT => '0'
    )
    port map (
      CE => Q_n0025_inv,
      CLK => NlwBufferSignal_count_0_CLK,
      I => Mcount_count1_27,
      O => count(0),
      SRST => RST_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  Mcount_count_lut_0_Q : X_LUT6
    generic map(
      LOC => "SLICE_X10Y2",
      INIT => X"CC0FCCF0CC0FCCF0"
    )
    port map (
      ADR0 => '1',
      ADR1 => Din_0_IBUF_0,
      ADR2 => SENS_IBUF_0,
      ADR4 => count(0),
      ADR3 => LOAD_IBUF_0,
      ADR5 => '1',
      O => Mcount_count_lut(0)
    );
  Mcount_count_mand : X_LUT5
    generic map(
      LOC => "SLICE_X10Y2",
      INIT => X"00FF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => count(0),
      ADR3 => LOAD_IBUF_0,
      O => Mcount_count_mand_15
    );
  count_7 : X_SFF
    generic map(
      LOC => "SLICE_X10Y3",
      INIT => '0'
    )
    port map (
      CE => Q_n0025_inv,
      CLK => NlwBufferSignal_count_7_CLK,
      I => Mcount_count8,
      O => count(7),
      SRST => RST_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  Mcount_count_lut_7_Q : X_LUT6
    generic map(
      LOC => "SLICE_X10Y3",
      INIT => X"F0F0FF00F0F000FF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => Din_7_IBUF_0,
      ADR5 => count(7),
      ADR3 => SENS_IBUF_0,
      ADR4 => LOAD_IBUF_0,
      O => Mcount_count_lut(7)
    );
  count_6 : X_SFF
    generic map(
      LOC => "SLICE_X10Y3",
      INIT => '0'
    )
    port map (
      CE => Q_n0025_inv,
      CLK => NlwBufferSignal_count_6_CLK,
      I => Mcount_count7,
      O => count(6),
      SRST => RST_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  Mcount_count_xor_7_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X10Y3"
    )
    port map (
      CI => Mcount_count_cy(3),
      CYINIT => '0',
      CO(3) => NLW_Mcount_count_xor_7_CO_3_UNCONNECTED,
      CO(2) => NLW_Mcount_count_xor_7_CO_2_UNCONNECTED,
      CO(1) => NLW_Mcount_count_xor_7_CO_1_UNCONNECTED,
      CO(0) => NLW_Mcount_count_xor_7_CO_0_UNCONNECTED,
      DI(3) => NLW_Mcount_count_xor_7_DI_3_UNCONNECTED,
      DI(2) => Mcount_count_mand6,
      DI(1) => Mcount_count_mand5,
      DI(0) => Mcount_count_mand4,
      O(3) => Mcount_count8,
      O(2) => Mcount_count7,
      O(1) => Mcount_count6,
      O(0) => Mcount_count5,
      S(3) => Mcount_count_lut(7),
      S(2) => Mcount_count_lut(6),
      S(1) => Mcount_count_lut(5),
      S(0) => Mcount_count_lut(4)
    );
  Mcount_count_lut_6_Q : X_LUT6
    generic map(
      LOC => "SLICE_X10Y3",
      INIT => X"E2E2D1D1E2E2D1D1"
    )
    port map (
      ADR3 => '1',
      ADR2 => Din_6_IBUF_0,
      ADR0 => SENS_IBUF_0,
      ADR4 => count(6),
      ADR1 => LOAD_IBUF_0,
      ADR5 => '1',
      O => Mcount_count_lut(6)
    );
  Mcount_count_mand_5 : X_LUT5
    generic map(
      LOC => "SLICE_X10Y3",
      INIT => X"33330000"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR2 => '1',
      ADR4 => count(6),
      ADR1 => LOAD_IBUF_0,
      O => Mcount_count_mand6
    );
  count_5 : X_SFF
    generic map(
      LOC => "SLICE_X10Y3",
      INIT => '0'
    )
    port map (
      CE => Q_n0025_inv,
      CLK => NlwBufferSignal_count_5_CLK,
      I => Mcount_count6,
      O => count(5),
      SRST => RST_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  Mcount_count_lut_5_Q : X_LUT6
    generic map(
      LOC => "SLICE_X10Y3",
      INIT => X"CFC0C0CFCFC0C0CF"
    )
    port map (
      ADR0 => '1',
      ADR1 => Din_5_IBUF_0,
      ADR3 => SENS_IBUF_0,
      ADR4 => count(5),
      ADR2 => LOAD_IBUF_0,
      ADR5 => '1',
      O => Mcount_count_lut(5)
    );
  Mcount_count_mand_4 : X_LUT5
    generic map(
      LOC => "SLICE_X10Y3",
      INIT => X"0F0F0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR4 => count(5),
      ADR2 => LOAD_IBUF_0,
      O => Mcount_count_mand5
    );
  count_4 : X_SFF
    generic map(
      LOC => "SLICE_X10Y3",
      INIT => '0'
    )
    port map (
      CE => Q_n0025_inv,
      CLK => NlwBufferSignal_count_4_CLK,
      I => Mcount_count5,
      O => count(4),
      SRST => RST_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  Mcount_count_lut_4_Q : X_LUT6
    generic map(
      LOC => "SLICE_X10Y3",
      INIT => X"CACAC5C5CACAC5C5"
    )
    port map (
      ADR3 => '1',
      ADR1 => Din_4_IBUF_0,
      ADR0 => SENS_IBUF_0,
      ADR4 => count(4),
      ADR2 => LOAD_IBUF_0,
      ADR5 => '1',
      O => Mcount_count_lut(4)
    );
  Mcount_count_mand_3 : X_LUT5
    generic map(
      LOC => "SLICE_X10Y3",
      INIT => X"0F0F0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR4 => count(4),
      ADR2 => LOAD_IBUF_0,
      O => Mcount_count_mand4
    );
  Dout_4_OBUF : X_OBUF
    generic map(
      LOC => "PAD175"
    )
    port map (
      I => NlwBufferSignal_Dout_4_OBUF_I,
      O => Dout(4)
    );
  Dout_5_OBUF : X_OBUF
    generic map(
      LOC => "PAD176"
    )
    port map (
      I => NlwBufferSignal_Dout_5_OBUF_I,
      O => Dout(5)
    );
  Dout_6_OBUF : X_OBUF
    generic map(
      LOC => "PAD179"
    )
    port map (
      I => NlwBufferSignal_Dout_6_OBUF_I,
      O => Dout(6)
    );
  Dout_7_OBUF : X_OBUF
    generic map(
      LOC => "PAD180"
    )
    port map (
      I => NlwBufferSignal_Dout_7_OBUF_I,
      O => Dout(7)
    );
  CK_BUFGP_IBUFG : X_BUF
    generic map(
      LOC => "PAD216",
      PATHPULSE => 202 ps
    )
    port map (
      O => CK_BUFGP_IBUFG_90,
      I => CK
    );
  ProtoComp6_IMUX : X_BUF
    generic map(
      LOC => "PAD216",
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP_IBUFG_90,
      O => CK_BUFGP_IBUFG_0
    );
  LOAD_IBUF : X_BUF
    generic map(
      LOC => "PAD173",
      PATHPULSE => 202 ps
    )
    port map (
      O => LOAD_IBUF_93,
      I => LOAD
    );
  ProtoComp6_IMUX_1 : X_BUF
    generic map(
      LOC => "PAD173",
      PATHPULSE => 202 ps
    )
    port map (
      I => LOAD_IBUF_93,
      O => LOAD_IBUF_0
    );
  EN_IBUF : X_BUF
    generic map(
      LOC => "PAD157",
      PATHPULSE => 202 ps
    )
    port map (
      O => EN_IBUF_96,
      I => EN
    );
  ProtoComp6_IMUX_2 : X_BUF
    generic map(
      LOC => "PAD157",
      PATHPULSE => 202 ps
    )
    port map (
      I => EN_IBUF_96,
      O => EN_IBUF_0
    );
  SENS_IBUF : X_BUF
    generic map(
      LOC => "PAD158",
      PATHPULSE => 202 ps
    )
    port map (
      O => SENS_IBUF_99,
      I => SENS
    );
  ProtoComp6_IMUX_3 : X_BUF
    generic map(
      LOC => "PAD158",
      PATHPULSE => 202 ps
    )
    port map (
      I => SENS_IBUF_99,
      O => SENS_IBUF_0
    );
  RST_IBUF : X_BUF
    generic map(
      LOC => "PAD170",
      PATHPULSE => 202 ps
    )
    port map (
      O => RST_inv_non_inverted,
      I => RST
    );
  ProtoComp7_IMUX : X_BUF
    generic map(
      LOC => "PAD170",
      PATHPULSE => 202 ps
    )
    port map (
      I => ProtoComp7_IINV_OUT,
      O => RST_inv
    );
  ProtoComp7_IINV : X_INV
    generic map(
      LOC => "PAD170",
      PATHPULSE => 202 ps
    )
    port map (
      I => RST_inv_non_inverted,
      O => ProtoComp7_IINV_OUT
    );
  Din_0_IBUF : X_BUF
    generic map(
      LOC => "PAD159",
      PATHPULSE => 202 ps
    )
    port map (
      O => Din_0_IBUF_106,
      I => Din(0)
    );
  ProtoComp6_IMUX_4 : X_BUF
    generic map(
      LOC => "PAD159",
      PATHPULSE => 202 ps
    )
    port map (
      I => Din_0_IBUF_106,
      O => Din_0_IBUF_0
    );
  Din_1_IBUF : X_BUF
    generic map(
      LOC => "PAD160",
      PATHPULSE => 202 ps
    )
    port map (
      O => Din_1_IBUF_109,
      I => Din(1)
    );
  ProtoComp6_IMUX_5 : X_BUF
    generic map(
      LOC => "PAD160",
      PATHPULSE => 202 ps
    )
    port map (
      I => Din_1_IBUF_109,
      O => Din_1_IBUF_0
    );
  Din_2_IBUF : X_BUF
    generic map(
      LOC => "PAD161",
      PATHPULSE => 202 ps
    )
    port map (
      O => Din_2_IBUF_112,
      I => Din(2)
    );
  ProtoComp6_IMUX_6 : X_BUF
    generic map(
      LOC => "PAD161",
      PATHPULSE => 202 ps
    )
    port map (
      I => Din_2_IBUF_112,
      O => Din_2_IBUF_0
    );
  Din_3_IBUF : X_BUF
    generic map(
      LOC => "PAD162",
      PATHPULSE => 202 ps
    )
    port map (
      O => Din_3_IBUF_115,
      I => Din(3)
    );
  ProtoComp6_IMUX_7 : X_BUF
    generic map(
      LOC => "PAD162",
      PATHPULSE => 202 ps
    )
    port map (
      I => Din_3_IBUF_115,
      O => Din_3_IBUF_0
    );
  Din_4_IBUF : X_BUF
    generic map(
      LOC => "PAD163",
      PATHPULSE => 202 ps
    )
    port map (
      O => Din_4_IBUF_118,
      I => Din(4)
    );
  ProtoComp6_IMUX_8 : X_BUF
    generic map(
      LOC => "PAD163",
      PATHPULSE => 202 ps
    )
    port map (
      I => Din_4_IBUF_118,
      O => Din_4_IBUF_0
    );
  Dout_0_OBUF : X_OBUF
    generic map(
      LOC => "PAD171"
    )
    port map (
      I => NlwBufferSignal_Dout_0_OBUF_I,
      O => Dout(0)
    );
  Din_5_IBUF : X_BUF
    generic map(
      LOC => "PAD164",
      PATHPULSE => 202 ps
    )
    port map (
      O => Din_5_IBUF_123,
      I => Din(5)
    );
  ProtoComp6_IMUX_9 : X_BUF
    generic map(
      LOC => "PAD164",
      PATHPULSE => 202 ps
    )
    port map (
      I => Din_5_IBUF_123,
      O => Din_5_IBUF_0
    );
  Dout_1_OBUF : X_OBUF
    generic map(
      LOC => "PAD172"
    )
    port map (
      I => NlwBufferSignal_Dout_1_OBUF_I,
      O => Dout(1)
    );
  Din_6_IBUF : X_BUF
    generic map(
      LOC => "PAD167",
      PATHPULSE => 202 ps
    )
    port map (
      O => Din_6_IBUF_128,
      I => Din(6)
    );
  ProtoComp6_IMUX_10 : X_BUF
    generic map(
      LOC => "PAD167",
      PATHPULSE => 202 ps
    )
    port map (
      I => Din_6_IBUF_128,
      O => Din_6_IBUF_0
    );
  Dout_2_OBUF : X_OBUF
    generic map(
      LOC => "PAD169"
    )
    port map (
      I => NlwBufferSignal_Dout_2_OBUF_I,
      O => Dout(2)
    );
  Din_7_IBUF : X_BUF
    generic map(
      LOC => "PAD168",
      PATHPULSE => 202 ps
    )
    port map (
      O => Din_7_IBUF_133,
      I => Din(7)
    );
  ProtoComp6_IMUX_11 : X_BUF
    generic map(
      LOC => "PAD168",
      PATHPULSE => 202 ps
    )
    port map (
      I => Din_7_IBUF_133,
      O => Din_7_IBUF_0
    );
  Dout_3_OBUF : X_OBUF
    generic map(
      LOC => "PAD174"
    )
    port map (
      I => NlwBufferSignal_Dout_3_OBUF_I,
      O => Dout(3)
    );
  Mcount_count1 : X_LUT6
    generic map(
      LOC => "SLICE_X11Y2",
      INIT => X"00000F0F00000F0F"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR5 => '1',
      ADR3 => '1',
      ADR2 => LOAD_IBUF_0,
      ADR4 => SENS_IBUF_0,
      O => Mcount_count
    );
  Q_n0025_inv1 : X_LUT6
    generic map(
      LOC => "SLICE_X12Y2",
      INIT => X"FFFFFFFF33333333"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR1 => EN_IBUF_0,
      ADR5 => LOAD_IBUF_0,
      O => Q_n0025_inv
    );
  NlwBufferBlock_CK_BUFGP_BUFG_IN : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP_IBUFG_0,
      O => NlwBufferSignal_CK_BUFGP_BUFG_IN
    );
  NlwBufferBlock_count_3_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_count_3_CLK
    );
  NlwBufferBlock_count_2_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_count_2_CLK
    );
  NlwBufferBlock_count_1_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_count_1_CLK
    );
  NlwBufferBlock_count_0_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_count_0_CLK
    );
  NlwBufferBlock_count_7_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_count_7_CLK
    );
  NlwBufferBlock_count_6_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_count_6_CLK
    );
  NlwBufferBlock_count_5_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_count_5_CLK
    );
  NlwBufferBlock_count_4_CLK : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => CK_BUFGP,
      O => NlwBufferSignal_count_4_CLK
    );
  NlwBufferBlock_Dout_4_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => count(4),
      O => NlwBufferSignal_Dout_4_OBUF_I
    );
  NlwBufferBlock_Dout_5_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => count(5),
      O => NlwBufferSignal_Dout_5_OBUF_I
    );
  NlwBufferBlock_Dout_6_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => count(6),
      O => NlwBufferSignal_Dout_6_OBUF_I
    );
  NlwBufferBlock_Dout_7_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => count(7),
      O => NlwBufferSignal_Dout_7_OBUF_I
    );
  NlwBufferBlock_Dout_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => count(0),
      O => NlwBufferSignal_Dout_0_OBUF_I
    );
  NlwBufferBlock_Dout_1_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => count(1),
      O => NlwBufferSignal_Dout_1_OBUF_I
    );
  NlwBufferBlock_Dout_2_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => count(2),
      O => NlwBufferSignal_Dout_2_OBUF_I
    );
  NlwBufferBlock_Dout_3_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 202 ps
    )
    port map (
      I => count(3),
      O => NlwBufferSignal_Dout_3_OBUF_I
    );
  NlwBlock_Compteur_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;


--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
--Date        : Fri Apr  7 10:01:03 2023
--Host        : ROITIM-D366 running 64-bit major release  (build 9200)
--Command     : generate_target design_senzor_wrapper.bd
--Design      : design_senzor_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_senzor_wrapper is
  port (
    CA_0 : out STD_LOGIC;
    CB_0 : out STD_LOGIC;
    CC_0 : out STD_LOGIC;
    CD_0 : out STD_LOGIC;
    CE_0 : out STD_LOGIC;
    CF_0 : out STD_LOGIC;
    CG_0 : out STD_LOGIC;
    an_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    busy : out STD_LOGIC;
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    scl : inout STD_LOGIC;
    sda : inout STD_LOGIC;
    tact : out STD_LOGIC
  );
end design_senzor_wrapper;

architecture STRUCTURE of design_senzor_wrapper is
  component design_senzor is
  port (
    CA_0 : out STD_LOGIC;
    CB_0 : out STD_LOGIC;
    CC_0 : out STD_LOGIC;
    CD_0 : out STD_LOGIC;
    CE_0 : out STD_LOGIC;
    CF_0 : out STD_LOGIC;
    CG_0 : out STD_LOGIC;
    reset : in STD_LOGIC;
    sda : inout STD_LOGIC;
    scl : inout STD_LOGIC;
    busy : out STD_LOGIC;
    tact : out STD_LOGIC;
    clk : in STD_LOGIC;
    an_0 : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component design_senzor;
begin
design_senzor_i: component design_senzor
     port map (
      CA_0 => CA_0,
      CB_0 => CB_0,
      CC_0 => CC_0,
      CD_0 => CD_0,
      CE_0 => CE_0,
      CF_0 => CF_0,
      CG_0 => CG_0,
      an_0(3 downto 0) => an_0(3 downto 0),
      busy => busy,
      clk => clk,
      reset => reset,
      scl => scl,
      sda => sda,
      tact => tact
    );
end STRUCTURE;

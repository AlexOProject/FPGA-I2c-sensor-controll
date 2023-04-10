--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
--Date        : Thu Mar 16 10:06:05 2023
--Host        : ROITIM-D366 running 64-bit major release  (build 9200)
--Command     : generate_target design_senzor.bd
--Design      : design_senzor
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_senzor is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_senzor : entity is "design_senzor,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_senzor,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_senzor : entity is "design_senzor.hwdef";
end design_senzor;

architecture STRUCTURE of design_senzor is
  component design_senzor_i2c_master_0_0 is
  port (
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    ena : in STD_LOGIC;
    addr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    rw : in STD_LOGIC;
    data_wr : in STD_LOGIC_VECTOR ( 7 downto 0 );
    busy : out STD_LOGIC;
    data_rd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ack_error : out STD_LOGIC;
    tact : out STD_LOGIC;
    sda : inout STD_LOGIC;
    scl : inout STD_LOGIC
  );
  end component design_senzor_i2c_master_0_0;
  component design_senzor_i2c_read_0_0 is
  port (
    clk : in STD_LOGIC;
    dd1 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dd2 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dd3 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    dd4 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    temp : in STD_LOGIC_VECTOR ( 19 downto 0 )
  );
  end component design_senzor_i2c_read_0_0;
  component design_senzor_afis_0_0 is
  port (
    clk : in STD_LOGIC;
    dd1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dd2 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dd3 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dd4 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    an : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CA : out STD_LOGIC;
    CB : out STD_LOGIC;
    CC : out STD_LOGIC;
    CD : out STD_LOGIC;
    CE : out STD_LOGIC;
    CF : out STD_LOGIC;
    CG : out STD_LOGIC
  );
  end component design_senzor_afis_0_0;
  component design_senzor_controler_0_0 is
  port (
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    i2c_ack_err : in STD_LOGIC;
    temperature2 : out STD_LOGIC_VECTOR ( 19 downto 0 );
    i2c_ena : out STD_LOGIC;
    i2c_addr : out STD_LOGIC_VECTOR ( 6 downto 0 );
    i2c_rw : out STD_LOGIC;
    i2c_data_wr : out STD_LOGIC_VECTOR ( 7 downto 0 );
    i2c_data_rd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    i2c_busy : in STD_LOGIC
  );
  end component design_senzor_controler_0_0;
  signal Net : STD_LOGIC;
  signal Net1 : STD_LOGIC;
  signal Net2 : STD_LOGIC;
  signal afis_0_CA : STD_LOGIC;
  signal afis_0_CB : STD_LOGIC;
  signal afis_0_CC : STD_LOGIC;
  signal afis_0_CD : STD_LOGIC;
  signal afis_0_CE : STD_LOGIC;
  signal afis_0_CF : STD_LOGIC;
  signal afis_0_CG : STD_LOGIC;
  signal afis_0_an : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal clk_1 : STD_LOGIC;
  signal controler_0_i2c_addr : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal controler_0_i2c_data_wr : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal controler_0_i2c_ena : STD_LOGIC;
  signal controler_0_i2c_rw : STD_LOGIC;
  signal controler_0_temperature2 : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal i2c_master_0_ack_error : STD_LOGIC;
  signal i2c_master_0_busy : STD_LOGIC;
  signal i2c_master_0_data_rd : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal i2c_master_0_tact : STD_LOGIC;
  signal i2c_read_0_dd1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal i2c_read_0_dd2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal i2c_read_0_dd3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal i2c_read_0_dd4 : STD_LOGIC_VECTOR ( 3 downto 0 );
begin
  CA_0 <= afis_0_CA;
  CB_0 <= afis_0_CB;
  CC_0 <= afis_0_CC;
  CD_0 <= afis_0_CD;
  CE_0 <= afis_0_CE;
  CF_0 <= afis_0_CF;
  CG_0 <= afis_0_CG;
  Net <= reset;
  an_0(3 downto 0) <= afis_0_an(3 downto 0);
  busy <= i2c_master_0_busy;
  clk_1 <= clk;
  tact <= i2c_master_0_tact;
afis_0: component design_senzor_afis_0_0
     port map (
      CA => afis_0_CA,
      CB => afis_0_CB,
      CC => afis_0_CC,
      CD => afis_0_CD,
      CE => afis_0_CE,
      CF => afis_0_CF,
      CG => afis_0_CG,
      an(3 downto 0) => afis_0_an(3 downto 0),
      clk => clk_1,
      dd1(3 downto 0) => i2c_read_0_dd1(3 downto 0),
      dd2(3 downto 0) => i2c_read_0_dd2(3 downto 0),
      dd3(3 downto 0) => i2c_read_0_dd3(3 downto 0),
      dd4(3 downto 0) => i2c_read_0_dd4(3 downto 0)
    );
controler_0: component design_senzor_controler_0_0
     port map (
      clk => clk_1,
      i2c_ack_err => i2c_master_0_ack_error,
      i2c_addr(6 downto 0) => controler_0_i2c_addr(6 downto 0),
      i2c_busy => i2c_master_0_busy,
      i2c_data_rd(7 downto 0) => i2c_master_0_data_rd(7 downto 0),
      i2c_data_wr(7 downto 0) => controler_0_i2c_data_wr(7 downto 0),
      i2c_ena => controler_0_i2c_ena,
      i2c_rw => controler_0_i2c_rw,
      reset_n => Net,
      temperature2(19 downto 0) => controler_0_temperature2(19 downto 0)
    );
i2c_master_0: component design_senzor_i2c_master_0_0
     port map (
      ack_error => i2c_master_0_ack_error,
      addr(6 downto 0) => controler_0_i2c_addr(6 downto 0),
      busy => i2c_master_0_busy,
      clk => clk_1,
      data_rd(7 downto 0) => i2c_master_0_data_rd(7 downto 0),
      data_wr(7 downto 0) => controler_0_i2c_data_wr(7 downto 0),
      ena => controler_0_i2c_ena,
      reset_n => Net,
      rw => controler_0_i2c_rw,
      scl => scl,
      sda => sda,
      tact => i2c_master_0_tact
    );
i2c_read_0: component design_senzor_i2c_read_0_0
     port map (
      clk => clk_1,
      dd1(3 downto 0) => i2c_read_0_dd1(3 downto 0),
      dd2(3 downto 0) => i2c_read_0_dd2(3 downto 0),
      dd3(3 downto 0) => i2c_read_0_dd3(3 downto 0),
      dd4(3 downto 0) => i2c_read_0_dd4(3 downto 0),
      temp(19 downto 0) => controler_0_temperature2(19 downto 0)
    );
end STRUCTURE;

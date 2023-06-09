-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:i2c_master:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_senzor_i2c_master_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    reset_n : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    rw : IN STD_LOGIC;
    data_wr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    busy : OUT STD_LOGIC;
    data_rd : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    ack_error : OUT STD_LOGIC;
    tact : OUT STD_LOGIC;
    sda : INOUT STD_LOGIC;
    scl : INOUT STD_LOGIC
  );
END design_senzor_i2c_master_0_0;

ARCHITECTURE design_senzor_i2c_master_0_0_arch OF design_senzor_i2c_master_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_senzor_i2c_master_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT i2c_master IS
    GENERIC (
      input_clk : INTEGER;
      bus_clk : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      reset_n : IN STD_LOGIC;
      ena : IN STD_LOGIC;
      addr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      rw : IN STD_LOGIC;
      data_wr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      busy : OUT STD_LOGIC;
      data_rd : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      ack_error : OUT STD_LOGIC;
      tact : OUT STD_LOGIC;
      sda : INOUT STD_LOGIC;
      scl : INOUT STD_LOGIC
    );
  END COMPONENT i2c_master;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF reset_n: SIGNAL IS "XIL_INTERFACENAME reset_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF reset_n: SIGNAL IS "xilinx.com:signal:reset:1.0 reset_n RST";
BEGIN
  U0 : i2c_master
    GENERIC MAP (
      input_clk => 100000000,
      bus_clk => 100000
    )
    PORT MAP (
      clk => clk,
      reset_n => reset_n,
      ena => ena,
      addr => addr,
      rw => rw,
      data_wr => data_wr,
      busy => busy,
      data_rd => data_rd,
      ack_error => ack_error,
      tact => tact,
      sda => sda,
      scl => scl
    );
END design_senzor_i2c_master_0_0_arch;

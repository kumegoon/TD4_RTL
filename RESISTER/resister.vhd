library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity register is
    Port (
            CLK     : in    std_logic;
            RST     : in    std_logic;
            LOAD    : in    std_logic_vector(3 downto 0);
            IN_DATA : in    std_logic_vector(3 downto 0);
            OUT_A   : out   std_logic_vector(3 downto 0);
            OUT_B   : out   std_logic_vector(3 downto 0);
            OUT_LD  : out   std_logic_vector(3 downto 0);
            ADDRESS : out   std_logic_vector(3 downto 0)
    );
end register;

architecture RTL of register is
    signal  reg_a   :   std_logic_vector(3 downto 0);
    signal  reg_b   :   std_logic_vector(3 downto 0);
    signal  reg_c   :   std_logic_vector(3 downto 0);
    signal  reg_d   :   std_logic_vector(3 downto 0);

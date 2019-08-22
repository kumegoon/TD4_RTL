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

begin
    OUT_A   <= reg_a;
    OUT_B   <= reg_b;
    OUT_LD  <= reg_c;
    ADDRESS <= reg_d;

    process (CLK, RST) begin

        if (RST = '1') then
            reg_a <= (others => '0');
            reg_b <= (others => '0');
            reg_c <= (others => '0');
            reg_d <= (others => '0');

        elsif (pos_edge(CLK)) then
            reg_d <= reg_d + 1;

            if (LOAD(0) = '0') then
                reg_a <= IN_DATA;

            elsif (LOAD(1) = '0') then
                reg_b <= IN_DATA;

            elsif (LOAD(2) = '0') then
                reg_c <= IN_DATA;

            elsif (LOAD(3) = '0') then
                reg_d <= IN_DATA;
                
            end if;

        end if;

    end process;
end RTL;



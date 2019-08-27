library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--"register"では宣言はできない
entity register_4bit is
    Port (
            CLK     : in    STD_LOGIC;
            RST     : in    STD_LOGIC;
            LOAD    : in    STD_LOGIC_VECTOR(3 downto 0);
            IN_DATA : in    STD_LOGIC_VECTOR(3 downto 0);
            OUT_A   : out   STD_LOGIC_VECTOR(3 downto 0);
            OUT_B   : out   STD_LOGIC_VECTOR(3 downto 0);
            OUT_LD  : out   STD_LOGIC_VECTOR(3 downto 0);
            ADDRESS : out   STD_LOGIC_VECTOR(3 downto 0)
    );
end register_4bit;

architecture RTL of register_4bit is

    signal  reg_a   :   STD_LOGIC_VECTOR(3 downto 0);
    signal  reg_b   :   STD_LOGIC_VECTOR(3 downto 0);
    signal  reg_c   :   STD_LOGIC_VECTOR(3 downto 0);
    signal  reg_d   :   STD_LOGIC_VECTOR(3 downto 0);

begin
    OUT_A   <= reg_a;
    OUT_B   <= reg_b;
    OUT_LD  <= reg_c;
    ADDRESS <= reg_d;

    process (CLK, RST) begin

--reset時の値
        if (RST = '1') then
            reg_a <= (others => '0');
            reg_b <= (others => '0');
            reg_c <= (others => '0');
            reg_d <= (others => '0');

--立ち上がりエッジでプログラムカウンタ（reg_d）をcount up +1 
        elsif (rising_edge(CLK)) then
            reg_d <= reg_d + 1;

--LOADによって、IN_DATAの格納先変更（立ち上がりエッジで取込み）
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
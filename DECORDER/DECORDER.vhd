library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DECORDER is
    Port(
        OP_CODE     :   in  STD_LOGIC_VECTOR(3 downto 0);
        C_FLAG      :   in  STD_LOGIC;
        LOAD        :   out STD_LOGIC_VECTOR(3 downto 0);
        SEL_A       :   out std_logic;
        SEL_B       :   out std_logic
    );
end DECORDER

architecture RTL of DECORDER is

    signal  selecter    :   STD_LOGIC_VECTOR(1 downto 0);

    begin
        SEL_A   <=  selecter(0);
        SEL_B   <=  selecter(1);

        -- OP_CODE(OP3, OP2, OP1, OP0)
        -- selecter(B,A) LOAD(LOAD3, LOAD2, LOAD1, LOAD0)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity chatter_filter is
    Port(
        CLK     :   in  STD_LOGIC;
        RST     :   in  STD_LOGIC;
        SW_I    :   in  STD_LOGIC;
        SW_O    :   out STD_LOGIC
    );
end chatter_filter;

architecture RTL of chatter_filter is
    signal      cnt :   integer range   0 to    10000;
    constant    ct  :   integer := 9999;

    begin
        process(CLK, RST) begin
                if(RST = '1') then
                    cnt     <= 0;
                elsif(rising_edge(CLK)) then
                    if(SW_I = '1') then
                        if(cnt <= ct) then
                            cnt <= cnt + 1;
                        end if;
                    else
                        cnt <= 0;
                    end if;
                end if;
        end process;
        
    	SW_O <= '1' when cnt = ct else '0';
	
end RTL;
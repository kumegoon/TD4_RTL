library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rom_16byte is
    Port(
            ADDRESS : in STD_LOGIC_VECTOR(3 downto 0);
            ROM_DATA : out STD_LOGIC_VECTOR(3 downto 0);
            OP_CODE : out STD_LOGIC_VECTOR(3 downto 0)
        );
end rom_16byte;


architecture RTL of rom_16byte is

    signal data : STD_LOGIC_VECTOR(7 downto 0);

begin
    ROM_DATA <= data(3 downto 0);
    OP_CODE <= data(7 downto 4);

--LEDチカチカのROMデータ
    process (ADDRESS) begin
        case ADDRESS is
            when "0000" => data <= "10110011";
            when "0001" => data <= "10110110";
            when "0010" => data <= "10111100";
            when "0100" => data <= "10111000";
            when "0101" => data <= "10111000";
            when "0110" => data <= "10110110";
            when "0111" => data <= "10110011";
            when "1000" => data <= "10110001";
            when "1001" => data <= "11110000";
            when "1010" => data <= "00000000";
            when "1011" => data <= "00000000";
            when "1100" => data <= "00000000";
            when "1101" => data <= "00000000";
            when "1110" => data <= "00000000";
            when "1111" => data <= "00000000";
            when others => data <= "00000000";
        end case;
    end process;
end RTL;




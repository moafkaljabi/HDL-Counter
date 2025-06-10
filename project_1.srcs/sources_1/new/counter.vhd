----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2025 10:52:13 PM
-- Design Name: 
-- Module Name: counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- For arithmetic

entity counter is
    Port (
        clk     :   in std_logic;                       -- Clock input 
        rst     :   in std_logic;                       -- Active-high reset button
        count   :   out std_logic_vector(3 downto 0)    -- 4-bit output count 
    );
end counter;

architecture Behavioral of counter is
    signal cnt_reg : std_logic_vector(3 downto 0) := (others => '0'); -- Internal register to hold count
begin

    process(clk, rst)
    begin
        if rst = '1' then
            cnt_reg <= (others => '0'); -- To reset the counter to 0 when rst =1.
        elsif rising_edge(clk) then 
            cnt_reg <= std_logic_vector(unsigned(cnt_reg) +1); -- Increment the counter on rising edge of the clock
        end if;
    end process;
    
    count <= cnt_reg; -- Output the current counter.
    
end Behavioral;

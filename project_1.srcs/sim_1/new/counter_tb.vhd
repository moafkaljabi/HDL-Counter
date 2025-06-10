----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/09/2025 11:51:42 PM
-- Design Name: 
-- Module Name: counter_tb - Behavioral
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



entity counter_tb is
end counter_tb;

architecture Behavioral of counter_tb is
    
    -- Component declaration of Unit Under Test(UUT).
    component counter
        Port(
            clk     :   in std_logic; 
            rst     :   in std_logic;
            count   :   out std_logic_vector(3 downto 0)
        );
    end component;
    
    -- Testbench Signals
    signal clk_tb   : std_logic := '0';
    signal rst_tb   : std_logic := '0';
    signal count_tb : std_logic_vector(3 downto 0);
    

begin
    
    -- Instantiate the Unit Under Test(UUT).
    uut: counter
        port map (
            clk => clk_tb,
            rst => rst_tb,
            count => count_tb
            );

    -- Clock generation, 50 MHz,toggle evey 20ns.
    clk_process : process
    begin 
        while true loop
            clk_tb <= '0';
            wait for 10 ns;
            clk_tb <= '1';
            wait for 10 ns;
        end loop;
    end process;
    
    -- Reset and stimulus process
    stim_process : process
    begin 
        -- Initial state
        rst_tb <= '1';
        wait for 25 ns;
        
        -- Release state
        rst_tb <= '0';
        wait for 200 ns;
        
        -- Assert reset again
        rst_tb <= '1';
        wait for 20 ns;
        
        -- Deassert reset
        rst_tb <= '0';
        wait for 100 ns;
        
        -- Stop simulation 
        wait;
    end process;
     
    
end Behavioral;

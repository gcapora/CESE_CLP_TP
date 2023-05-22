library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity senial1_tb is
end;

architecture senial1_tb_arq of senial1_tb is

    constant DW_tb:     natural := 12;
    signal clk_tb:      std_logic := '0';
    signal reset_tb:    std_logic := '1';
    signal enable_tb:   std_logic := '0';
    signal sine_out_tb: std_logic_vector(DW_tb - 1 downto 0);

begin

    clk_tb    <= not clk_tb after 5 ns;
    reset_tb  <= '0' after 50 ns;
    enable_tb <= '1' after 50 ns;
    
    DUT: entity work.senoidal
        generic map(
            BITS_DATO => DW_tb
        )
        port map(
            clk      =>  clk_tb,
            reset    =>  reset_tb,
            enable   =>  enable_tb,
            seno_o   =>  sine_out_tb
        );
end;


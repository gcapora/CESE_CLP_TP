library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity cfa_seno_tb is
end;

architecture cfa_seno_tb_arq of cfa_seno_tb is

    constant Q_BITS_tb: positive := 8;
    constant N_BITS_tb: positive := 8;
    signal reset_tb:    std_logic := '1';
    signal fase_tb:     std_logic_vector(N_BITS_tb - 1 downto 0) := "00000000";
    signal sine_out_tb: std_logic_vector(Q_BITS_tb - 1 downto 0);

begin

    --clk_tb    <= not clk_tb after 5 ns;
    --enable_tb <= '1' after 50 ns;
    reset_tb  <= '0' after 50 ns;
    fase_tb   <= "00001111" after 100 ns, "11110000" after 200 ns, "11111111" after 600 ns;
    
    DUT: entity work.cfa_seno
        generic map(
            Q_BITS_DATO => Q_BITS_tb
        )
        port map(
            reset_i     => reset_tb,
            fase_i      => fase_tb,
            seno_o      => sine_out_tb
        );
end;


library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity seno_tb is
end;

architecture seno_tb_arq of seno_tb is

    constant QD_tb:     positive  := 12;
    constant BI_tb:     positive  := 25;
    constant F_MIN:     std_logic_vector(24 downto 0) := "0000000000000000000000001";
    constant F_10KHZ:   std_logic_vector(24 downto 0) := "0000000010100111110001011";
    constant F_100KHZ:  std_logic_vector(24 downto 0) := "0000011010001101101110001";
    constant F_122KHZ:  std_logic_vector(24 downto 0) := "0000100000000000000000000";
    constant F_1MHZ:    std_logic_vector(24 downto 0) := "0100000110001001001101110"; 
    constant F_2MHZ:    std_logic_vector(24 downto 0) := "1000001100010010011011101";
    constant F_MAX:     std_logic_vector(24 downto 0) := "1111111111111111111111111";
    
    signal clk_tb:      std_logic := '0';
    signal reset_tb:    std_logic := '1';
    signal enable_tb:   std_logic := '0';
    signal inc_tb:      std_logic_vector(BI_tb-1 downto 0) := F_1MHZ;
    signal sine_out_tb: std_logic_vector(QD_tb-1 downto 0);

begin

    clk_tb    <= not clk_tb after 4 ns;
    reset_tb  <= '0' after 10 ns; --, '1' after 400 ns;
    enable_tb <= '1' after 50 ns;
    
    DUT: entity work.seno
        generic map(
            BITS_DATO       => QD_tb,
            BITS_INCREMENTO => BI_tb
        )
        port map(
            s_reloj_i       =>  clk_tb,
            s_reset_i       =>  reset_tb,
            s_habilitar_i   =>  enable_tb,
            s_incremento_i  =>  inc_tb,
            s_seno_o        =>  sine_out_tb
        );
end;




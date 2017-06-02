library IEEE; 
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_4017 is
	port ( clock, clock_inh, reset : in  std_logic;
				output : out std_logic_vector (9 downto 0);
				 carry : out std_logic);
end counter_4017;

architecture behavioral of counter_4017 is
	signal out_vector : std_logic_vector (9 downto 0) := "0000000001";
	signal carry_signal : std_logic := '1';
begin
	process (clock, reset)
	begin
		if reset = '1' then
			out_vector <= "0000000001";
		elsif rising_edge(clock) then
			if clock_inh = '0' then
				out_vector <= to_stdlogicvector(to_bitvector(out_vector) rol 1);
				if to_integer(unsigned(to_stdlogicvector(to_bitvector(out_vector) rol 1))) < 32 then
					carry_signal <= '1';
				else
					carry_signal <= '0';
				end if;
			end if;
		end if;
	end process;

	output <= out_vector;
	carry  <= carry_signal;
end behavioral;

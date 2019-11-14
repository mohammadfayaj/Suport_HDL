library IEEE;
use IEEE.std_logic_1164.all;

entity hello_world is
end entity;

architecture hello of hello_world is
begin
	assert false report "Hello World" severity note;
end architecture;
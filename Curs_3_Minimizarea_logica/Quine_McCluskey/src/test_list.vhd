library work;
use work.list_pkg.all;

entity test_list is
end entity;

architecture test of test_list is
		shared variable my_list : LIST;
begin

	process 
		variable int : integer;
	begin

		my_list.pushc(1);
		int := 1;
		my_list.push(int);
		int := 2;
		my_list.push(int);
		my_list.show;
		assert my_list.pop = 2 report "hoops" severity failure;
		assert my_list.pop = 1 report "hoops" severity failure;
		assert my_list.pop = 1 report "hoops" severity failure;
		assert my_list.pop = 1 report "hoops" severity failure;
		--my_list := my_list.succ;
		--assert my_list.value = 1 report "hoops" severity failure;
		assert false report "End Sim" severity failure;
	end process;
end architecture;
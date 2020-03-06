library work;


entity test_list is
end entity;

architecture test of test_list is

		type est is record
			power: real;
			area: real;
		end record; 
		
		procedure print_item (i : integer) is
		begin
			report integer'image(i);
		end procedure;
		
		package integer_list is new work.list_pkg generic map (mytype => integer, print_item => print_item) ;
		use integer_list.all;
		
		shared variable my_list : integer_list.LIST;
		
begin

	process 
		variable int : integer;
		variable elem : est := (1.0,1.0);
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

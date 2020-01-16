-- Implemnetarea metodei Quine-McCluskey
use std.textio.all;

package quine_mccluskey is

	type ITEM;
	
	type ITEM_PTR is access ITEM;
	
	type ITEM is record
		value : integer;
		succ : ITEM_PTR;
	end record ITEM;
	
	type IMPLICANT;
	
	type IMPLICANT_PTR is access IMPLICANT;
	
	type IMPLICANT is record
		covered : ITEM_PTR;
		size : integer;
		used : boolean;
		succ : IMPLICANT_PTR;
	end record IMPLICANT;
	
	type GROUPS;
	
	type GROUPS_PTR is access GROUPS;
	
	type GROUPS is record
		member : IMPLICANT_PTR;
		order : integer;
		succ : GROUPS_PTR;
	end record GROUPS;
	
	type COLUMN;
	
	type COLUMN_PTR is access COLUMN;
	
	type COLUMN is record
		member : GROUPS_PTR;
		succ : COLUMN_PTR;
	end record COLUMN;
	
	type TABLE;
	
	type TABLE_PTR is access TABLE;
	
	type TABLE is record
		member : COLUMN_PTR;
		succ : TABLE_PTR;
	end record TABLE;
	
	type minimizer is protected

		procedure load_function;
		procedure order_function;
		procedure get_prime_implicants;
		procedure get_cover;

		procedure print;

		--urmatoarele functii sunt numai pentru testari
		procedure initTestList; -- initializare lista test -- Daniela

	end protected minimizer;
	
end package;

package body quine_mccluskey is

	type minimizer is protected body 
		variable myTable : TABLE;
		variable function_arg_num : integer;
		variable function_implic_num : integer;
		variable myFunction : ITEM_PTR;
		variable testList: ITEM_PTR; -- lista test -- Daniela
		
		procedure load_function is
			file file_handler     : text open read_mode is "../test/functie1.txt";
			Variable row          : line;
			Variable v_data_read  : integer;
			Variable valoare      : integer; 
			Variable ptr		  : ITEM_PTR;	
			
		begin
			--todo : implement read function
			-- exemple:
			-- Read line from file: 
			 
			readline(file_handler, row);
			
			-- Read value from line: 
			
			read(row, v_data_read);
			function_arg_num := v_data_read;
			report integer'image(v_data_read);
			
			
			readline(file_handler, row);
			read(row, function_implic_num);
			report integer'image(function_implic_num);  --nr implicanti
			
			for i in 1 to function_implic_num loop
			readline(file_handler, row);
			read(row, valoare);
			
			ptr := NEW ITEM;
			
			if i = 1 then
						ptr.succ := NULL;
			else 
						ptr.succ := myFunction;
			end if;
			
			ptr.value := valoare;
			myFunction := ptr; 		
			end loop;
		end procedure;
		
		procedure print is
			variable ptr : ITEM_PTR;
		
		begin
		
		ptr := myFunction;
		while ptr /= NULL 
		loop 
			report integer'image(ptr.value);
			ptr := ptr.succ;
		end loop;
		
		end procedure;
		
		procedure order_function is
			function get_order(valoare:integer) return integer is 	
				variable count:integer :=0;
				variable tmp : integer;
			begin
				tmp:= valoare;
				while(tmp/=0) loop
					if (tmp rem 2)=1 then
						count:=count+1;
					end if;
					tmp:=tmp/2;
				end loop;
				return count;
			end function;
			
			procedure existsOrderInColumn(variable col: in column_ptr; variable order :in integer; variable ret : out boolean) is
				variable coloana : column_ptr;
				variable isOrder : boolean := false;
			begin
				coloana := col;
				while coloana.member /= null loop
					if coloana.member.order = order then
						isOrder := true;
					end if;
				end loop;
				ret := isOrder;
			end procedure;
			
			procedure addItem(variable coloana: inout column_ptr; variable ordinCurent, termenCurent : integer) is
				variable col : column_ptr;
				variable grupe : groups_ptr;
				variable termen : implicant_ptr;
			begin
				col := coloana;
				while col.member.order /= ordinCurent loop
					col.member := col.member.succ;
				end loop;
				grupe := col.member;
				while grupe.member.covered.value < termenCurent loop
				end loop;
						
			end procedure;
			
			variable coloana:column_ptr;
			variable grupe, pointer_grupe : groups_ptr;
			variable implicanti : implicant_ptr;
			variable termeni : item_ptr;
			variable ret : boolean;
			variable termenCurent, ordinCurent : integer;
		begin
			--todo : compute the order of each implicant
			-- create groups for each order
			coloana := new column;
			coloana.member:= null;
			coloana.succ := null;
			report "am intrat in order_function!!!" severity note;
			termeni := testList;
			-- parcurge toti termeni din lista (pe moment lista de test)
			while ( termeni /= null) loop
				termenCurent := termeni.value;
				report integer'image(termenCurent);
				ordinCurent := get_order(termenCurent);
				existsOrderInColumn(coloana,ordinCurent,ret); 
				if ret then
					addItem(coloana, ordinCurent, termenCurent);
				else
					-- creare grupa noua
					grupe := new groups;
					grupe.order:= ordinCurent;
					grupe.succ:= null;
					-- creare implicant nou
					grupe.member := new Implicant;
					grupe.member.succ := null;
					grupe.member.size := 1;
					--creare termen nou
					grupe.member.covered := new Item;
					grupe.member.covered.value := termenCurent;
					grupe.member.covered.succ := null;

					--inserare grupe la coloana 
					pointer_grupe := coloana.member;
					while pointer_grupe.succ /= null or pointer_grupe.succ.order > ordinCurent loop
						pointer_grupe := pointer_grupe.succ;
					end loop;
					grupe.succ := pointer_grupe;
					pointer_grupe := grupe;
				end if;
				
			end loop;
							
		end procedure;				
		
		procedure get_prime_implicants is
		begin
			--todo : implement get implicants
			-- build up a LIST type
		end procedure;
		procedure get_cover is
		begin
			--todo : compute a suitable cover
		end procedure;
		
		
		procedure showTestList is
			variable ptr: ITEM_PTR;
		begin
			ptr:= testList;
			while ptr /= NULL loop
				report integer'image(ptr.value);
				ptr := ptr.succ;
			end loop; 
		end procedure;		
		
		procedure initTestList is -- initializare lista test -- Daniela
			variable ptr : ITEM_PTR;
			variable i :integer;
		begin
			ptr := new ITEM;
			ptr.value := 1;
			ptr.succ := NULL;
			testList := ptr;
			ptr := new ITEM;
			ptr.value := 3;
			ptr.succ := testList;
			testList := ptr;
			ptr := new ITEM;
			ptr.value := 4;
			ptr.succ := testList;
			testList := ptr;			
			ptr := new ITEM;
			ptr.value := 6;
			ptr.succ := testList;
			testList := ptr;
			ptr := new ITEM;
			ptr.value := 7;
			ptr.succ := testList;
			testList := ptr;
			showTestList;	
		end procedure;
		

	end protected body minimizer;

end package body;
 

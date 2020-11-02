

-- Implemnetarea metodei Quine-McCluskey
use std.textio.all;

package quine_mccluskey is
	
	type ITEM;
	
	type ITEM_PTR is access ITEM;
	
	type ITEM is record
		value : integer;
		succ : ITEM_PTR;
		impl : ITEM_PTR;
		grp : ITEM_PTR;
		col : ITEM_PTR;
	end record ITEM;
	
	type minimizer is protected

		
		procedure load_function(constant fisier_functie : string);
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
		variable currTable, currCol, currGrp, currImpl  : ITEM_PTR;
		variable function_arg_num : integer;
		variable function_implic_num : integer;
		variable myFunction : ITEM_PTR;
		variable testList: ITEM_PTR; -- lista test -- Daniela
		
		procedure load_function(constant fisier_functie : string) is
			file file_handler     : text;
			Variable row          : line;
			Variable v_data_read  : integer;
			Variable valoare      : integer; 
			Variable ptr		  : ITEM_PTR;	
			--variable function_implic_num : integer;
		begin
			
			-- Read line from file: 
			
			--file file_pointer : text; 
			 
			--file functie1 : text;
			--Variable fn : string

			--fn := "" & fisier_functie;
			file_open(file_handler,fisier_functie,READ_MODE);
			
			--file_open(file_pointer,fn,READ_MODE);
			
			--deschidere fisier  
			
			readline(file_handler, row);
			
			-- Read value from line: 
			
			read(row, v_data_read);
			function_arg_num := v_data_read;
			report integer'image(v_data_read);
			
			
			readline(file_handler, row);
			read(row, function_implic_num);
			report integer'image(function_implic_num);  --nr implicanti
			
			myFunction := null;
			
		
			for i in 1 to function_implic_num loop
				readline(file_handler, row);
				read(row, valoare);
				--report integer'image(valoare);
				ptr := NEW ITEM;
				ptr.value := valoare;
				ptr.succ := myFunction;

				myFunction := ptr; 		
			end loop;
			
			--file_close(functie1);
			
			file_close(file_handler);
			--fclose
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
			
			
			procedure addItem(variable ordinCurent, termenCurent : integer) is
				variable col,grp,impl, term : item_ptr := null;
			begin
				--loop through groups
				currGrp := currCol.grp;
				while currGrp /= null loop
					report "am intrat in order_function/addItem/while!!!" severity note;			
					if currGrp.value = ordinCurent then
						exit;
					elsif currGrp.value > ordinCurent then
						exit;
					end if;
					currGrp := currGrp.grp;
				end loop;
				if  currGrp = null then
					report "am intrat in order_function/addItem/if!!!" severity note;
					--group does not exists
					grp := new ITEM;
					grp.value := ordinCurent;
					grp.impl := new ITEM;
					impl := grp.impl;
					impl.value := 1; --how many terms are covered
					impl.succ := new ITEM;
					term := impl.succ;
					term.value := termenCurent;
					term.succ := new ITEM;
					term := term.succ;
					term.value := 0; -- unused
					grp.grp := currGrp;
					currCol.grp := grp;
				else
					--insert term into existing group
					--loop throuh the group;
					impl := currGrp.impl;
					while impl.succ /= null loop
						report "am intrat in order_function/addItem/else.while!!!" severity note;
						if impl.succ.value > termenCurent then
							exit;
						end if;
						impl := impl.succ;
					end loop;
					currImpl := new ITEM;
					currImpl.value := 1; -- covered terms
					currImpl.succ := new ITEM;
					term := currImpl.succ ;
					term.value := termenCurent;
					term.succ := new ITEM;
					term := term.succ;
					term.value := 0; -- used/unused flag
					term.succ := currImpl.succ;
					currImpl.succ := impl;
					impl.succ := currImpl;
				end if;
			end procedure;
			
			variable coloana:item_ptr;
			variable grupe, pointer_grupe : item_ptr;
			variable implicanti : item_ptr;
			variable termeni : item_ptr;
			variable ret : boolean;
			variable termenCurent, ordinCurent : integer;
		begin
			--todo : compute the order of each implicant
			-- create groups for each order
			currTable := new ITEM; 
			assert currTable.col = null report "currTable.col /= null" severity note;
			assert currTable.grp = null report "currTable.col /= null" severity note;
			assert currTable.impl = null report "currTable.col /= null" severity note;
			assert currTable.succ = null report "currTable.col /= null" severity note;
			currTable.value := 1; -- no significance
			currTable.col := new ITEM;
			currCol := currTable.col ;
			currCol.value := 1; -- first column
			termeni := myFunction;
			-- parcurge toti termeni din lista (pe moment lista de test)
			while ( termeni.succ /= null) loop
				termenCurent := termeni.value;		
				ordinCurent := get_order(termenCurent);
				report "Ordin:" & integer'image(termenCurent) & "=" & integer'image(ordinCurent);
				addItem(ordinCurent, termenCurent);
				termeni := termeni.succ;
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
 

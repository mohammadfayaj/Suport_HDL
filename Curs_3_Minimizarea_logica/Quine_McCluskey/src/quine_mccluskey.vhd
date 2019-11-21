-- Implemnetarea metodei Quine-McCluskey
use std.textio.all;

package quine_mccluskey is

	type ITEM;
	
	type ITEM_PTR is access ITEM;
	
	type ITEM is record
		value : integer;
		succ : ITEM_PTR;
	end record ITEM;
	
	type IMPLICANT is record
		covered : ITEM_PTR;
		size : integer;
		used : boolean;
	end record IMPLICANT;
	
	type IMPLICANT_PTR is access IMPLICANT;
	
	type GROUPS is record
		member : IMPLICANT;
		succ : IMPLICANT_PTR;
	end record GROUPS;
	
	type GROUPS_PTR is access GROUPS;
	
	type COLUMN is record
		member : GROUPS;
		succ : GROUPS_PTR;
	end record COLUMN;
	
	type COLUMN_PTR is access COLUMN;
	
	type TABLE is record
		member : COLUMN;
		succ : COLUMN_PTR;
	end record TABLE;
	
	type minimizer is protected

		procedure load_function;
		procedure order_function;
		procedure get_prime_implicants;
		procedure get_cover;
		--urmatoarele functii sunt numai pentru testari
		procedure initTestList; -- initializare lista test -- Daniela
	end protected minimizer;
	
end package;

package body quine_mccluskey is

	type minimizer is protected body 
		variable myTable : TABLE;
		variable function_arg_num : integer;
		variable myFunction : ITEM_PTR;
		variable testList: ITEM_PTR; -- lista test -- Daniela
		
		procedure load_function is
			file file_handler     : text open read_mode is "..\test\functie1.txt";
			Variable row          : line;
			Variable v_data_read  : integer;
		begin
			--todo : implement read function
			-- exemple:
			-- Read line from file:  
			readline(file_handler, row);
			-- Read value from line: 
			read(row, v_data_read);
			function_arg_num := v_data_read;
			report integer'image(v_data_read);
			
			
		end procedure;
		
		procedure order_function is
		begin
			--todo : compute the order of each implicant
			-- create groups for each order
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
 

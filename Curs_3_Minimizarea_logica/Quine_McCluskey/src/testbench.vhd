use std.textio.all;
entity EX_ACCESS is
end entity EX_ACCESS;

architecture EX_ACCESS of EX_ACCESS is
begin

	process 
		-- Incomplete type declaration
		type Item;  
		
		-- declare the access type
		type Link is access Item;
		
		-- declare the item
		type Item is record
		  Data: string(1 to 6);
		  NextItem: Link;
		end record;
		
		-- declare two variables of type Link
		variable StartOfList, Ptr: Link;
		
		----------------------------------------
		variable L : LINE;
		procedure Display 
		  (variable StartOfList: in Link) 
		is
		  variable Ptr : Link;
		  variable L : LINE;
		begin
		  Ptr := StartOfList;
		  while Ptr /= null loop
			WRITE(L, Ptr.Data);
			Ptr := Ptr.NextItem;
		  end loop;
		  WRITELINE(OUTPUT, L);
		end procedure;
		begin    

		----------------------------------------

		-- Add item to start of list
		Ptr := new Item;              -- Allocate storage
		Ptr.Data := "world!";
		Ptr.NextItem := StartOfList;  -- Link item into list
		StartOfList := Ptr;
		
		-- Add item to start of list
		Ptr := new Item;              -- Allocate storage
		Ptr.Data := "hello ";
		Ptr.NextItem := StartOfList;  -- Link item into list
		StartOfList := Ptr;

		----------------------------------------
		WRITE(L, string'("Here is the contents of the list."));
		WRITELINE(OUTPUT, L);
		Display(StartOfList);
		----------------------------------------

		-- Delete entire list
		while StartOfList /= null loop
		  Ptr := StartOfList.NextItem;
		  DEALLOCATE(StartOfList);
		  StartOfList := Ptr;
		end loop;

		----------------------------------------
		WRITE(L, string'("Here is the contents of the list."));
		WRITELINE(OUTPUT, L);
		WRITE(L, string'("(it should be empty)"));
		WRITELINE(OUTPUT, L);
		Display(StartOfList);
		wait;
    end process;
end architecture EX_ACCESS;
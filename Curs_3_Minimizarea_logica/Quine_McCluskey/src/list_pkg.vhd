-- Implemnetarea tipului de date list
library IEEE;
use IEEE.std_logic_1164.all;

package list_pkg is generic (type mytype;
							procedure print_item ( i : mytype)	);

	type ITEM;
	-- declaration of an access type List_Element_Ptr:
	type LINK is access ITEM;
	-- declaration of an full record type List_Element:
	type ITEM is record 
					  value : mytype;
					  succ : LINK;
	end record ITEM;	
	
	type LIST is protected
	
	    procedure push( variable value : in mytype);
        procedure pushc( constant const : in mytype);
	    impure function pop return mytype;
        procedure show;
	    
	end protected LIST;

	
end package;

package body list_pkg is

	type LIST is protected body

	    variable mylist : LINK ;

        procedure push( variable value : in mytype) is
            variable Ptr : LINK;
        begin 
            if mylist = NULL then
                mylist := new ITEM;
                mylist.value := value;
                mylist.succ := NULL;
            else
                Ptr :=  new ITEM;
                Ptr.value := value;
                Ptr.succ := mylist;
                mylist := Ptr;
            end if;
        end procedure;
        
        procedure pushc( constant const : in mytype) is
            variable Ptr : LINK;
        begin 
            if mylist = NULL then
                mylist := new ITEM;
                mylist.value := const;
                mylist.succ := NULL;
            else
                Ptr :=  new ITEM;
                Ptr.value := const;
                Ptr.succ := mylist;
                mylist := Ptr;
            end if;
        end procedure;
        
        impure function pop return mytype is
            variable value : mytype;
        begin
            if mylist /= NULL then
                value := mylist.value;
                mylist := mylist.succ;
            else
               -- value := -1;
            end if;
            return value;
        end function;
        
        procedure show is
        	variable ptr : LINK;
        begin
        	ptr := mylist;
        	while ptr /= NULL loop
            	--report mytype'image(ptr.value);
            	print_item ( ptr.value);
                ptr := ptr.succ;
            end loop;
        end procedure;
        
    end protected body LIST;
        
end package body;
 

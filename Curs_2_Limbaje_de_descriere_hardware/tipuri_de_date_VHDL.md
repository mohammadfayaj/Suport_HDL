# Tipuri de date VHDL

  * Ce este un tip de date?

    * Este o clasificare a obiectelor/elementelor/datelor care definește posibila mulțime a valorilor pe care obiectele/elementele/datele care aparțin acelui tip își pot asuma
    * Ex. (VHDL)  integer, bit, std_logic, std_logic_vector
    * Alte limbaje (float, double, int , char etc)
 
  * Tipuri de date Predefinite
  
    * Specificate prin standardele IEEE 1076 și IEEE 1164 
    * Standardul IEEE 1076 definește VHSIC Hardware Description Language sau VHDL
      * Dezvoltat de Intermetics, IBM și Texas Instruments pentru Forța Aeriană a Statelor Unite
      * Prima verziune era 1076-1987
      * Revăzut în 1993, 2000, 2002 și 2008
      
  * Pachetul standard al librărieri std (implicit inclus):
  
    * tip bit (0, 1)
    * vectori bit (semnal de grup multi-bit --> bus

    * Exemple
```VHDL
– SIGNAL x: BIT;
– SIGNAL y: BIT_VECTOR (3 DOWNTO 0);
– SIGNAL w: BIT_VECTOR (0 TO 7);
```


   * Operator de atribuire a semnalului <=
    
      * x <= '1';
      * y <= "0111";
      * w <= "01110001";

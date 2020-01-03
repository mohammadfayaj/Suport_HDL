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
      
  * <b>Pachetul standard al librărieri std (implicit inclus):</b>
  
    * tip bit (0, 1)
    * vectori bit (semnal de grup multi-bit --> bus

    * Exemple
```VHDL
– SIGNAL x: BIT;
– SIGNAL y: BIT_VECTOR (3 DOWNTO 0);
– SIGNAL w: BIT_VECTOR (0 TO 7);
```


   * Operator de atribuire a semnalului <b><=</b>
```VHDL
      - x <= '1';
      - y <= "0111";
      - w <= "01110001";
```
   
   * BOOLEAN (ADEVĂRAT, FALS)
     * Exemplu:
     ```VHDL
       - variable VAR1: boolean := FALSE;
       ```
       
   * INTEGER (32 bit, de la -2,147,483,647 până +2,147,483,647)
     * Exemplu:
     ```VHDL
       - SIGNAL SUM: integer range 0 to 256 :=16;
       ```
       
   * REAL (de la -1.0E38 până +1.0E38)
     * Exemplu:
     ```VHDL
       - constant PI : real := 3.14159;
       ```
       
   * Standardul IEEE 1164
     * Introduce pachetele de logică multiplă (Multivalue Logic - std_logic_1164)
     * Tipul primar de dată std_ulogic (standard unresolved logic), alcătuit din nouă litere în următoarea ordine:
     
<b> 
 1. 'U' - neinițializat (valoare implicită)
 2. 'X' - drive puternic, logică necunoscută
 3. '0' - drive puternic, zero logic
 4. '1' - drive puternic, unu logic
 5. 'Z' - impedanță mare (pentru logică tri-state)
 6. 'W' - drive slab, logică necunoscută
 7. 'L' - drive slab, zero logic
 8. 'H' - drive slab, unu logic
 9. '-' - don't care (nu contează)
</b>

   * std_ulogic, subtipurile (std_logic, std_logic_vector, std_ulogic_vector) și valorile lor pot fi cageorizate prin statusul și puterea lor (forțare, impedanță mică și impedanță mare)
   * Puterea slabă este folosită pentru intrări de tip multi-driver pentru pullup/pulldown
   * Date de tip std_ulogic, posibile valori și puterea lor
   
   | Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |
   
  
 
   
       
       
       
     
       
    
       
    

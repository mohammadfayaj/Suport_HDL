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
      
 Tabel1
      
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
     

 1. <b>  'U' - neinițializat (valoare implicită) </b>
 2. <b>  'X' - drive puternic, logică necunoscută </b>
 3. <b> '0' - drive puternic, zero logic </b>
 4. <b>  '1' - drive puternic, unu logic </b>
 5. <b>  'Z' - impedanță mare (pentru logică tri-state) </b>
 6. <b>  'W' - drive slab, logică necunoscută </b>
 7. <b>  'L' - drive slab, zero logic </b>
 8. <b>  'H' - drive slab, unu logic </b>
 9. <b>  '-' - don't care (nu contează) </b>

   * std_ulogic, subtipurile (std_logic, std_logic_vector, std_ulogic_vector) și valorile lor pot fi categorizate prin starea și puterea lor (forțare, impedanță mică și impedanță mare)
   * Puterea slabă este folosită pentru intrări de tip multi-driver pentru pullup/pulldown
   * Date de tip std_ulogic, posibile valori și puterea lor
   
| Valoare       | Stare         | Putere  | Comentariu |
| ------------- |:-------------:| -----:|:----------:|
| U      | Neinițializat | - | Valoare implicită înainte de simulare |
| X      | Necunoscut | Forțat | Reprezintă semnalele drived al călor valori nu poate fi determinat ca 1 sau 0 |
| 0 | 0 | Forțat | Reprezintă semnale de la driverele active de la ieșire |
| 1 | 1 | Forțat | Reprezintă semnale de la driverele active de la ieșire |
| Z | - | Impedanță înaltă | Reprezintă ieșirea buffer-ului tri-state când nu este activ |   
| W | Necunoscut | Slab | Reprezintă semnale de la drivere rezistive de ex. rezistențe pull-up și pull-down |
| L | 0 | Slab |  Reprezintă semnale de la drivere rezistive de ex. rezistențe pull-up și pull-down |
| H | 1 | Slab | rezistențe pull-up și pull-down | Reprezintă semnale de la drivere rezistive de ex. rezistențe pull-up și pull-down |
| - | Don't care | - | Permite sintetizatorului să decidă dacă atribuie 0 sau 1 pentru un circuit logic minim sintetizat |

* std_ulogic
  * Tip de dată unresolved
  * Declarat în pachetul STD_LOGIC_1164 din librăria IEEE
  * Toate semnalele de dată sunt de tip unresolved, implicit
  * Semnalele de dată de tip unresolved nu pot fi drived de mai mult de un driver (dacă adaugăm mai multe surse, va rezulta o eroare de compilare)
  * Verifică dacă nu cumva designerul a atribuit, din greșeală, două surse la aceași semnal
  
* Tipuri de date resolved
  * Declarate întotdeauna cu ajutorul unei funcții de rezoluție (din interiorul librăriei)
  * Funcția de rezoluție definește toate combinațiile posibile de la una sau mai ulte valori de surse și rezultatul corespunzător
  
  FIG 2
  
* std_logic (este de tip resolved)
  * Subtip al std_ulogic
  * Declarat în pachetul STD_LOGIC_1164 din librăria IEEE ca
  
       ```VHDL
       subtype std_logic is resolved std_ulogic;
       ```
  * Este specificat o funcție de rezoluție numit "resolved"
  * Tabel de rezoluție std_logic
  
|   | | X | 0 | 1 | Z | W | L | - |   |
| ------------- |:--:| :--:|:--:| :--:|:--:|:--:|:--:|:--:| -----:|
|   | |   |   |   |   |   |   |   |   |
| X | | X | X | X | X | X | X | X | X |
| 0 | | X | 0 | X | 0 | 0 | 0 | 0 | X |
| 1 | | X | X | 1 | 1 | 1 | 1 | 1 | X |
| Z | | X | 0 | 1 | Z | W | L | H | X |
| W | | X | 0 | 1 | W | W | W | W | X |
| L | | X | 0 | 1 | L | W | L | W | X |
| H | | X | 0 | 1 | H | W | W | H | X |
| - | | X | X | X | X | X | X | X | X |

* <b> Exemple de declarare std_logic </b>
 ```VHDL
– SIGNAL x: STD_LOGIC;
– SIGNAL y: STD_LOGIC_VECTOR (3 DOWNTO 0) := "0001";

```

# Tipuri de date VHDL: Matrici 

* O matrice este mulțimea obiectelor de aceasi tip
* Poate fi unidimensional (1D) sau bidimensional (2D)
* Matrici de dimensiuni mai mari nu pot fi sintentizate

FIG 2

* <b> Definirea matricilor VHDL </b>
   * Prima dată definim un nou tip de date
   * Apoi declarăm un semnal, o variabilă sau constantă de tipul definit anterior
 
 * <b> Formatul general al definirii unei matrici </b>
 
 ```VHDL
TYPE type_name IS ARRAY (specification) OF data_type;
SIGNAL signal_name: type_name [:= initial_value];

```

* <b> Exemple </b>

 ```VHDL
TYPE row IS ARRAY (7 DOWNTO 0) OF STD_LOGIC;
```

  * Definește o linie (matrice 1D) (tip de date) cu șapte valori STD_LOGIC cu MSB (bitul cel mai semnificativ) la stânga
  
 ```VHDL
TYPE matrix IS ARRAY (0 TO 3) OF row;
```

  * Definește o matrice 1Dx1D cu 4 linii definite în linia precedentă
  
 ```VHDL
SIGNAL x: matrix;
```
  * Definește un semnal 1Dx1D de tip matrice, definit în linia precedentă
  
* <b> Exemplu: Matrice 1Dx1D --- metodă alternativă  </b>

 ```VHDL
TYPE matrix IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
```

* <b> Exemplu: Matrice 2D </b>

 ```VHDL
 TYPE matrix2D IS ARRAY (0 TO 3, 7 DOWNTO 0) OF STD_LOGIC;
```
  * Construcția matricii nu este bazată pe vectori, ci numai pe scalari
  * Este o matrice bidimensională de scalari
  


  
  
 
 



  
  


   
  
 
   
       
       
       
     
       
    
       
    

# Tipuri de date VHDL

  ## Ce sunt tipurile de date?

Tipurile de date sunt clasificari ale obiectelor/elementelor/datelor care definesc o posibila mulțime a valorilor pe care obiectele/elementele/datele pot reprezenta.
Exemple de tipuri de date VHDL sunt: ```VHDL integer, bit, std_logic, std_logic_vector```.
 
  ## Tipuri de date predefinite

Tipuri de date predefinite se regasesc in standardele IEEE 1076 (standardul initial a limbajului VHDL - prima verziune era 1076-1987
care a fost revizuit în 1993, 2000, 2002, 2008 si cel mai recent in 2019) și IEEE 1164 (un standard conceput pentru modelarea starilor intr-un circuit digital)
      
![](tipuri_de_date.svg)

  ## Tipuri de date scalare     
  ### Tipuri de date standard (implicit inclus in libraria std)

   * REAL (de la -1.0E38 până +1.0E38)
     * Exemplu:
     ```VHDL
       - constant PI : real := 3.14159;
     ```

  * TIME (de la –2147483647 to +2147483647)
     * Exemplu:
     ```VHDL
       signal time1 : time := 1000.125 ms;
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
       
   * BIT (0,1) 
     * Exemplu:
     ```VHDL
       – SIGNAL x: BIT;
       ```
       
  * BIT_Vector (0, 1)
    * vectori de bit (semnal de grup multi-bit --> folosit pentru a reperezenta magistrale)
    * Exemple
    ```VHDL
    – SIGNAL y: BIT_VECTOR (3 DOWNTO 0);
    – SIGNAL w: BIT_VECTOR (0 TO 7);
    ```

   * Operator de atribuire a semnalului <b><=</b>
```VHDL
      - x <= '1';
      - y <= "0111";
      - w <= "01110001";
```
       
   ### Tipuri de date pentru modelare starilor in circuite digitale (inclus in libraria std_logic_1164) 
   
  * Standardul IEEE 1164 introduce pachetele de logică multiplă (Multivalue Logic - std_logic_1164)
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
  
VISIO 2
  
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

## Tipuri de date tablou (vectori, matrici) 

* Un tablou este mulțimea obiectelor de aceasi tip
* Poate fi unidimensional (1D) sau bidimensional (2D)
* Matrici de dimensiuni mai mari nu pot fi sintentizate

VISIO 3

### Definirea tablourilor in VHDL
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

  * Definește un vector (o matrice 1D) (tip de date) cu șapte valori STD_LOGIC cu MSB (bitul cel mai semnificativ) la stânga
  
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
  
  
 ### Atribuirea valorilor la tablouri
 
 * <b> Definire Tip: </b>
 
 ```VHDL
 TYPE row IS ARRAY (7 DOWNTO 0) OF STD_LOGIC; -- 1D array
TYPE array1 IS ARRAY (0 TO 3) OF row; -- 1Dx1D array
```

* <b> Declarare Semnal: </b>
 
 ```VHDL
SIGNAL x: row;
SIGNAL y: array1;
```

* <b> Atribuire Semnal Scalar (matrice): </b>
 
 ```VHDL
x(0) <= y(1)(2);
```
  * Notăm cele două perechi de paranteze, deoarece y este o matrice 1Dx1D
  

 * <b> Definire Tip: </b>
 
 ```VHDL
TYPE array2 IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
 -- 1Dx1D
TYPE array3 IS ARRAY (0 TO 3, 7 DOWNTO 0) OF STD_LOGIC;
 -- 2D array
```

* <b> Declarare Semnal: </b>
 
 ```VHDL
SIGNAL v: array2;
SIGNAL w: array3;
```

* <b> Atribuire Semnal Scalar: </b>
 
 ```VHDL
x(1) <= v(2)(3);
x(2) <= w(2,1);
```
  * O singură pereche de paranteze, deoarece w este o matrice 2D
  
 ```VHDL
TYPE row IS ARRAY (7 DOWNTO 0) OF STD_LOGIC;
TYPE array1 IS ARRAY (0 TO 3) OF row;
TYPE array2 IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE array3 IS ARRAY (0 TO 3, 7 DOWNTO 0) OF STD_LOGIC;
```

* <b> Declarare Semnal: </b>
 
 ```VHDL
SIGNAL x: row;
SIGNAL y: array1;
SIGNAL v: array2;
SIGNAL w: array3;
```

* <b> Atribuire Semnal Scalar: </b>
 
 ```VHDL
y(1)(1) <= x(6);
y(2)(0) <= v(0)(0);
y(0)(0) <= w(3,3);
w(1,1) <= x(7);
w(3,0) <= v(0)(3);
```

* <b> Atribuire Semnal Vector: </b>
 
 ```VHDL
TYPE row IS ARRAY (7 DOWNTO 0) OF STD_LOGIC;
TYPE array1 IS ARRAY (0 TO 3) OF row;
TYPE array2 IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
TYPE array3 IS ARRAY (0 TO 3, 7 DOWNTO 0) OF STD_LOGIC;
```
* <b> Declarare Semnal: </b>
 
 ```VHDL
SIGNAL x: row;
SIGNAL y: array1;
SIGNAL v: array2;
SIGNAL w: array3;

```

* <b> Atribuiri legale/permise: </b>

 ```VHDL
x <= y(0);
y(1)(7 DOWNTO 3) <= x(4 DOWNTO 0);
v(1)(7 DOWNTO 3) <= v(2)(4 DOWNTO 0);

```

* <b> De ce sunt următoarele atribuiri nepermise/ilegale? </b>
 
 ```VHDL
x <= v(1);
x <= w(2);
x <= w(2, 2 DOWNTO 0);
v(0) <= w(2, 2 DOWNTO 0);
v(0) <= w(2);
y(1) <= v(3);
w(1, 5 DOWNTO 1) <= v(2)(4 DOWNTO 0);
```

## Tipuri de date enumerate



# Operatori VHDL

* Operatori logice

| Operațiune logică        | Operator         | Exemplu  |
| ------------- |:-------------:| -----:|
| ȘI      | AND | Z <= (A AND B;) |
| ȘI-NU      | NAND      |  Z <= (A NAND B;)  |
| SAU-NU | NOR      |   Z <= (A NOR B;) |
| NU | NOT | Z <= NOT (A); |
| SAU| OR | Z <= (A OR B;) |
| SAU-EXCLUSIV NEGAT | XNOR | Z <= (A XNOR B;) |
| SAU-EXCLUSIV | XOR | Z <= (A XOR B;) |

* Operatori aritmetici

| Operațiune aritmetică       | Operator         | Exemplu  |
| ------------- |:-------------:| -----:|
| Adunare      | + | Z <= A + B; |
| Scădere      | -      |  Z <= A - B;  |
| Multiplicare | *      |   Z <= A * B; |
| Divizare | / | Z <= A / B; |
| Exponențiare | ** | Z <= 4 ** 2; |
| Modul | MOD | Z <= A MOD B; |
| Rest | REM | Z <= A REM B; |
| Valoare absolută | ABS | Z <= ABS A; |


* Operatori relaționale
 
| Operațiune relațională       | Operator         | Exemplu  |
| ------------- |:-------------:| -----:|
| Egal cu      | = | If (A = B) Then |
| Nu ese egal cu      | /= |  If (A /= B) Then |
| Mai mic ca |  <    |   If (A < B) Then |
| Mai mic sau egal cu | <= | If (A <= B) Then |
| Mai mare ca | > | If (A > B) Then |
| Mai mare sau egal cu | >= | If (A >= B) Then |

# Cuvinte rezervate VHDL

* Cuvintele rezervate nu pot fi folosite de designer pentru identificatori ca variabile, nume de semnal, etc.

| abs        | file          | of  | then | 
| ------------- |:-------------:| :----:| ---: | 
| after      | for | open | to | 
| all      |      |   or | transport | 
| and | generic     |    others | type | 
| architecture      |  | out |  | 
| array    | if     |    | until | 
|  | in | package | use | 
| begin   | inertial | port | | 
|       | inout    |   process | variable | 
| case | is      |     |  | 
| component      |  | rem | wait | 
| configuration     | library      |   report | when |  
| constant | linkage      |   rol | while | 
|  | loop | ror| with | 
| downto   |  |  | | 
|       | mod    |   select | xnor | 
| else |      |  signal   | xor  | 
| elsif      | nand | sla |  | 
| end     | next      |   sll |  |  
| entity | nor      |   sra |  | 
|  | not     |   srl |  | 

# Tipuri de Date: Subiecte Avansate

* Pachetul std_logic_arith din librăria IEEE
  * Definește tipuri de date SIGNED și UNSIGNED și multiple funcții de conversie de date ca:
    * conv_integer(p), 
    * conv_unsigned(p, b),
    * conv_signed(p, b), and
    * conv_std_logic_vector(p, b).
  * Permit operațiuni aritmetice
  * Conversia de date va fi discutat mai târziu
  
* Pachetele std_logic_signed și std_logic_unsigned din librăria IEEE:

  * Conțin funcții care permit operațiuni cu date STD_LOGIC_VECTOR să fie efectuat ca fiind de tip SIGNED sau UNSIGNED
  

# Tipuri de Date VHDL definite de utilizator

* Tipuri de date întregi (integer) definite de utilizator
  * Subtip al Integer
  * Exemple:
  
 ```VHDL
– TYPE integer IS RANGE -2147483647 TO +2147483647;
– TYPE my_integer IS RANGE -32 TO 32;
– -- A user-defined subset of integers.
– TYPE student_grade IS RANGE 0 TO 100;
– -- A user-defined subset of integers or naturals.
– TYPE natural IS RANGE 0 TO +2147483647;
```

* Tipuri de date ENUMARATED definite de utilizator
  * Tip de date alcătuit de o mulțime de valori numite
  * Exemple:
 
```VHDL
– TYPE bit IS ('0', '1');
– TYPE my_logic IS ('0', '1', 'Z');
- -- BIT predefinit

TYPE bit_vector IS ARRAY (NATURAL RANGE <>) OF BIT;
- -- BIT_VECTOR predefinit
- -- NATURAL RANGE <> indică faptul că singura restricție este că intervalul trebuie sa fie în interiorul lui NATURAL range
```

  * Mai multe exemple:
  
  ```VHDL
-TYPE state IS (idle, forward, backward, stop); 
--Un tip de date ENUMERATED, tipic pentru mașini cu stări finite
```
  * 
    * Folosim doi biți pentru codarea acestei tip de date
    * Valoarea implicită va fi idle
    
 ```VHDL
-TYPE color IS (red, green, blue, white, black);
--Un alt tip de date ENUMERATED
```  

  * 
    * Folosim trei biți pentru codarea acestei tip de date
    * Valorea implicită va fi red (roșu)
    
## Structuri (record)

* Ca și Matricile, recordurile sunt colecții de obiecte
* Spre deosebire de matricile, recordurile pot conține obiecte de diferite tipuri

* Exemplu:

 ```VHDL
TYPE birthday IS RECORD
day: INTEGER RANGE 1 TO 31;
month: month_name; – month_name datatype should be predefined
END RECORD;
``` 

## Tipurile Signed și Unsigned

* Definite în pachetul <b> STD_LOGIC_ARITH </b> din librăria IEEE pentru <b> operații aritmetice </b>
* Exemple de declarare semnal:

 ```VHDL
SIGNAL x: SIGNED (7 DOWNTO 0);
SIGNAL y: UNSIGNED (0 TO 3);
``` 

* Sintaxă similară cu STD_LOGIC_VECTOR și nu cu numere întregi
* O valoare UNSIGNED este un număr care este întotdeauna mai mare ca zero
* De exemplu:
  – Unsigned ‘‘0101’’ = decimalul 5
  – Unsigned ‘‘1101’’ reprezintă 13
  – Signed ‘‘0101’’ = decimalul 5
  – Signed ‘‘1101’’ reprezintă -3 (complementul față de doi)
  
* <b> Exemple de operații </b>

 ```VHDL
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
….........
SIGNAL a: IN SIGNED (7 DOWNTO 0);
SIGNAL b: IN SIGNED (7 DOWNTO 0);
SIGNAL x: OUT SIGNED (7 DOWNTO 0);
SIGNAL u: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL v: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL y: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
…........
x <= a + b; - -legal
x = a AND b; - - ilegal
y = a + b; - - ilegal
y = a AND b; - - legal
``` 

* Pachetele std_logic_signed și std_logic_unsigned permit nu numai operații logice, ci și aritmetice

* Exemplu:

 ```VHDL
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
...
SIGNAL a: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL b: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL x: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
...
v <= a+ b; -- legal
w <= a AND b; -- legal
``` 

# Conversie de tipuri

* Operații directe între diferite tipuri de date sunt ilegale în VHDL 
* Soluția este conversia de date
* Exemple:

 ```VHDL
TYPE long IS INTEGER RANGE -100 TO 100;
TYPE short IS INTEGER RANGE -10 TO 10;
SIGNAL x : short;
SIGNAL y : long;
...
y <= 2*x + 5; -- error, type mismatch
y <= long(2*x + 5); -- OK, result converted into type long
``` 

* Conversia de date definită în STD_LOGIC_ARITH
* conv_integer(p):
  - Convertește un parametru p de tip INTEGER, UNSIGNED, SIGNED sau STD_ULOGIC într-o valoare întreagă (INTEGER)
  - Notăm că STD_LOGIC_VECTOR nu este inclus
  
* conv_unsigned(p, b): 
  - Convertește un parametru p de tip INTEGER, UNSIGNED, SIGNED sau STD_ULOGIC într-o valoare UNSIGNED cu biți de mărime b
  
* conv_signed(p, b):
  - Convertește un parametru p de tip INTEGER, UNSIGNED, SIGNED sau STD_ULOGIC într-o valoare SIGNED cu biți de mărime b
  
* conv_std_logic_vector(p, b): 
  - Convertește un parametru p de tip INTEGER, UNSIGNED, SIGNED sau STD_ULOGIC într-o valoare STD_LOGIC_VECTOR cu biți de mărime b
  
* Exemplu:

 ```VHDL
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
...
SIGNAL a: IN UNSIGNED (7 DOWNTO 0);
SIGNAL b: IN UNSIGNED (7 DOWNTO 0);
SIGNAL y: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
...
y <= CONV_STD_LOGIC_VECTOR ((a+b), 8);
``` 

* a+b este convertit de la UNSIGNED la o valoare STD_LOGIC_VECTOR de 8 biți, apoi atribuit lui y

# Tipuri de date VHDL: Exemple

* <b> Adunător de 4 biți </b>

 ```VHDL
------ Soluția 1: in/out=SIGNED -----------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
------------------------------------------
ENTITY adder1 IS
PORT ( a, b : IN SIGNED (3 DOWNTO 0);
sum : OUT SIGNED (4 DOWNTO 0));
END adder1;
------------------------------------------
ARCHITECTURE adder1 OF adder1 IS
BEGIN
sum <= a + b;
END adder1;
``` 

 ```VHDL
------ Soluția 2: out=INTEGER -----------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
------------------------------------------
ENTITY adder2 IS
PORT ( a, b : IN SIGNED (3 DOWNTO 0);
sum : OUT INTEGER RANGE -16 TO 15);
END adder2;
------------------------------------------
ARCHITECTURE adder2 OF adder2 IS
BEGIN
sum <= CONV_INTEGER(a + b);
END adder2;
``` 
    

# Minimizarea functiilor logice

## Clasificarea metodelor de minimizare

Primul criteriu de clasificare este numarul de nivele in care portile logice sunt orginaziate in urma minimizarii. Asfel avem:

* minimizare pe doua nivele (rezulta o reprezentare tip suma de produs - F(a,b,c) = ab +a'c + b'c')
* minimizare multi-nivel (rezulta o reprezentare cu termen factorizat - F(a,b,c,d) = (a + (b' + (cd)) )

Al doilea criteriu de clasificare priveste module de operare a procedeului de minimizare. Astfel se disting:

* metode tabelare (minimizarea Karnauh)
* metode algebrice (minimizarea Quine-McClusky)
* metode euristice (minimizarea Espresso)

## Minimiarea algebraic (metoda Quine-MCClusky)

Algoritmul Quine-McClusky, denumit si metoda implicantilor primi este o metoda folosita pentru minimizarea funtiilor booleene, dezvoltata de logicianul Willard Van Orman Quine si extinsa de Edward J. McCluskey. Metoda Quine-McClusky este utilizabilǎ, în principiu, pentru minimizarea funcţiilor scalare ori vectoriale cu un numǎr arbitrar de variabile.
Minimizarea are loc în doi paşi:
(1) Generarea mulţimii implicanţilor primi
(2) calculul acoperirii minimale pentru funcţia respectivǎ.

### Determinarea implicanţilor primi

Terminologie: În calculul implicanţilor primi, mintermii funcţiei sunt numiţi implicanţi, sau cuburi, de ordinul 0 ai funcţiei. În timp ce, implicanţii care rezultǎ prin reducerea unei variabile sau a douǎ sau mai multor variabile, sunt implicanţi de ordinul unu, respectiv de ordinul doi ori superior.

Într-o primǎ etapǎ se calculeazǎ pentru fiecare implicant de ordinul 0 al funcţiei ponderea acestuia. Prin ponderea unui implicant se înţelege numǎrul de unitǎţi din reprezentarea binarǎ a respectivului implicant. Astfel, spre exemplu, implicanţii (de ordinul 0), 0101 şi 1101 au ponderea 2, respectiv 3, iar implicanţii -1-1 şi 01-0 au ponderea 2 (ordinul 2), respectiv 1 (ordinul 1). Toţi implicanţii de acelaşi ordin şi având aceeaşi pondere sunt grupaţi în aceiaşi clasǎ. Pe durata calculului implicanţilor primi, implicanţii de ordine diferite, chiar dacǎ au aceiaşi pondere, fac parte din clase distincte. Procesul de calcul al implicanţilor primi începe prin aşezarea implicanţilor iniţiali care au aceeași pondere, într-o aceeaşi clasǎ. Clasele sunt întotdeauna etichetate prin valoarea ponderii implicanţilor lor.

Continuând cu un exemplu, se considerǎ funcţia:

f(A,B,C,D,E) = \{m<sub>0</sub> + m<sub>3</sub> + m<sub>4</sub> + m<sub>7</sub> + m<sub>8</sub> + m<sub>10</sub> + m<sub>11</sub> + m<sub>12</sub> + m<sub>14</sub> + m<sub>15</sub> + m<sub>18</sub> + m<sub>19</sub> + m<sub>23</sub> + m<sub>26</sub> + m<sub>28</sub> + m<sub>29</sub> + m<sub>30</sub> 

Funcţia are 5 variabile care se noteaza : A, B, C, D şi E. 

| Minterm | Implicant (ord 0) | Pondere |
|---------|---------|---------|
| m<sub>0</sub>  | 00000 | 0 |
| m<sub>3</sub>  | 00100 | 1 |
| m<sub>4</sub>  | 01000 | 1 |
| m<sub>7</sub>  | 00111 | 3 |
| m<sub>8</sub>  | 01000 | 1 |
| m<sub>10</sub> | 01010 | 2 |
| m<sub>11</sub> | 01011 | 3 |
| m<sub>12</sub> | 01100 | 2 |
| m<sub>14</sub> | 01110 | 3 |
| m<sub>15</sub> | 01111 | 4 |
| m<sub>18</sub> | de completat| de completat |
| m<sub>19</sub> | de completat| de completat |
| m<sub>23</sub> | de completat| de completat |
| m<sub>26</sub> | de completat| de completat |
| m<sub>28</sub> | de completat| de completat |
| m<sub>29</sub> | de completat| de completat |
| m<sub>30</sub> | de completat| de completat |

Tabel 1. Mintermi, reprezentarea lor binara si ponderea lor


Transcriind şi grupând mintermii în clase se poate începe etapa iterativǎ a procesului de generare a tuturor implicanţilor primi.

|Clase   | Acoperire<br>Implicanti (ord. 0)  |  Imagine binara <br> ABCDE |
|--------|----------|--------|
| 0 | m<sub>0</sub>  | 00000 [x] |
| 1 | m<sub>4</sub> </br>m<sub>8</sub>   | 00100 [x]<br>01000 [x]  |
| 2 | m<sub>3</sub></br>m<sub>10</sub></br>m<sub>12</sub></br>m<sub>18</sub>  | 00011 [x]<br>01010 [x]<br>01100 [x]<br>10010 [x]  |
| 3 | m<sub>7</sub></br>m<sub>11</sub></br>m<sub>14</sub></br>m<sub>19</sub></br>m<sub>26</sub></br>m<sub>28</sub>  |  00111 [x]</br>01011 [x]</br>01110 [x]</br>10011 [x]</br>11010 [x]</br>11100 [x] |
| 4 |  m<sub>15</sub></br>m<sub>23</sub></br>m<sub>29</sub></br>m<sub>30</sub> | 01111 [x]</br>10111 [x]</br>11101 [x]</br>11110 [x]|

Tabel 2. Implicanţii de ordinul 0 ai funcţiei f(A,B,C,D,E) 

Etapa a doua este dedicatǎ gǎsirii implicanţilor de ordin superior (implicanţii rezultaţi prin contopirea a doi implicanţi adiacenţi). Termenii adiacenţi se gǎsesc întotdeauna printre implicanţii de acelaşi ordin din douǎ clase succesive.

Astfel, se va cerceta sistematic adiacenţa termenilor dintre clasa 0 şi clasa 1, apoi adiacenţa dintre termenii claselor 1 şi 2 etc. Se începe ordonat cu implicanţii clasei cu cea mai micǎ pondere, dacǎ aceştia existǎ (clasa 0, spre exemplu, dacǎ aceasta este nevidǎ). Este util de remarcat faptul cǎ, implicanţii clasei 1-a, spre exemplu, sunt cercetaţi mai întâi în raport cu adiacenţa faţǎ de implicanţii clasei 0, iar apoi sunt cercetaţi în raport cu adiacenţa faţǎ de implicanţii clasei a 2-a.

Adiacenţa, este definitǎ, astfel : doi implicanţi sunt adiacenţi dacǎ şi numai dacǎ diferǎ prin valoarea unui singur rang cu valoare binarǎ, în rest cei doi implicanţi fiind identici. Deîndatǎ ce doi implicanţi se dovedesc adiacenţi, este creat un implicant de ordin imediat superior. Implicanţii adiacenţi respectivi sunt, fiecare în parte, marcaţi. Marcajul implicanţilor adiacenţi semnificǎ faptul cǎ ambii au un succesor de ordin superior. Implicantul de ordin imediat superior este stocat într-o clasǎ, cu pondere corespunzǎtoare, de implicanţi de acelaşi ordin. Dacǎ s-au identificat doi implicanţi adiacenţi din clasele a 3-a şi a 4-a, de ordinul 0, se va genera un implicant care va fi din clasa a 2-a, dar de ordinul 1, spre exemplu. Odatǎ încheiat ciclul prin care s-au cercetat implicanţii de ordinul zero se continuǎ cu implicanţii de ordin 1 dacǎ existǎ cel puţin douǎ clase succesive nevide.

Privind tabelul 2, se poate constata  cǎ mintermul m<sub>0</sub> (fǎcând parte din grupa 0, cu nici o unitate) se poate grupa cu mintermul m<sub>4</sub> şi cu mintermul m<sub>8</sub> (care aparţin grupei 1, cu o unitate). Similar, mintermul m<sub>4</sub> (fǎcând parte din grupa cu 1, cu o unitate) se poate grupa cu mintermul m<sub>12</sub> iar mintermul m<sub>8</sub>, din aceeaşi grupǎ cu mintermul m<sub>4</sub>, se poate grupa cu mintermul m<sub>10</sub> şi mintermul m<sub>12</sub> (mintermii m<sub>10</sub> şi m<sub>12</sub> aparţin grupei 2, cu douǎ unitǎţi), etc.

Simbolul [x] inserat în dreapta reprezentării binare a implicanţilor marcheazî implicanţii care au fost incluşi în implicanţii de ordin superior în procesul de generare al acestora. Astfel, atât mintermul m<sub>8</sub> cât şi mintermul m<sub>10</sub>, primesc simbolul [x] în coloana imaginii binare. Se poate remarca faptul cǎ, în tabelul 2, toţi implicanţii de ordinul 0 au asociat simbolul [x] în coloana etichetatǎ prin ABCDE. 

Rezultatele grupǎrilor mintermilor din Tabelul 2 se pot urmǎri în coloanele acorperirilor/implicantilor (de ordin 1) si imaginilor binare din Tabelul 3.

| Clasa | Acoperire <br>Implicanti (ord 1)  | Imagine binara <br> ABCDE |
|---------|---------|---------|
| 0  | 0, 4 <br> 0, 8 | 00-00 [x]<br> 0-000 [x]|
| 1  | 4, 12 <br> 8, 10 <br> 8, 12 | 0-100 [x]<br> 010-0 [x]<br> 01-00 [x]|
| 2  | 3,7<br>3,11<br>3,19<br>10,11<br>10,14<br>10,26<br>12,14<br>12,28<br>18,19<br>18,26 |00–11  [x] <br>0–011 [x] <br>-0011  [x] <br>0101-  [x] <br>01–10  [x] <br>-1010  [x] <br>011–0  [x] <br>-1100  [x] <br>1001 -  [x] <br>1–010  [x]|
| 2  | 7,15<br>7,23<br>11,15<br>14,15<br>14,30<br>19,23<br>26,30<br>28,29<br> 28,30 |0–111  [x] <br>-0111 [x] <br>01–11  [x] <br>0111–  [x] <br>-1110  [x] <br>10–11  [x] <br>11–10  [x] <br>1110-  [ ] <br>111–0  [x] |

Tabel 3. Implicanţii de ordinul 1 ai funcţiei f(A,B,C,D,E) 

Tabelul 3 faciliteazǎ reluarea procesului de grupare dar, de data aceasta, între implicanţii de ordinul 1 (acoperind fiecare doi implicanţi de ordinul 0). Ca şi în tabelul precedent sunt inserate simboluri  [x] în dreapta imaginii binare a unor implicanţi de ordinul 1. Şi în acest caz, aceasta reprezintǎ faptul cǎ respectivii implicanţi au fost incluşi în implicanţii de ordin superior (succesori), respectiv implicanţii de ordinul 2 (tabelul 4). Dar, spre deosebire de tabelul 2, aici în tabelul 3 sunt imagini binare care nu au acest simbol. Respectivele imagini binare descriu implicanţi primi (respectivii implicanţi nu mai pot fi extinşi astfel încât sǎ acopere mai mulţi mintermi).

Tabelul 4 aratǎ cǎ procesul de grupare al implicanţilor din acest exemplu s-a încheiat. Aşa cum este alcǎtuit tabelul 3 nu se mai pot face alte grupǎri între implicanţii de ordinul 2. În consecinţǎ, coloana imaginii binare  nu conţine nici un, simbol [x]. Toţi implicanţii de ordinul 2 sunt primi. Procesul generǎrii mulţimii tuturor implicanţilor primi s-a încheiat.


| Clasa | Acoperire <br>Implicanti (ord 1)  | Imagine binara <br> ABCDE |
|---------|---------|---------|
| 0  | 0,4,8,12<br> 0,8,4,12 | 00-00 [ ]<br> (00-00) [ ]|
| 1  | 8,10,12,14<br> 8,12,10,14 | 01--0 [ ]<br> (01--0) [ ]|
| 1  | 3,7,11,15<br>3,7,19,23 <> br 3,11,7,15 <br> 3,19,7,23 <br> 10,11,14,15 <br> 10,14,26,30 <br> 10,26,14,30 <br> 12,14,28,30 <br>12,28,14,30|  0--11 [ ]<br> -0-11 [ ] <br> (0--11) [ ]<br> (-0-11) [ ]<br> 01-1- [ ]<br> -1-10 [ ]<br> (-1-10) [ ]<br> -11-0 [ ]<br>(-11-0) [ ]|

Tabel 4. Implicanţii de ordinul 2 ai funcţiei f(A,B,C,D,E) 

Parantezele rotunde între care sunt scrişi unii dintre implicanţii de ordinul 2 vin sǎ sublinieze faptul cǎ acei implicanţi se repetǎ urmând sǎ fie consideraţi o singurǎ datǎ.
Din calculul descris succint în tabelele 2, 3 şi 4 se pot determina toţi implicanţii primi ai funcţiei. Aceştia sunt descriptibili, în mod unic, prin mintermii acoperiţi: (18,19), (18,26), (28,29), (0,4,8,12), (8,10,12,14), (3,7,11,15), (3,19,7,23), (10,11,14,15), (10,14,26,30) şi (12,14,28,30).
Implicanţii primi sunt, adesea, ilustraţi şi prin imaginea binarǎ asociatǎ lor. Funcţia scalarǎ poate fi descrisǎ prin suma implicanţilor sǎi primi. Aceasta sumǎ de produse prime nu este minimǎ dar poate fi minimizatǎ:

F(A,B,C,D,E) = AB'C'D + AC'DE' + ABCD' + A'D'E' + A'BE' + A'DE + B'DE + A'BD + BDE' + BCE'.

Pot sǎ existe, în general, multiple variante de obţinere a unei acoperiri minimale care sǎ cuprindǎ mai puţini termeni produs.
Calculul prin care se gǎsesc acoperirile minime iredundante este realizat în cel de-al doilea pas al algoritmului Quine – Mc Cluskey.

### Determinarea acoperirilor prime minime şi minimale.

Matricea, tabelul, de incidenţǎ are câte o coloanǎ pentru fiecare termen canonic al funcţiei, şi câte o linie pentru fiecare implicant prim calculat prin algoritmul precedent.
Este de menţionat un aspect remarcabil legat de termenii canonici neprecizaţi ai funcţiei. Aceştia au fost utilizaţi atunci când s-au generat implicanţii primi, dar nu vor fi consideraţi în problema de acoperire deoarece termenii, pentru care funcţia are valoare neprecizatǎ, nu trebuie acoperiţi. Matricea de incidenţǎ se completeazǎ linie cu linie. Deîndatǎ ce implicantul prim p<sub>i</sub>, corespunzǎtor liniei i din matrice, acoperǎ, sau conţine, termenul canonic m<sub>j</sub> corespunzǎtor coloanei j, elementul matricei a<sub>ij</sub>, este marcat cu simbolul [x] altfel spaţiu. În maniera aceasta sunt marcate toate elementele matricei.

Matricea de incidenţǎ a termenilor canonici şi a implicanţilor primi este alcǎtuitǎ, aşa cum s-a descris anterior şi este prezentatǎ în tabelul 5.

|Implicanti primi \ Termeni canonici | 0 | 3 |4  | 7 |8  |10 |11 |12 |14 | 15 | 18 | 19 | 23 | 26 | 28 | 29 | 30 |
|------------------------------------ |---|---|---|---|---|---|---|---|---|----|----|----|----|----|----|----|----|
|1001-                                |   |   |   |   |   |   |   |   |   |    |[x] |[x] |    |    |    |    |    |
|1-010                                |   |   |   |   |   |   |   |   |   |    |[x] |    |    |[x] |    |    |    |
|1110-                                |   |   |   |   |   |   |   |   |   |    |    |    |    |    |[x] |[x] |    |
|0--00                                |[x]|   |[x]|   |[x]|   |   |[x]|   |    |    |    |    |    |    |    |    |
|01--0                                |   |   |   |   |[x]|[x]|   |[x]|[x]|    |    |    |    |    |    |    |    |
|0--11                                |   |[x]|   |[x]|   |   |   |[x]|   |[x] |    |    |    |    |    |    |    |
|-0-11                                |   |[x]|   |[x]|   |   |   |   |   |    |    |[x] |[x] |    |    |    |    |
|01-1-                                |   |   |   |   |   |[x]|[x]|   |[x]|[x] |    |    |    |    |    |    |    |
|-1-10                                |   |   |   |   |   |[x]|   |   |[x]|    |    |    |    |[x] |    |    |[x] |
|-11-0                                |   |   |   |   |   |   |   |[x]|[x]|    |    |    |    |    |[x] |    |[x] |


Tabelul 6. Matricea de incidenta

Deoarece implicantul prim **1110-** este unicul implicant prim care acoperǎ termenul canonic m<sub>29</sub> acesta este esenţial. Aceasta înseamnǎ cǎ în orice soluţie de acoperire a funcţiei, acest implicant prim este sigur selecţionat. Îndepărtarea din matrice a acestui implicant prim conduce la îndepǎrtarea coloanelor corespunzǎtoare termenilor canonici: m<sub>28</sub> şi m<sub>2</sub>9 acoperiţi de implicantul prim 1110-.

Mai sunt încǎ doi implicanţi primi esenţiali în matrice. Implicantul prim **0--00** este esenţial (a se vedea coloanele corespunzǎtoare mintermilor m<sub>0</sub> şi <sub>m4</sub>). Îndepǎrtarea acestui implicant prim se soldeazǎ cu eliminarea coloanelor corespunzǎtoare mintermilor: m<sub>0</sub> ,m<sub>4</sub> ,m<sub>8</sub>  şi m<sub>12</sub>.

Al treilea implicant prim esenţial este **-0-11** (din cauza coloanei corespunzǎtoare mintermului m<sub>23</sub>). Îndepǎrtarea acestui implicant prim produce eliminarea coloanelor corespunzǎtoare mintermilor: m<sub>3</sub>), m<sub>7</sub>), m<sub>19 </sub>)şi m<sub>23</sub>).

În tabelul 7 este prezentatǎ matricea care rezultǎ dupǎ eliminarea implicanţilor esenţiali şi a termenilor canonici acoperiţi de aceştia. S-a introdus, faţǎ de tabele 2 şi 3, coloana care conţine numǎrul curent al fiecǎrei linii, respectiv indexul liniei. Aceastǎ coloanǎ este menitǎ sǎ faciliteze urmǎrirea comparaţiei dintre liniile matricei dar va fi utilizatǎ şi ulterior în calculul formulei lui Petrick asociat acestei matrice.

|Implicanti primi \ Termeni canonici |10 |11 |14 | 15 | 18 | 26 | 30 |nr crt|
|------------------------------------ |---|---|---|----|----|----|----|------|
|1001-                                |   |   |   |    |**[x]** |    |    |1|
|1-010                                |   |   |   |    |[x] |[x] |    |2|
|01--0                                |**[x]**|   |**[x]**|    |    |    |    |3|
|0--11                                |   |**[x]**|   |**[x]** |    |    |    |4|
|01-1-                                |[x]|[x]|[x]|[x] |    |    |    |5|
|-1-10                                |[x]|   |[x]|    |    |[x] |[x] |6|
|-11-0                                |   |   |**[x]**|    |    |    |**[x]** |7|

Tabelul 7. Matricea de incidenta redusa, dupa eliminiarea implicantilor esentiali

Din tabelul 7 se pot identifica implicantii care sunt acoperiti de alti implicanti, ca urmare nu participa in acoperirea finala. De exemplu:
Linia 1 din matricea redusǎ, prezentatǎ în tabelul 7, corespunzǎtoare implicantului prim 1001-, este dominatǎ de linia 2, a implicantului prim 1-010. Primul implicant, 1001-, este eliminat. 
Linia 5, a implicantului prim 01-1-, dominǎ liniile 4 şi 3, ale implicanţilor 0--11 şi 01--0. Implicanţii primi 0--11 şi 01--0 vor fi eliminaţi din matrice.
Linia 6, a implicantului prim -1-10 dominǎ linia 7, a implicantului -11-0. Acesta din urmǎ, -11-0, va fi eliminat din matrice.
În tabelul 7 liniile dominate din matricea de incidenţǎ redusǎ, sunt marcate în prin subliniere.

Toţi implicanţii eliminaţi, în urma dominanţei altor implicanţi primi, nu vor fi utilizaţi în calculul soluţiilor de acoperire a funcţiei f.
Se poate remarca faptul cǎ, implicanţii eliminaţi (0--11, 01--0, -11-0 şi 1001-) nu mai apar, în actuala matrice, ca fiind implicanţi primi (maximali) din cauza ştergerilor (anterioare) de linii şi coloane din matrice cauzate de extragerea implicanţilor primi esenţiali.


|Implicanti primi \ Termeni canonici |10 |11 |14 | 15 | 18 | 26 | 30 |nr crt|
|------------------------------------ |---|---|---|----|----|----|----|------|
|1-010                                |   |   |   |    |[x] |[x] |    |1|
|01-1-                                |[x]|[x]|[x]|[x] |    |    |    |2|
|-1-10                                |[x]|   |[x]|    |    |[x] |[x] |3|


Tabelul 8. Matricea finala

Implicanţii primi care au mai rǎmas sunt toţi esenţiali, aşa cum se poate remarca din matricea de incidenţǎ finalǎ, prezentatǎ în tabelul 8. Functia minimizata este:

f(A,B,C,D,E) = ABCD' + A'D'E’ + B'DE + BDE' + A'BD + AC'DE'.

### Algortimul lui Patrik

Acest algoritm permite, într-o formulare concisǎ, descrierea construcţiei tuturor soluţiilor peste un, eventual, nucleu ciclic al matricei de incidenţǎ.  
 
Se consideră că termenii canonici unei funcţii f, sunt notaţi prin m<sub>j1</sub>,  m<sub>j2</sub>, m<sub>j3</sub>,... În continuare se cerceteazǎ matricea de incidenţe pe coloane. În maniera aceasta se  pot determina, pentru fiecare termen canonic, corespunzǎtor unei coloane, care sunt implicanţii primi care acoperǎ respectivul termen canonic.


Cu aceşti implicanţi primi, asociaţi unui termen canonic mj, se construieşte o formulǎ Booleanǎ si constituitǎ prin sumarea logicǎ (disjuncţia) implicanţilor primi corespunzǎtori. Aceastǎ formulǎ se mai numeşte şi clauza respectivului minterm. 
Se presupune, spre exemplu, cǎ implicanţii primi p<sub>1</sub>, p<sub>2</sub>, ..., p<sub>k</sub> , acoperǎ termenul canonic m<sub>j1</sub>.  Atunci, clauza ori formula Booleanǎ corespunzǎtoare termenului canonic m<sub>j1</sub> este:

s<sub>j1</sub> = p<sub>1</sub> + p<sub>2</sub> + ... + p<sub>k</sub>.

Explicaţia acestei construcţii rezidǎ în faptul cǎ implicantul prim p<sub>1</sub> sau implicantul  p<sub>2</sub> prim sau … implicantul prim  p<sub>k</sub> acoperǎ, în adevǎr, termenul canonic m<sub>j1</sub>.  Pe de-altǎ parte, trebuie acoperiţi cu implicanţi primi toţi termenii canonici, adicǎ **si** m<sub>j2</sub> **si** m<sub>j3</sub> **si** .... Apare, acum, justificatǎ determinarea expresiei:

X = s<sub>j1</sub> * s<sub>j2</sub> * s<sub>j3</sub>... 

ca furnizoare a tuturor soluţiilor de acoperire pentru matricea de incidenţǎ consideratǎ. Adeseeori sunt necesare soluţii de acoperire ale unei funcţii booleene care sǎ satisfacǎ anumite cerinţe specifice, sau, se cautǎ toate soluţiile cu un anumit cost. Algoritmul lui Petrik poate fi, în acest sens, foarte util. Acest algoritm, în principiu, furnizeazǎ toate soluţiile de acoperire pornind de la setul complet de implicanţi primi. 

#### Exemplu

Pentru funcţia din exemplul anterior, ştiind care sunt implicanţii esenţiali (cei care vor face parte din orice acoperire a funcţiei) se poate calcula care sunt ceilalţi implicanţi primi care pot fi utilizaţi în vederea unor acoperiri minimale. Considerând matricea de incidenţǎ din tabelul 7 (dupǎ îndepǎrtarea implicanţilor primi esenţiali) se pot calcula, rând pe rând, clauzele, termenii sumǎ, din
algoritmului lui Petrik. În acest scop se va folosi ca identificator al implicanţilor primi din tabel, pentru simplificarea expresiilor, indexul ori numǎrul curent al acestora. Astfel se poate determina:

c<sub>10</sub> = {3,5,6}, c<sub>11</sub> = {4,5}, c<sub>14</sub> = {3,5,6,7}, c<sub>15</sub> = {4,5}, c<sub>18</sub> = {1,2}, c<sub>26</sub> = {2,6}, c<sub>30</sub> ={6,7}.

unde prin c<sub>10</sub>, spre exemplu, s-a notat clauza, ori mulţimea implicanţilor primi care acoperǎ termenul canonic m<sub>10</sub>. Se poate remarca un fapt care micşoreazǎ complexitatea calculului, clauzele c<sub>11</sub> şi c<sub>15</sub> sunt identice. Cu ajutorul acestor clauze se alcǎtuieşte expresia formalǎ, formula lui Petrick: 

X =  {3+5+6} * {1+2} * {4+5} * {3+5+6+7} * {2+6} * {6+7}.

Prin efectuarea calculului algebric în expresia anterioarǎ rezultǎ:

X = 642 + 652 + 641 + 651 + 7532 + 76431 + 76531 + 7542 + 752 + 76541 + 7651. 

Aceste grupuri de indici (separate prin +), identificǎ fiecare în parte o soluţie de acoperire alcǎtuitǎ din implicanţii primi respectivi. Astfel, grupul de indici 76431 aratǎ cǎ se poate constitui o acoperire primǎ minimalǎ cu cinci implicanţi primi: f = (-11-0) + (-1-10) + (0- -11) + (01- -0) + (1001-). 

Dintre toate aceste forme, determinate prin metoda lui Petrick în raport cu implicanţii primi din matricea de incidenţǎ redusǎ prin îndepǎrtarea implicanţilor primi esenţiali, doar cinci sunt cu cost minim: 

F = 642 + 652 + 641 + 651 + 752.

Celelalte forme calculate sunt minimale. Se poate remarca prezenţa soluţiei determinate, în urma eliminǎrii liniilor dominate, în lista celor cinci acoperiri cu cost minim. 

### Metoda Quine-McCluskey aplicatǎ funcţiilor scalare având termeni nespecificaţi

Metoda Quine-McCluskey minimizeazǎ reprezentarea oricǎrei expresii Boole-ene. Aceastǎ metodǎ oferǎ o un procedeu sistematic pentru generarea mulţii implicanţilor primi urmatǎ de extragerea soluţiilor minime şi minimale de acoperire prime.

### Determinarea implicanţilor primi

Primul pas al metodei calculeazǎ implicanţii primi prin considerand si termeni nespecificati.

### Determinarea matricii de incidenta

Matricea de incidenţǎ dintre implicanţii primi ai funcţiei şi termenii canonici va cuprinde doar termenii canonici precizaţi, cei neprecizaţi nefiind referiţi. 
 

## Minimizarea euristica

În cazul circuitelor reale, mărimea de ordin a numărul variabilelor de intrare a unei funcţii booleene poate să ajungă la un ordin de 1000 sau și mai mare. Minimizarea euristică nu caută o acoperire minimă, ci o acoperire destul de bună. Minimizarea funcţiilor se face iterativ, prin aplicarea operatorilor de expandare, neredundanţă şi reducere.

Operatori eurisitici:
**Expandare**, acest operator calculează o acoperire primă şi minimală în raport cu conţinerea într-un singur implicant. Implicanţii care formează acoperirea sunt procesaţi rând pe rând. Fiecare implicant care nu este prim este expandat întrun implicant prim, adică este înlocuit printr- -un implicant prim care-l conţine.
**Consecutiv**, toţi implicanţii din acoperire (cei încă ne-procesaţi) care sunt conţinuţi în acest implicant prim sunt îndepărtaţi.
**Irredundant**, are drept acţiune calculul unei acoperiri iredundante. Operatorul alege un subset al implicanţilor astfel încât nici un implicant al acestui subset nu este acoperit de ceilalţi implicanţi din subset.
**Reduce**, este un operator care realizează transformarea unei acoperiri oarecare, într-o acoperire ne-primă dar de aceeaşi cardinalitate cu cea iniţială. Implicanţii sunt procesaţi unul câte unul. Acest operator încearcă să înlocuiască fiecare implicant printr-un altul care este conţinut în acesta, cu condiţia că implicanţii reduşi împreună cu cei rămaşi continuă să acopere funcţia.

Minimizatorul logic Espresso este un utilitar pentru minimizarea functiilor logice pe doua nivele, care foloseste minimizarea euristica. Espresso a fost dezvoltat la IBM de Robert K. Brayton.

### Exemple de utilizare Espresso

Progrmaul Espresso are ca intrare un fisier in care se descrie circuitul ocmbinational dorit. Un atsfel de fisier are formatarea in felul urmator:

```text
# comentariu
.i 4 # variabile de intrare = 4
.o 1 # variabile de iesire = 1
.ilb A B C D # numele variabilelor de intrare
.ob F # numele variabilei de iesire
0 0 0 0   0 # tabelul de adevar, 4 intrari, o iesire
.e # Marcheaza sfarsitul fisierului
```

#### Exemplul 1

|fisierul de intrare | rezultate|
|--------------------|----------
| #exemplu 1 - ex1.txt <br> .i 4 <br> .o 1 <br> .ilb A B C D <br> .ob F <br> 0 0 0 0   0<br> <br> de completat din raportul lui CibuOana0<br>.e | ./espresso.exe ex ex1.txt <br> .i 4 <br> .o 1 <br> .ilb A B C D <br> .ob F <br> .p 2 <br> 100- 1 <br> 011- 1 <br>|

Interpretarea rezultatului:
.p 2 -> Indica faptul ca sunt doi termini in expresia de iesire
100- 1 -> termenul este AB'C'. notatie: B' este B negat
011- 1 -> termenul este  A'BC

Expresia logica este  **F = AB'C' + A'BC**. 

#### Exemplul 2
de completat din raportul lui CibuOana
#### Exemplul 3
de completat din raportul lui CibuOana
#### Exemplul 1
de completat din raportul lui CibuOana

## Link-uri utile - Utilitare (sub windows) pentru minimizare logica:
1. Minimizare euristica pe doua nivele [espresso](http://www.ecs.umass.edu/ece/labs/vlsicad/ece667/links/espresso.html)
2. Minimizare multinivel [ABC](http://www.ecs.umass.edu/ece/labs/vlsicad/ece667/links/abc.html)
3. Minimizare multinivel [mvsis](https://ddd.fit.cvut.cz/Download/mvsis-win.zip)
4. Minimizare multinivel [sis](https://ddd.fit.cvut.cz/Download/sis_DOS.zip)
4. [others](https://ddd.fit.cvut.cz/index.php?page=download)

Instructiuni utilizare [sis](https://user.eng.umd.edu/~gangqu/ToVictoria/tutorial-www_diit_unict_it_introduzione_sis.pdf)

# Referinte 

## Quine-McCluskey

[1]. Dr.Ing.Mat. Ion I. Bucur, "Metoda Quine – McCluskey" - Note de curs [link](http://andrei.clubcisco.ro/cursuri/1pl/cursuri/Metoda%20Quine-McCluskey.pdf)

[2]. Implementarea algoritmului Quine-McCluskey, www.regielive.ro, [link](https://biblioteca.regielive.ro/proiecte/calculatoare/implementarea-algoritmului-quine-mccluskey-24929.html)

[3]. Jiangbo Huang, "Programing implementation of the Quine-McCluskey method for minimization of Boolean expression "[link](https://arxiv.org/ftp/arxiv/papers/1410/1410.1059.pdf)

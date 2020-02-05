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

### Generarea mulţimii implicanţilor primi

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

## Minimizarea euristica

## Link-uri utile - Utilitare (sub windows) pentru minimizare logica:
1. Minimizare euristica pe doua nivele [espresso](http://ramos.elo.utfsm.cl/~lsb/elo211/aplicaciones/aplicaciones/espresso/ESPRESSO%20Logic%20Minimization%20Software.htm)
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

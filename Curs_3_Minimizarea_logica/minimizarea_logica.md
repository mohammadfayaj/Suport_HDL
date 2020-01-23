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

f(A,B,C,D,E) = m<sub>0</sub> + m<sub>3</sub> + m<sub>4</sub> + m<sub>7</sub> + m<sub>8</sub> + m<sub>10</sub> + m<sub>11</sub> + m<sub>12</sub> + m<sub>14</sub> + m<sub>15</sub> + m<sub>18</sub> + m<sub>19</sub> + m<sub>23</sub> + m<sub>26</sub> + m<sub>28</sub> + m<sub>29</sub> + m<sub>30</sub> 

Funcţia are 5 variabile care se noteaza : A, B, C, D şi E. 

| Minterm | ABCDE | Pondere |
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

Tabel 1. Implicanţii de ordinul 0 ai funcţiei f


Transcriind şi grupând mintermii în clase se poate începe etapa iterativǎ a procesului de generare a tuturor implicanţilor primi.

|Clase   | Implicanti (ord. 0)  | ABCDE  |
|--------|----------|--------|
| 0 | 0 | 00000 [x] |
| 1 | 4</br>8  | 00100 [x]<br>01000 [x]  |
| 2 | 3</br>10</br>12</br>18  | 00011 [x]<br>01010 [x]<br>01100 [x]<br>10010 [x]  |
| 3 | 7</br>11</br>14</br>19</br>26</br>28  |  00111 [x]</br>01011 [x]</br>01110 [x]</br>10011 [x]</br>11010 [x]</br>11100 [x] |
| 4 |  15</br>23</br>29</br>30 | 01111 [x]</br>10111 [x]</br>11101 [x]</br>11110 [x]|

Tabel 2. Implicanţii de ordinul 0 ai funcţiei f

Etapa a doua este dedicatǎ gǎsirii implicanţilor de ordin superior (implicanţii rezultaţi prin contopirea a doi implicanţi adiacenţi). Termenii adiacenţi se gǎsesc întotdeauna printre implicanţii de acelaşi ordin din douǎ clase succesive.

Astfel, se va cerceta sistematic adiacenţa termenilor dintre clasa 0 şi clasa 1, apoi adiacenţa dintre termenii claselor 1 şi 2 etc. Se începe ordonat cu implicanţii clasei cu cea mai micǎ pondere, dacǎ aceştia existǎ (clasa 0, spre exemplu, dacǎ aceasta este nevidǎ). Este util de remarcat faptul cǎ, implicanţii clasei 1-a, spre exemplu, sunt cercetaţi mai întâi în raport cu adiacenţa faţǎ de implicanţii clasei 0, iar apoi sunt cercetaţi în raport cu adiacenţa faţǎ de implicanţii clasei a 2-a.

Adiacenţa, este definitǎ, astfel : doi implicanţi sunt adiacenţi dacǎ şi numai dacǎ diferǎ prin valoarea unui singur rang cu valoare binarǎ, în rest cei doi implicanţi fiind identici. Deîndatǎ ce doi implicanţi se dovedesc adiacenţi, este creat un implicant de ordin imediat superior. Implicanţii adiacenţi respectivi sunt, fiecare în parte, marcaţi. Marcajul implicanţilor adiacenţi semnificǎ faptul cǎ ambii au un succesor de ordin superior. Implicantul de ordin imediat superior este stocat într-o clasǎ, cu pondere corespunzǎtoare, de implicanţi de acelaşi ordin. Dacǎ s-au identificat doi implicanţi adiacenţi din clasele a 3-a şi a 4-a, de ordinul 0, se va genera un implicant care va fi din clasa a 2-a, dar de ordinul 1, spre exemplu. Odatǎ încheiat ciclul prin care s-au cercetat implicanţii de ordinul zero se continuǎ cu implicanţii de ordin 1 dacǎ existǎ cel puţin douǎ clase succesive nevide.



## Minimizarea euristica

## Link-uri utile - Utilitare (sub windows) pentru minimizare logica:
1. Minimizare euristica pe doua nivele [espresso](http://ramos.elo.utfsm.cl/~lsb/elo211/aplicaciones/aplicaciones/espresso/ESPRESSO%20Logic%20Minimization%20Software.htm)
2. Minimizare multinivel [ABC](http://www.ecs.umass.edu/ece/labs/vlsicad/ece667/links/abc.html)
3. Minimizare multinivel [mvsis](https://ddd.fit.cvut.cz/Download/mvsis-win.zip)
4. Minimizare multinivel [sis](https://ddd.fit.cvut.cz/Download/sis_DOS.zip)
4. [others](https://ddd.fit.cvut.cz/index.php?page=download)

Instructiuni utilizare [sis](https://user.eng.umd.edu/~gangqu/ToVictoria/tutorial-www_diit_unict_it_introduzione_sis.pdf)

Referinte
[1] Dr.Ing.Mat. Ion I. Bucur, "Metoda Quine – McCluskey" - Note de curs [link](http://andrei.clubcisco.ro/cursuri/1pl/cursuri/Metoda%20Quine-McCluskey.pdf)

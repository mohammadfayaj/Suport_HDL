# Tehnologia digitală
## Criterii de clasificare
### Tehnologie de fabricație
Considerând tehnologia de fabricație se disting două clase mari de circuite digitale: bipolar și MOS. Diferența între aceste circuite este la nivel fizic, având topologii de circuite diferite, tensiuni de lucru diferite. Însă aceeași porți logice se pot implementa în ambele tehnologii. Primele circuite integrate erau realizate folosind tranzistoare bipolare. Tehnologiile bipolare erau de mai multe feluri, familia [ECL](https://en.wikipedia.org/wiki/Emitter-coupled_logic) (Emitter Coupled Logic), [IIL](https://en.wikipedia.org/wiki/Integrated_injection_logic) (Integrated Injection Logic), [TTL](https://en.wikipedia.org/wiki/Transistor%E2%80%93transistor_logic). Familia TTL a avut numeroase sub-variante, optimizate ori pe consum TTL-LS (Low-Power Schottky TTL), TTL-ALS (Advanced Low-power Schottky TTL), ori pe viteză de comutație TTL-S (Schottky TTL). Dezavantajul tehnologiilor bipolare este consumul lor de putere, pierderea datorată curenților de polarizare a tranzistoarelor fiind semnificativă.
Familiile bipolare au fost aproape în totalitate înlocuite de familii cu tranzistoare cu efect de câmp metal-oxid-semiconductor, familiile CMOS11. Iată câteva exemple: familiile AC (Advanced CMOS)/ACT (ACT este compatibil cu nivele logice TTL) și HC (High speed CMOS) /HCT (HCT este compatibil cu nivele logice TTL. Comparativ, circuitele digitale din familia CMOS, prezintă curenți de pierdere a tranzistoarelor CMOS mult mai mici decât curenții în momentul comutării.
Există și o tehnologie hibridă BiCMOS (care combină etaje de intrare CMOS cu impedanța mare, cu ieșiri TTL cu impedanța mică) care a devenit cunoscută ca familia logică ABT (Advanced BiCMOS Technology), sau LVT (Low-Voltage BiCMOS Technology).
Fiecare tehnologie poate fi caracterizează prin: cost, performanță, timp de proiectare, avantaje și dezavantaje. În zilele noastre, CMOS este tehnologia cea mai utilizată pentru fabricarea circuitelor integrate. Principalul motiv în utilizarea ei îl reprezintă
costul redus al tehnologiei.
### Nivelul de integrare
Un alt criteriu de clasificare al circuitelor digitale este densitatea tranzistorilor integrați într-un monolit de siliciu. Conform legii Moore, densitatea tranzistorilor integrați s-a dublat aproximativ din doi în doi ani. Această creștere exponențială a condus
la diferențe semnificative ale circuitelor integrate digitale, vorbindu-se chiar despre generații de integrate în funcție de numărul de tranzistori integrați. Astfel, circuitele digitale au trecut prin trei generații. Prima generație cuprinde nivelele de integrare SSI (Small Scale Integration) (zeci de tranzistori în cip), MSI (Medium Scale Integration) (sute de tranzistori) și LSI (Large Scale Integration) (zeci de mii de tranzistori).
Aceste integrate erau realizate atât cu tranzistori bipolari, cât și cu tranzistori cu efect de câmp. A doua generație erau circuitele VLSI (Very Large Scale Integration) (sute de mii de tranzistori). Pentru a realiza integrarea la scară așa de mare era nevoie ca producătorii să își îmbunătățească precizia liniilor de producție. Trecerea la a doua generație a însemnat că tehnologiile
bipolare și cele bazate pe PMOS-NMOS au fost înlocuite de tehnologia CMOS, care permite în primul rând un consum de putere mai redus decât tehnologiile concurente. A treia generație sunt circuite integrate utilizate în zilele noastre. Un exemplu îl reprezintă
circuitele ULSI (Ultra Large Scale Integration) (1 milion de tranzistori integrați), WSI (Wafer Scale Integration). și 3D-IC (circuite integrate 3D, în care componentele sunt integrate pe 2-3 straturi de siliciu).
### Funcționarea logică
Un clasificator care se uită din punct de vedere a functionarii a sistemelor împarte sistemele digitale în sisteme cu logică cabaltă (dedicată) și logică necablată (de uz general). La rândul lui logica necablată pate fi logică programată sau reconfigurabilă. Exemple pentru sisteme cu logică cablată sunt porțile logice, memoriile, chipuri de interfațare, modem-uri, codec-uri, acceleratoare numerice sau grafice, acceleratoare nuronale, etc.. Acest circuite sunt optimizate pentru o singură funționalitate. Exemple bune pentru sisteme cu logică programată sunt microprocesoarele și microcontrollerele. Aceste sisteme digitale sunt concepute pentru a executa instrucțiuni simple în ordine definit de un proiectant. Exemple pentru circuitele reconfigurabile sunt ariile logice programabile ([FPGA](https://en.wikipedia.org/wiki/Field-programmable_gate_array)) și circuite complexe logice programabile ([CPLD](https://en.wikipedia.org/wiki/Complex_programmable_logic_device)).

![Functionarea logica](https://github.com/botondkirei/Suport_HDL/blob/master/Curs_1/Drawing1.jpg "Functionarea logica")

Funcționarea logică

### Nivele logice
În general, când se vorbește despre circuite digitale, atunci este vorba de circuite care implementeaza funcții logice booleene (adică cu două nivele de adevăr: adevarat și fals) și folosesc baza binară pentru a reprezenta valorile numerice. Însă circuitele digitale  pot implementa și logică cu trei nivele, logice ternară, și să foloseasca alte baza pentru reprezentarea valorilor. 
Notă: primul calculator ENIAC a folosit baza decimală pentru reprezentarea valorilor. 

## Proiectarea sistemelor digitale cu logică cablată su reconfigurabilă

### Metode de proiectare a sistemelor digitale
1. Desenarea schemelor electronice utilizand un editor de circuite electronice (Orcad - Capture CIS)
- Metoda se poate utiliza la circuite cu numar redus de porti/tranzistoare;
- Proiectarea schematica nu faciliteaza verificarea logica a circuitelor.
2. Descrierea structurala/comportamentala a circuitului cu un limbaj de descriere hardware (Hardware Description Language - HDL)
- schemele electrice sunt generate de un program ;
- dupa aparitia limbajelor HDL s-au dezvoltat utiliatare pentru sinteza logica a circuitelor (prin sinteza circuitelor se intelege transformarea descrierii comportamentale intr-o diagrama/schema electrica)
Notă: AMD a introdus in 2019 microprocessorul Epyc Rome cu 32 miliarde de tranzistoare – proiectarea sistemelor cu complexitate ridicata este imposibila fara ajutorul limbajelor HDL

### Uilizarea limbajelor HDL în proiectarea sistemelor digitaleâ
**Ce sunt limbajele HDL?**
Limbaje de nivel inalt orientate pentru descrierea/modelarea sistemelor digitale 
Sunt folosite pentru dezvoltarea/proiectarea sistmelelor ca si limbajele de programare pentru dezvoltarea software-ului
Sunt folosite pentru a scrie modele clare/neambigue in loc de a folosi  scheme electrice sau o limba naturala
**La ce sunt folosite HDL-urile?**
Pentru a modela hardware-ul independent de tehnologia in care urmeaza a fi implementat
Pentru a simula hardware-ul si a compara cu specificatii
Pentru a sintetiza modulele HDL in thenologia in care va fi implementat
**Care sunt cele mai utilizate limbaje HDL?**
*VHDL*: VHSIC Hardware Description Language (Std. IEEE 1076 since 1987)
*Verilog*: limbajul de simulare dezvoltat de Cadence (1985) is standardizat ulterior (Std. IEEE 1364 - 1995)
*SystemC*: o librarie C/C++ folosit pentru modelarea sistemelor digitale

### Stiluri de proiecare

În zilele noastre, cele mai folosite stiluri de proiectare sunt:
1. Full custom IC (complet personalizate):
- Se referă ca „totul”este desenat cu mâna, însă în realitate foarte multe părți sunt realizate folosind proiectarea bazat pe librării standard.
- Sunt folosite în aplicații unde este nevoie de optimizare, de exemplu în microprocesoare, sau în microcontrollere
2. Standard cell IC (bazad pe celule standard)
- Se folosesc cand nu este nevoie de un număr ridicat de bucăți (ca și microprocesorele), însă este nevoie de timp redus de proiectare
- Densitatea de tranzistoare este mai scăzută, și este mai lent decât un IC full-custom.


![Stiluri de proiectare](https://github.com/botondkirei/Suport_HDL/blob/master/Curs_1/Drawing2.jpg "Stiluri de proiectare")

Stiluri de proiectare

### Fluxul de proiectare cu CAD

Pentru a face față complexității ridicate a sistemelor digitale (o complexitate care se crește împreună cu legea lui Moore) este nevoie de o abordare care împarte problema mare în probleme mai mici. Astfel este nevoie și de nivele de abstractizare. Cu parcurgerea nivelurilor de abstractizare, obținem un proiect mai puțin abstract, mai aproape de realitate. În parcurgerea nivelurilor sunt de ajutor aplicațiile de sinteză și de verificare. Un pas de sinteză aduce design-ul mai aproape de realitate, iar un pas de verificare valizează pasukl făcut.

#### Fluxul de proiectare ASIC

##### Sinteză de nivel înalt (High Level Synthesis)
Intrare: O descriere a funcționalității dorite a sistemrului, de obicei scris ca un program, într-un limbaj HDL
Ieșire: structuri le nivelul de transfer a regiștrilor (register transfer level - RTL): automate secvențiale, utnități aritmetico-logică, memorii, magistrale etc.

##### Sinteză logică
Intrare: ecuații booleane, diagramă de stări
Ieșire: un netlist - o listă cu porti utilizate și interconnectarea lor

##### Maparea tehnologică
Intrare: un proiect la nivel de porți independent de tehnologice
Ieșire: un proiect la nivel de porți folsin tehnologia țintă

##### Verificare formală
Intrare: sepcifiicațiile pentru un proiect și implementarea proiectului
Ieșire: se verifică echivalența între specifiație și implementare. Verificare formală însemană că se dovedește echivalența, nu e doar o simulare

##### Generarea tiparului de test (Automatic Test Pattern Generation, ATPG)
Intrare: un proiect la nivel de porți și o listă de defecțiuni prosibile în circuit, care se doresc a fi detectate.
Ieșire: tipari de test, care va face ca circuitul să calculeze un răspuns greșit dacă oricare  dintre defecșiuni este prezent în integratul testat.

##### Estimarea de temporizare (Timing Estimation)
Intrare: un proiect la nivel de porți cu informație de temporizare a porților și firelor utilizate
Ieșire: estimări de întârziere (căt timp ia ca semnalul sș strebate o poartă)


##### Extragerea circuitlui 
Intrare: măști de fabricație, adică geometria layout-ului 
Ieșire: olistă cu erorile DRC, si un netlist extras, cu porțile care cu adevărat sunt implemnetate de măști.

#### Fluxul de proiectare FPGA [PSHDL]

Procesul de proiectare are scopul de a crea cea mai eficientă (din punct de vedere a numărului de porți logice utilizate, a frecvenței de lucru sau a consumului de putere) implementare posibilă ale funcționalităților dorite de client pe o arie logică programabilă. Procesul complet asistat de calculator, se realizează în mai mulți pași, așa cum se poate observa în figura de mai jos.

![Fluxul de proiectare FPGA](https://github.com/botondkirei/Suport_HDL/blob/master/Curs_1/Drawing3.jpg "Fluxul de proiectare FPGA")

Primul pas în acest proces este descrierea logicii dorite a fi implementat pe arii logice. Pasul de **introducere a proiectului (design entry)** se poate face folosind chiar un simplu editor de text. Aceste descrieri de hardware sunt convertite în circuite digitale ce se pot implementa în arii logice. Conversia este realizată prin: *sinteză logică, mapare tehnologică, plasare și rutare*. **Sinteza logică** este este un pas automatizat de programe speciale (sintetizatori logici) care preiau descrierile de sistem, adeseori scrise într-un limbaj HDL, și le transformă într-un netlist (listă de legături) ce conține porți logice și interconectarea lor. Sinteza logică rezultă într-o implementare generală, care nu este optimizată pentru o anumită tehnologie, însă, cunoscând tehnologia țintă, sintetizatorul poate să creeze implementări mai bune. *Maparea tehnologică* este responsabilă pentru implementarea netlist-ului într-o tehnologie țintă. Elementul de bază pentru implementarea logicii pe arii logice este CLB-ul, însă conține și alte resurse dedicate hardware (multiplicatori, memorii, etc). Maparea tehnologică pe FPGA preia netlist-ul generat de sintetizatorul logic și îl descompune în tabele de căutare și alte resurse dedicate. Optimizarea pentru aria ocupată, consumul și frecvența de lucru, se poate realiza în pasul de mapare tehnologică, prin utilizarea economică a resurselor dedicate.
Următorul pas în proces este **plasarea (placement)**. În acestă etapă se aleg componente din FPGA, care sunt folosite pentru realizarea circuitului obținut prin maparea tehnologică. Cât timp maparea tehnologică decide ca o funcție logică să fie implementată cu un CLB, atât timp plasarea alege exact care CLB din FPGA să fie utilizat. Scopul plasării este minimizarea rutelor care leagă diferitele componente prin așezarea apropiată a componentelor care comunică între ele. Acest pas poate optimiza aria ocupată, puterea consumată și timpii de propagare, prin minimizarea lungimilor firelor de interconectare.
**Rutarea (routing)** selectează blocurile de interconectare care vor conecta semnalele între CLB-uri și alte resurse utilizate. Scopul rutării este reducerea timpului de propagare fără a suprasolicita unele canale de rutare. FPGA-urile au un număr fix de fire așezate vertical și orizontal între blocuri, aceasta înseamnă că pot să apară suprapuneri. Suprapunerea apare în cazul în care programul de rutare așază mai multe semnale verticale sau orizontale decât numărul de fire existente în FPGA. Soluționarea suprapunerilor se face prin prioritizarea rutelor, rutele prioritare fiind cele care au timpul de propagare aproape de valoarea permisă. Rutele mai puțin prioritare sunt așezate în alte zone, astfel evitând suprapunerile.
După obținerea rutării, proiectul se poate încărca pe un dispozitiv FPGA. Configurarea FPGA-ului constă în configurarea CLB-urilor (programarea tabelelor de căutare, configurarea setărilor în CLB), a resurselor dedicate și a interconexiunilor. Un proiect odată testat pe un dispozitiv FPGA cu mare probabilitate va funcționa la fel și pe un alt dispozitiv FPGA din aceeași familie. 
**Verificarea** funcționării se face la fiecare pas. *Simularea comportamentală* este rulată folosind descrierile HDL/schematice a circuitului, verificând astfel corectitudinea funcționării logice. *Simularea „post-translate”* va simula circuitul obținut după maparea tehnologică. Deoarece în această fază se cunosc deja parametri de funcționare a blocurilor utilizate, se face o primă aproximare a frecvenței de lucru, a consumului și a ariei ocupate. Simularea cu cea mai mare acuratețe este *simularea „post-place-and-route”* În această fază se cunosc resursele fizice din FPGA, respectiv modul lor de interconectare. Utilizarea FPGA-urilor face posibilă implementarea și lansarea în producție a sistemelor digitale într-un timp foarte scurt și la costuri scăzute.

# Guia de disseny de `bestbeamer`

Aquest document explica l'estat actual de la classe [`bestbeamer.cls`](bestbeamer.cls)
i les convencions de la presentacio [`presentacio.tex`](presentacio.tex). Esta pensat
per a futurs LLMs o col-laboradors humans que hagin de continuar el disseny sense
trencar la identitat visual que s'ha anat construint.

## Objectiu visual

La presentacio es una defensa de TFG en Beamer, en catala, basada conceptualment
en la memoria original i estilisticament resolta dins [`bestbeamer.cls`](bestbeamer.cls).
El resultat busca una combinacio de:

- jerarquia formal de document matematic: definicions, teoremes, proposicions i
  observacions numerades;
- estructura de presentacio: frames breus, llegibles i sense densitat de llibre;
- aparenca propera a `Antibes`: capcalera amb jerarquia de titol, seccio i
  subseccio, mes ampla que el cos de la diapositiva;
- paleta Air Force blue ampliada, substituint la barreja anterior de grisos,
  rosa i blau;
- tipografia fidel a la memoria: NewPX per al cos i matematiques, Cinzel per als
  titols.

El principi general es: **la classe controla el sistema visual; `presentacio.tex`
nomes hauria de compondre contingut i usar els noms semantics de color i entorn**.

## Manteniment de la documentacio

[`DESIGN.md`](DESIGN.md) i [`AGENTS.md`](AGENTS.md) formen part del sistema de
manteniment del projecte. S'han d'actualitzar en la mateixa sessio si es canvia
qualsevol decisio que afecti futurs agents o col-laboradors:

- estructura dels fitxers;
- classe `bestbeamer.cls`;
- paleta o alias semantics de color;
- entorns numerats o colorboxes;
- capcalera, peu, portada o index;
- annexos i recompte de diapositives;
- flux de compilacio i verificacio;
- convencions de creacio de frames.

No cal actualitzar-los per una correccio purament local de text o contingut, si
no canvia cap convencio.

## Arquitectura general

El projecte tambe conte [`guio_defensa.tex`](guio_defensa.tex), un document
`article` separat de la presentacio. Aquest fitxer no controla el disseny
Beamer: serveix com a guio oral de la defensa, organitzat per diapositives i
redactat a partir de [`presentacio.tex`](presentacio.tex) i del contingut ja
incorporat al projecte. No assumeixis que la memoria original o un directori
`chapters/` existeixen en el workspace actual.

`bestbeamer.cls` carrega Beamer amb aquestes opcions base:

```tex
\PassOptionsToClass{aspectratio=169,10pt,t}{beamer}
\LoadClass{beamer}
```

Aixo fixa:

- format panoramis 16:9;
- mida base de 10pt;
- alineacio vertical superior (`t`), que ajuda a controlar frames densos.

La classe carrega els paquets principals:

- `newpxtext`, `newpxmath`: text i matematiques;
- `cinzel`: titols;
- `microtype`: millora optica del text;
- `mathtools`: notacio matematica;
- `booktabs`, `array`, `multirow`, `colortbl`, `tabularx`: composicio de taules;
- `tcolorbox`: caixes de definicions i resultats;
- `tikz`, `pgfplots`: diagrames i grafics;
- `svg`: inclusio de grafics SVG convertits amb Inkscape;
- `appendixnumberbeamer`: annexos sense contaminar la numeracio principal.

No s'ha d'afegir un tema Beamer estandard dins `presentacio.tex`. El tema es
responsabilitat de la classe.

## Relacio amb Antibes

La classe fa:

```tex
\usetheme{Antibes}
```

I despres adapta les peces necessaries. Cal preservar, tant com sigui possible,
la logica d'Antibes, sobretot la capcalera tipus arbre:

- primera franja: titol curt de la presentacio;
- segona franja: seccio actual;
- tercera franja: subseccio actual;
- petits tracos en forma de branca a l'esquerra, no barres baixes ni guions
  improvisats.

La capcalera esta redefinida a `\setbeamertemplate{headline}`. Aquesta redefinicio
conserva la idea d'Antibes pero aplica:

- amplada completa de paper (`\paperwidth`);
- marges laterals propis de capcalera (`\bestheadmargin`);
- tres colors descendents de la paleta Air Force blue;
- separadors fins superior i inferior.

No s'ha de fer que la capcalera comparteixi els marges del cos. Una decisio
important del disseny actual es que:

- el cos usa marges generosos per llegibilitat;
- la capcalera i el peu poden acostar-se mes als extrems.

## Marges i franges

La classe defineix longituds principals per marges i espaiat vertical:

```tex
\newlength{\bestbodymargin}
\newlength{\bestheadmargin}
\newlength{\bestfootmargin}
\newlength{\bestframebarheight}
\newlength{\bestboxtitleleft}
\newlength{\bestboxparpreskip}
\newlength{\bestboxchainpreskip}
\newlength{\bestboxafterskip}
\newlength{\besttakeawaypreskip}
\newlength{\besttakeawayafterskip}
\newlength{\bestsourcepreskip}
\newlength{\bestsourceafterskip}
\newlength{\bestfigurepreskip}
\newlength{\bestfigureafterskip}
\setlength{\bestbodymargin}{9mm}
\setlength{\bestheadmargin}{3.5mm}
\setlength{\bestfootmargin}{4mm}
\setlength{\bestframebarheight}{7.2mm}
\setlength{\bestboxtitleleft}{4pt}
\setlength{\bestboxparpreskip}{8pt}
\setlength{\bestboxchainpreskip}{2pt}
\setlength{\bestboxafterskip}{3pt}
\setlength{\besttakeawaypreskip}{6pt}
\setlength{\besttakeawayafterskip}{4pt}
\setlength{\bestsourcepreskip}{3pt}
\setlength{\bestsourceafterskip}{0pt}
\setlength{\bestfigurepreskip}{0pt}
\setlength{\bestfigureafterskip}{0pt}
```

Usos:

- `\bestbodymargin`: marge esquerre i dret del contingut de frames;
- `\bestheadmargin`: marge intern de la capcalera;
- `\bestfootmargin`: marge intern del peu;
- `\bestframebarheight`: alcada de la franja del titol del frame;
- `\bestboxtitleleft`: sagnat esquerre del titol de les caixes `tcolorbox`
  (`Definicio`, `Propietat`, `Teorema`, etc.);
- `\bestboxparpreskip`: espai abans d'una caixa quan ve despres de text normal;
- `\bestboxchainpreskip`: espai afegit abans d'una caixa quan ve despres d'una
  altra caixa;
- `\bestboxafterskip`: espai despres de cada caixa.
- `\besttakeawaypreskip` i `\besttakeawayafterskip`: aire abans i despres de
  `\besttakeaway{...}`;
- `\bestsourcepreskip` i `\bestsourceafterskip`: aire abans i despres de
  `\bestsource{...}`;
- `\bestfigurepreskip` i `\bestfigureafterskip`: aire global abans i despres
  dels entorns `figure`.

El cos de la diapositiva es configura amb:

```tex
\setbeamersize{text margin left=\bestbodymargin,text margin right=\bestbodymargin}
```

Si una diapositiva queda massa densa, la solucio preferida es crear mes frames,
no reduir agressivament els marges ni la mida de lletra global.

## Paleta de colors

La paleta canonica actual es Air Force blue ampliada:

| Nom | Hex | Us previst |
| --- | --- | --- |
| `bestAirforce700` | `#334B5C` | tinta fosca, capcalera principal, tracos forts |
| `bestAirforce600` | `#476C85` | seccions, accents forts, links |
| `bestAirforce500` | `#5D8AA8` | to central Air Force blue |
| `bestAirforce450` | `#6D96B0` | accent intermedi |
| `bestAirforce400` | `#88A9BF` | accent clar per segones series |
| `bestAirforce300` | `#A2BCCD` | fons de titols de caixes fortes, separadors |
| `bestAirforce250` | `#B1C4D2` | alternativa clara |
| `bestAirforce200` | `#BDCFDB` | blocs i escales intermedies |
| `bestAirforce150` | `#CBD8E2` | titols de definicions |
| `bestAirforce100` | `#D8E2E9` | fons molt clars, barra de titol, peu |

Encara existeixen alguns colors antics (`bestArsenic`, `bestPink`, `bestBlue`,
etc.) per compatibilitat i per si cal comparar amb versions antigues, pero no
s'han d'usar per a nou contingut.

Les regles de taules i arrays (`\toprule`, `\midrule`, `\bottomrule`, `\cmidrule`,
`\hline` i separadors verticals) hereten per defecte `bestAirforce400` via
`\arrayrulecolor`. Per separadors locals mes subtils, usa tons mes clars de la
paleta, com `bestAirforce200`.

### Rols semantics

La classe defineix alias semantics. Cal preferir aquests noms a colors directes:

```tex
\colorlet{bestBoxStrongFrame}{bestAirforce600}
\colorlet{bestBoxStrongTitle}{bestAirforce300}
\colorlet{bestBoxStrongBack}{bestAirforce100!42!white}
\colorlet{bestBoxSoftFrame}{bestAirforce300}
\colorlet{bestBoxSoftTitle}{bestAirforce150}
\colorlet{bestBoxSoftBack}{bestAirforce100!48!white}
\colorlet{bestBoxPlainFrame}{bestAirforce300}
\colorlet{bestBoxPlainTitle}{white}
\colorlet{bestBoxPlainBack}{white}
\colorlet{bestDiagramInk}{bestAirforce700}
\colorlet{bestDiagramMuted}{bestAirforce500}
\colorlet{bestDiagramLight}{bestAirforce100}
\colorlet{bestDiagramMid}{bestAirforce300}
\colorlet{bestDiagramAccentA}{bestAirforce600}
\colorlet{bestDiagramAccentB}{bestAirforce400}
```

La idea es que un canvi futur de paleta es pugui fer tocant aquests alias, no
reescrivint tots els frames.

## Jerarquia cromatica

La jerarquia actual es:

- **Capcalera**: de mes fosc a mes clar:
  - titol: `bestAirforce700`;
  - seccio: `bestAirforce600`;
  - subseccio: `bestAirforce500`.
- **Titol del frame**:
  - text: `bestAirforce700`;
  - fons: `bestAirforce100`.
- **Peu de pagina**:
  - text: `bestAirforce700`;
  - fons: `bestAirforce100`.
- **Resultats forts**:
  - marc lateral: `bestBoxStrongFrame`;
  - fons: `bestBoxStrongBack`;
  - capcalera de caixa: `bestBoxStrongTitle`.
- **Definicions i notacio**:
  - marc lateral mes suau: `bestBoxSoftFrame`;
  - fons clar: `bestBoxSoftBack`;
  - capcalera clara: `bestBoxSoftTitle`.
- **Observacions, exemples i notes**:
  - fons blanc;
  - marc lateral blau clar;
  - aparenca mes discreta.

Aquesta jerarquia es propia de la presentacio: els resultats matematics pesen
mes que les definicions, i les observacions pesen menys que totes dues.

## Tipografia

La classe usa:

- `newpxtext` per al cos;
- `newpxmath` per a matematiques;
- `cinzel` per a titols principals i titols de frame;
- versaletes en els noms opcionals de teoremes, definicions, etc.

Exemple:

```tex
\begin{definition}[Associacio observacional]
  ...
\end{definition}
```

Renderitza com `Definicio 1.1 (ASSOCIACIO OBSERVACIONAL).`

Cal anar amb compte amb paraules com `front-door` i `back-door` dins titols de
frame. Cinzel pot donar formes poc agradables en algunes dobles lletres o guions.
Si cal, forca una part del titol amb font normal:

```tex
\begin{frame}{Criteri {\normalfont\itshape front-door}}
```

## Capcalera

La capcalera es de pantalla completa i esta pensada per recordar Antibes:

```tex
\setbeamertemplate{headline}{...}
```

Elements importants:

- `\insertshorttitle` mostra el titol curt definit a `\title[...]{...}`;
- `\usebeamertemplate{section in head/foot}` mostra la seccio actual;
- `\usebeamertemplate{subsection in head/foot}` mostra la subseccio actual;
- `\ifbeamer@tree@showhooks` controla els tracos jerarquics d'Antibes.

No substituir els tracos per guions baixos, regles llargues o bullets. Una part
important del feedback visual va ser recuperar l'aspecte original d'Antibes.

## Titol de frame

El titol del frame tambe ocupa tot l'ample de paper, pero el text comenca al
marge curt de capcalera i peu, no al marge del cos:

```tex
\setbeamertemplate{frametitle}{...}
```

La franja:

- te alcada fixa `\bestframebarheight`;
- centra verticalment el titol amb una `\vbox`;
- usa `frametitle` com a color Beamer;
- deixa el text del titol alineat amb capcalera i peu mitjancant
  `\bestheadmargin`.

Si un titol queda massa llarg, preferir:

- escurcar-lo;
- usar `\framesubtitle`;
- dividir el contingut en dos frames.

## Peu de pagina

El peu mostra:

```tex
\insertsectionhead
\bestfootnavsymbols
\insertframenumber\,/\,\inserttotalframenumber
```

L'annex usa `appendixnumberbeamer`, de manera que la numeracio principal no hauria
de comptar les diapositives de reserva.

El peu tambe recupera els botons de navegacio classics de Beamer/Antibes,
acolorits amb la paleta Air Force blue. Els botons es defineixen a
`\bestfootnavsymbols` i apareixen a l'esquerra del recompte de pagines.

El peu no ha de competir visualment amb el contingut. S'ha deixat clar i discret.

## Portada i fons `guilloche`

La classe defineix:

```tex
\newcommand{\bestbackgroundfile}{guilloche.pdf}
\newcommand{\besttitlelogofile}{matematiquesinformatica-pos-rgb.png}
\newcommand{\bestrepositoryurl}{https://github.com/mariovilar/TFG}
\newcommand{\bestrepositorylabel}{github.com/mariovilar/TFG}
\newcommand{\bestsetbackground}[1]{\renewcommand{\bestbackgroundfile}{#1}}
\newcommand{\bestsettitlelogo}[1]{\renewcommand{\besttitlelogofile}{#1}}
\newcommand{\bestrepository}[2][github.com/mariovilar/TFG]{...}
\newcommand{\bestbackgroundoverlay}[1][0.10]{...}
\newcommand{\besttitlebackgroundoverlay}{...}
\newcommand{\besttitlemetadata}{...}
```

La portada usa `\besttitlebackgroundoverlay`, amb `guilloche.pdf` mes visible que
a les transicions, buscant un patro subtil de fons tipus document d'identitat. La
mateixa macro incorpora el logo de la Facultat des de
`matematiquesinformatica-pos-rgb.png`, discretament a baix a la dreta.
La macro `\besttitlemetadata` afegeix a baix a l'esquerra l'enllac al repositori
de GitHub i el bloc de llicencia generat amb `\doclicenseThis`.

La classe carrega `doclicense` amb CC BY 4.0 i icona petita:

```tex
\RequirePackage[
  type=CC,
  modifier=by,
  version=4.0,
  imagemodifier=-88x31,
  imageposition=left,
  imagewidth=7.5mm,
  imagedistance=1.8mm,
  hyperxmp=false
]{doclicense}
```

Si cal canviar la llicencia o la disposicio del bloc, consulta abans la
documentacio de `doclicense`: el paquet ja contempla moltes variants de tipus,
modificador, amplada d'imatge i posicio. Evita recrear manualment la logica de
la llicencia si una opcio del paquet ho resol.

Les transicions poden usar `guilloche.pdf` amb baixa opacitat mitjancant
`\bestbackgroundoverlay`. Si algun fitxer no existeix, les macros no fallen:
usen `\IfFileExists`.

Metadades de portada:

```tex
\title[Short title]{Long title}
\subtitle{...}
\author{...}
\advisors{Tutor 1}{Tutor 2}
\institute{...}
\date{\today}
\bestrepository{https://github.com/mariovilar/TFG}
```

La macro `\advisors{...}{...}` nomes desa els noms per a la portada.
`\bestrepository[Etiqueta]{URL}` permet canviar l'etiqueta visible i l'URL del
repo; si s'omet l'etiqueta, es mostra `github.com/mariovilar/TFG`.

La portada esta dins un frame `plain` i la classe Beamer usa alineacio superior
global. Per evitar que quedi enganxada a dalt, la plantilla de portada inclou un
marge vertical inicial explicit. Si es modifica la portada, comprovar-la sempre
renderitzant la primera pagina.

## Index automatic

Despres de la portada hi ha una diapositiva d'index:

```tex
\begin{frame}{Index}
  \tableofcontents[part=1,hideallsubsections]
\end{frame}
```

El document separa la defensa principal i la reserva amb parts:

```tex
\part{Defensa}
...
\appendix
\part{Reserva}
```

Aixo permet que l'index inicial sigui automatic i mostri nomes les seccions de la
defensa principal, sense haver-lo de mantenir manualment ni incloure la reserva.
No substituir-lo per una llista escrita a ma si no hi ha una rao clara.

## Frames de transicio

Per crear una diapositiva de transicio:

```tex
\bestsectionframe{Titol}{Subtitol}
```

Usa el fons `guilloche`, una regla fina i el subtitol en blau. Aquest tipus de
frame ha de ser puntual: inici de blocs grans o abans de l'annex, no abans de cada
subseccio menor.

## Entorns numerats

La classe defineix un comptador propi:

```tex
\newcounter{besttheorem}[section]
```

La numeracio reinicia per seccio:

```tex
1.1, 1.2, 2.1, ...
```

Tots aquests entorns incrementen el mateix comptador:

- `theorem`
- `axiom`
- `prop`
- `proposition`
- `lemma`
- `corollary`
- `property`
- `conjecture`
- `process`
- `problem`
- `algorisme`
- `algorithm`
- `definition`
- `notation`
- `remark`
- `exmp`
- `example`
- `note`

Aixo segueix una logica de sequencia comuna: resultats, definicions i observacions
comparteixen numeracio dins de cada seccio.

`algorismecont` i `algorithmcont` son excepcions deliberades: no incrementen el
comptador, sino que reutilitzen el numero vigent per partir un algorisme llarg
en diversos frames.

### Resultats forts

Usar per resultats matematics, criteris i afirmacions que tenen pes teoric:

```tex
\begin{theorem}[Back-door]
  ...
\end{theorem}

\begin{prop}[Identificabilitat]
  ...
\end{prop}

\begin{axiom}[Composicio]
  ...
\end{axiom}
```

Tenen font superior italica (`fontupper=\itshape`), fons blau molt clar i titol
de caixa mes marcat. El sagnat horitzontal del titol es controla globalment amb
`\bestboxtitleleft`. L'espaiat vertical esta separat semanticament: per obrir
aire entre text i caixa cal tocar `\bestboxparpreskip`; per ajustar cadenes de
caixes consecutives cal tocar `\bestboxchainpreskip` i `\bestboxafterskip`.
Per a `\besttakeaway`, fonts i figures, usa les longituds especifiques de la
seccio de marges en lloc d'afegir `\vspace` manual dins els frames.

### Algorismes i pseudocodi

Els algorismes usen la mateixa jerarquia numerada que els resultats forts, pero
el cos de la capsa va en rodona per facilitar la lectura de pseudocodi. Es poden
obrir tant amb `algorisme` com amb `algorithm`; el segon existeix per poder
adaptar fragments provinents de LaTeX academic sense carregar paquets de flotants.
Quan un algorisme no cap en una sola diapositiva, obre la primera part amb
`algorithm` i les seguents amb `algorithmcont`, que conserva el mateix numero.

```tex
\begin{algorithm}[ID: identificacio de \(p(\yy\mid\doop(\xx))\)]
  \textbf{Entrada:} ...

  \begin{bestpseudo}
    \pseudoline{\textbf{funcio} \(\operatorname{ID}(\YY,\XX,p,\G)\)}
    \pseudoline[1.2em]{\textbf{si} \(\XX=\emptyset\), \textbf{retorna} ...}
    \pseudoline[2.4em]{pas indentat}
  \end{bestpseudo}
\end{algorithm}

\begin{algorithmcont}[ID: continuacio]
  \begin{bestpseudo}[\footnotesize][5]
    \pseudoline[1.2em]{continua amb la linia 6}
  \end{bestpseudo}
\end{algorithmcont}
```

`bestpseudo` crea una llista compacta amb linies numerades. Per defecte usa
`\footnotesize`, que sol ser el minim llegible per pseudocodi en defensa. El
primer argument opcional controla la mida (`\scriptsize`, `\footnotesize`, etc.) i el segon
argument opcional fixa el valor inicial del comptador quan cal continuar un
algorisme en una diapositiva posterior:

```tex
\begin{bestpseudo}[\footnotesize][9]
  \pseudoline[1.2em]{continua amb la linia 10}
\end{bestpseudo}
```

Evita `algorithmic`/`algpseudocode` tret que hi hagi una necessitat real: en
Beamer tendeixen a crear blocs massa densos i menys coherents amb les caixes del
projecte.

### Definicions i notacio

Usar per introduir objectes:

```tex
\begin{definition}[Model causal estructural]
  ...
\end{definition}

\begin{notation}
  ...
\end{notation}
```

Tenen jerarquia intermedia: mes presents que una observacio, menys contundents que
un teorema.

L'espai vertical intern de les capses el decideix la classe, no cada frame. En
particular, `\bestboxdisplayspacing` compacta els displays matematics dins de
`definition`, `theorem`, `prop`, `notation`, `algorithm`, etc. perque hi hagi un
aire semblant per sobre i per sota del contingut. El padding vertical visual es
controla amb `\bestboxinnertop` i `\bestboxinnerbottom`, que per defecte tenen
el mateix valor per mantenir un padding uniforme. Evita compensacions locals com
`\vspace{-...}` abans d'una equacio: si diverses capses tornen a quedar
descompensades, ajusta aquestes macros o `\bestboxdisplayspacing` a
`bestbeamer.cls`.

### Observacions, exemples i notes

Usar per comentaris pedagogics:

```tex
\begin{remark}[Lectura]
  ...
\end{remark}

\begin{example}[Berkeley]
  ...
\end{example}
```

El fons blanc evita que la diapositiva quedi massa carregada.

## Entorns `mock...`

Tambe existeixen:

- `mockdefinition`
- `mocktheorem`
- `mockremark`

Aquests no incrementen el comptador. Serveixen per simular una caixa de tipus
definicio/teorema/observacio sense alterar la numeracio. Usar-los amb moderacio,
per exemple en una slide de reserva o quan es vol una etiqueta visual sense
convertir-la en una peca numerada del relat.

## Missatges principals i fonts

Per remarcar una idea clau:

```tex
\besttakeaway{Les dades necessiten estructura causal.}
```

S'ha d'usar per una frase curta. No convertir-la en un paragraf llarg.
L'aire abans i despres es controla amb `\besttakeawaypreskip` i
`\besttakeawayafterskip`.

Per fonts discretes:

```tex
\bestsource{Pearl, \textit{Causality}}
```

La font queda petita, en italica i alineada a la dreta.
L'espai abans i despres es controla amb `\bestsourcepreskip` i
`\bestsourceafterskip`.

Per enllacos interns discrets entre diapositives:

```tex
\hypertarget{frame:nom-del-frame}{}
...
\bestlinkbutton{frame:nom-del-frame}{Tornar a l'exemple}
```

`\bestlinkbutton` genera un boto petit amb la paleta Air Force blue. Usar-lo
nomes quan l'enllac ajuda realment el relat oral, per exemple per tornar a un
exemple visual anterior. Evitar botons grans o multiples crides dins una mateixa
diapositiva.

## Notacio matematica

La classe defineix la notacio causal frequent a [`bestbeamer.cls`](bestbeamer.cls)
per evitar macros locals disperses dins `presentacio.tex`. Inclou, entre altres:

```tex
\G,\U,\V,\F,\EE,\X,\M
\XX,\xx,\YY,\yy,\ZZ,\zz,\WW,\ww,\vvv
\doop,\E,\Var,\indep,\nindep
```

Si una diapositiva recupera notacio de la memoria i falta una macro general,
afegir-la a aquest bloc de la classe en comptes de definir-la localment al frame.

## Diagrames TikZ

`presentacio.tex` defineix estils TikZ globals:

```tex
\tikzset{
  causal node/.style={...},
  causal arrow/.style={...},
  confounding/.style={...},
  flow box/.style={...}
}
```

Per diagrames causals:

```tex
\node[causal node] (x) {$X$};
\node[causal node,right=of x] (y) {$Y$};
\draw[causal arrow] (x) -- (y);
```

Per confusio no observada:

```tex
\draw[confounding] (x) to[bend left=35] (y);
```

Per C-components, C-arbres i C-boscos, seguir el patró de la secció
`Algorismes ID i IDC`: nodes dins del conjunt ressaltats amb tons clars de la
paleta Air Force blue, arestes bidirigides discontinues en `bestDiagramMuted` i
una caixa de component feta amb `fit` dins d'`on background layer`. Els nodes
externs al conjunt han de quedar blancs o en to muted, no amb un color competidor.

Per processos o recorreguts:

```tex
\node[flow box] (scm) {Models causals\\estructurals};
```

Normes:

- usar `bestDiagram...` i `bestAirforce...`, no grisos antics;
- evitar mes de dues intensitats fortes en un mateix dibuix;
- fer els nodes prou grans per a lectura projectada;
- preferir diagrames simples a figures massa literals de la memoria.

## PGFPlots i grafics

Els grafics han de seguir la mateixa paleta:

- eixos: `bestDiagramMuted`;
- graella: `bestDiagramMid`;
- serie principal: `bestAirforce500` amb contorn `bestAirforce700`;
- serie secundaria: `bestAirforce400` amb contorn `bestAirforce600`.

Evitar colors externs no definits a la classe. Si cal una tercera serie, usar
`bestAirforce300` o `bestAirforce450`, comprovant el contrast.

## SVG externs

La classe carrega `svg` amb Inkscape configurat a `/opt/homebrew/bin/inkscape`.
Aixo permet incloure recursos vectorials com:

```tex
\includesvg[width=.45\linewidth]{res/rainfall}
```

Convencions:

- recolorir el fitxer SVG font amb la paleta Air Force blue abans d'incloure'l;
- no usar `inkscape=force` en el document normal, perque pot fer que `latexmk`
  no estabilitzi les passades;
- ajustar sempre `width` o `height` al context del frame, especialment dins
  `minipage`;
- si es canvia la mida fisica interna d'un SVG, compilar una vegada amb
  conversio habilitada i revisar visualment el resultat;
- el frame `Correlacio no implica causalitat` usa `res/rainfall.svg` com a
  exemple autonom de correlacio espuria, recolorit amb `bestAirforce500`,
  `bestAirforce700`, `bestAirforce400` i `bestAirforce100`;
- en aquest frame, `res/rainfall.svg` s'inclou amb `inkscapelatex=false` perque
  les mides internes dels textos de l'SVG, especialment els ticks dels eixos,
  es respectin en lloc d'heretar totes la mateixa mida de LaTeX.

Com que `svg` executa Inkscape, la compilacio canonica necessita
`-shell-escape`.

## Com crear un nou frame

Estructura recomanada:

```tex
\section{Bloc gran}
\subsection{Idea local}

\begin{frame}{Titol curt}
  \small
  \begin{definition}[Nom]
    Text breu, amb una sola idea matematica.
  \end{definition}

  \vspace{2mm}
  \begin{columns}[T,onlytextwidth]
    \begin{column}{.48\textwidth}
      ...
    \end{column}
    \begin{column}{.48\textwidth}
      ...
    \end{column}
  \end{columns}

  \besttakeaway{Una frase final que es pugui recordar.}
\end{frame}
```

Bones practiques:

- una idea central per frame;
- si apareixen dues caixes grans, considerar dividir el frame;
- usar `\small` quan hi ha definicions o formules;
- deixar `\vspace{2mm}` o similar entre blocs;
- no omplir fins al limit inferior: el peu necessita aire visual.

## Control d'espai

Els problemes d'overflow vertical han estat una preocupacio recurrent. Abans de
reduir mida de lletra:

1. Divideix el frame en dos.
2. Mou derivacions o detalls a reserva.
3. Converteix paragraf llarg en bullets curts.
4. Redueix la figura, no els marges globals.
5. Usa `\scriptsize` nomes per fonts, llegendes o taules petites.

Evitar:

- `\vspace` negatius grans;
- `\resizebox{\textwidth}{!}{...}` per a text corrent;
- caixes amb paragraf massa llarg;
- usar `allowframebreaks`, que dona aspecte de document, no de defensa.
  L'excepcio prevista es el frame de bibliografia dins la reserva.

## Annex i reserva

Les diapositives de reserva han d'anar despres de:

```tex
\appendix
```

Gracies a `appendixnumberbeamer`, el recompte principal queda separat. Quan es
verifiqui el PDF, comprovar que el peu mostra el total de la part principal i que
les reserves no distorsionen el ritme de la defensa.

La bibliografia viu tambe a la reserva. `presentacio.tex` carrega:

```tex
\addbibresource{res/bibl.bib}
```

I el frame corresponent usa:

```tex
\nocite{*}

\begin{frame}[allowframebreaks]{Bibliografia}
  \scriptsize
  \setlength{\bibitemsep}{2pt}
  \printbibliography[heading=none]
\end{frame}
```

La classe carrega `biblatex` amb `backend=biber`, `style=authoryear`,
`sorting=nyt` i `dashed=false`, a mes de `xurl` per tallar URLs llargues i
`csquotes` amb estil catala declarat explicitament. `dashed=false` es
intencional: evita que entrades consecutives amb el mateix autor es mostrin com
`--- (any)`. `\cite{clau}` produeix una cita parentetica
autor-any en blau, amb coma entre nom i any: `(Hume, 1975)`. En les entrades
bibliografiques, el blau queda reservat per als autors i el text clicable de
URL/DOI; titols, publicacio, dates, pagines i notes han de quedar en tinta
normal. La icona Beamer de cada entrada esta desactivada. El fitxer
`res/bibl.bib` no ha de contenir camps `annotation`; si reapareixen, eliminar-los
en comptes de renderitzar-los.

## Compilacio

Comanda canonica:

```bash
latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -outdir=build presentacio.tex
```

Comprovacions recomanades:

```bash
rg -n "Overfull|Undefined control sequence|LaTeX Warning:.*undefined|Fatal|Error" build/presentacio.log
```

Un `rg` sense sortida en aquesta comprovacio es bona senyal.

Per inspeccio visual, renderitzar pagines representatives:

```bash
pdftoppm -png -f 2 -singlefile -r 160 build/presentacio.pdf /tmp/presentacio-p02
```

Mirar especialment:

- portada;
- un frame amb dues caixes;
- un frame amb teorema;
- un diagrama causal;
- un grafic PGFPlots;
- primera diapositiva de reserva.

## VS Code

La configuracio de LaTeX Workshop ha d'apuntar al document actiu o a
`presentacio.tex`, no a un `main.tex` inexistent a l'arrel. Si es toca
`.vscode/settings.json`, mantenir el flux compatible amb:

```bash
latexmk -pdf -shell-escape -outdir=build presentacio.tex
```

## Que no s'ha de tocar sense motiu

- No reincorporar ni importar directament capitols complets de la memoria
  original: solen ser massa densos i tenen entorns de llibre.
- No recrear un directori `chapters/` nomes per canviar la presentacio; fes els
  canvis dins `presentacio.tex`, `guio_defensa.tex` o els recursos locals que
  pertoquin.
- No substituir `Antibes` per un tema Beamer diferent.
- No reintroduir la barra amb gradient rosa-blau.
- No canviar la paleta a grisos si no hi ha una decisio explicita.
- No afegir logotips institucionals si no existeixen recursos locals adequats.

## Checklist per canvis futurs

Abans de donar una modificacio per bona:

- compila amb `latexmk`;
- revisa el log amb `rg`;
- renderitza algunes pagines;
- comprova que no hi ha text solapat;
- comprova que la capcalera mante la jerarquia d'Antibes;
- comprova que els colors nous usen alias semantics;
- comprova que les reserves no entren al recompte principal;
- comprova que les matematiques son llegibles projectades.

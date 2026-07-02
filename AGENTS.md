# Notes per a agents

Aquest projecte conte una presentacio Beamer per a una defensa de TFG. Abans de
fer canvis visuals o estructurals, llegeix [`DESIGN.md`](DESIGN.md): es la guia
canonica de la classe [`bestbeamer.cls`](bestbeamer.cls), la paleta, les caixes,
els diagrames i les convencions de frames.

## Manteniment de documentacio

Actualitza aquest fitxer i [`DESIGN.md`](DESIGN.md) en la mateixa sessio si fas
canvis que afecten el que un futur agent ha de saber: estructura de fitxers,
classe Beamer, paleta, entorns, flux de compilacio, index, annexos, convencions
de frames o decisions visuals. Si el canvi es nomes contingut local d'una
diapositiva i no altera cap convencio, no cal tocar la documentacio.

## Fitxers importants

- [`presentacio.tex`](presentacio.tex): document principal de la defensa.
- [`guio_defensa.tex`](guio_defensa.tex): guio oral de la defensa, organitzat
  per diapositives i construit progressivament a partir de la presentacio i del
  contingut ja incorporat al projecte.
- [`bestbeamer.cls`](bestbeamer.cls): classe Beamer custom. Aqui viu el sistema
  visual.
- [`res/bibl.bib`](res/bibl.bib): base bibliografica carregada amb `biblatex`.
  No ha de contenir camps `annotation`.
- [`res/rainfall.svg`](res/rainfall.svg): grafic SVG recolorit amb la paleta
  Air Force blue i inclos amb `\includesvg`.
- [`DESIGN.md`](DESIGN.md): documentacio detallada del disseny actual.
- [`guilloche.pdf`](guilloche.pdf): patro de fons de portada i transicions.
- [`matematiquesinformatica-pos-rgb.png`](matematiquesinformatica-pos-rgb.png):
  logo de la Facultat per a la portada.
- [`build/presentacio.pdf`](build/presentacio.pdf): PDF generat.

## Regles de treball

- No assumeixis que la memoria original o el directori `chapters/` existeixen en
  aquest workspace; treballa amb `presentacio.tex`, `guio_defensa.tex` i els
  recursos locals disponibles.
- Aquest directori pot no contenir metadades `.git`; si `git status` falla,
  revisa l'estat real amb `rg --files`, `find` i comprovacions locals.
- No canviis el tema base `Antibes` per un altre tema Beamer.
- No reintrodueixis Copenhagen/Antibes des de `presentacio.tex`; la classe ja
  controla el tema.
- La paleta actual es Air Force blue.
- Evita colors directes dins els frames. Usa els alias de `bestbeamer.cls`:
  `bestDiagram...`, `bestBox...`, `bestAirforce...`.
- Si un frame queda dens, crea mes frames. No sacrifiquis marges ni llegibilitat.
- No deixis frames amb text solapat o overflow vertical visible.
- Per ajustar aire entre text, caixes, `\besttakeaway`, fonts i figures, toca
  les longituds globals de [`bestbeamer.cls`](bestbeamer.cls) documentades a
  [`DESIGN.md`](DESIGN.md), no afegeixis `\vspace` manual com a solucio general.

## Estil actual

La presentacio usa:

- Beamer 16:9, 10pt, alineacio superior;
- `Antibes` amb capcalera tipus arbre;
- titols de frame alineats amb el marge curt de capcalera/peu;
- peu amb botons de navegacio Beamer/Antibes acolorits amb la paleta;
- portada amb patro `guilloche.pdf` visible, logo de la Facultat, enllac al
  repositori i bloc `doclicense`;
- NewPX per al text i matematiques;
- Cinzel per als titols;
- taules amb `booktabs`, `array`, `multirow`, `colortbl` i `tabularx` carregats
  per la classe; les regles de taules i arrays hereten `bestAirforce400`;
- paleta Air Force blue ampliada:
  `#334B5C`, `#476C85`, `#5D8AA8`, `#6D96B0`, `#88A9BF`,
  `#A2BCCD`, `#B1C4D2`, `#BDCFDB`, `#CBD8E2`, `#D8E2E9`;
- entorns numerats de definicions, teoremes, proposicions, observacions, etc.
- bibliografia amb `biblatex`/`biber`, estil `authoryear`, dins la reserva;
  `dashed=false` es intencional perque mai se substitueixi un autor repetit per
  una ratlla.
- inclusio de SVG amb el paquet `svg`; requereix `-shell-escape` i Inkscape
  disponible a `/opt/homebrew/bin/inkscape`.
- `doclicense` es carrega a [`bestbeamer.cls`](bestbeamer.cls) per la portada;
  abans de canviar la llicencia o el layout, consulta [`DESIGN.md`](DESIGN.md)
  i la documentacio del paquet.

La capcalera i el peu tenen marges mes estrets que el cos. Aixo es intencional.

## Crear contingut nou

Estructura recomanada:

```tex
\section{Bloc}
\subsection{Idea}

\begin{frame}{Titol curt}
  \small
  \begin{definition}[Nom]
    ...
  \end{definition}

  \vspace{2mm}
  ...

  \besttakeaway{Missatge principal.}
\end{frame}
```

Usa:

- `definition` i `notation` per conceptes;
- `theorem`, `axiom`, `prop`, `lemma`, `corollary` per resultats forts;
- `remark`, `example`, `note` per lectures pedagogiques;
- `mockdefinition`, `mocktheorem`, `mockremark` nomes quan calgui una caixa no
  numerada;
- `\bestsource{...}` per fonts discretes;
- `\bestlinkbutton{target}{Text}` per enllacos interns discrets entre frames;
- `\bestsectionframe{Titol}{Subtitol}` per transicions.
- `algorithm`/`algorisme` amb `bestpseudo` i `\pseudoline` per pseudocodi
  numerat; usa `algorithmcont`/`algorismecont` per continuar el mateix algorisme
  en un altre frame sense incrementar el comptador. No carreguis
  `algorithmic`/`algpseudocode` sense una necessitat clara.
- L'espai intern de displays dins de capses es governa amb
  `\bestboxdisplayspacing` a `bestbeamer.cls`; el padding uniforme de text es
  governa amb `\bestboxinnertop` i `\bestboxinnerbottom`. Evita
  `\vspace{-...}` locals dins de definicions/proposicions; si cal mes o menys
  aire, canvia la classe i actualitza `DESIGN.md`.

## Diagrames

Els estils TikZ base estan a `presentacio.tex`:

- `causal node`
- `causal arrow`
- `confounding`
- `flow box`

No facis diagrames en grisos antics. Usa `bestDiagramInk`, `bestDiagramMuted`,
`bestDiagramLight`, `bestDiagramMid`, `bestDiagramAccentA` i
`bestDiagramAccentB`.
Per C-components/C-arbres/C-boscos, els conjunts ressaltats es fan amb `fit` en
`on background layer`; les bidirigides van discontinues en `bestDiagramMuted` i
els nodes externs queden blancs o muted.

## Compilacio i verificacio

Comanda principal:

```bash
latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -outdir=build presentacio.tex
```

Comprova el log:

```bash
rg -n "Overfull|Undefined control sequence|LaTeX Warning:.*undefined|Fatal|Error" build/presentacio.log
```

Si hi ha canvis visuals, renderitza algunes pagines i revisa-les:

```bash
pdftoppm -png -f 2 -singlefile -r 160 build/presentacio.pdf /tmp/presentacio-p02
```

Cal mirar contrast, marges, capcalera Antibes, caixes i possibles solapaments.

## Context de disseny

Decisions que venen de converses anteriors:

- la presentacio no ha d'importar la memoria sencera;
- pot tenir mes de 15 diapositives si aixo evita saturacio;
- la portada va seguida d'un index automatic generat amb `\tableofcontents`;
- les definicions i resultats han de ser reals i numerats, no caixes buides;
- els titols `front-door` i `back-door` poden necessitar font normal o italica
  normal per evitar formes estranyes amb Cinzel;
- la capcalera ha de conservar els tracos jerarquics d'Antibes;
- els titols de frame han d'anar centrats verticalment dins la seva franja;
- l'annex/reserva no ha de contaminar el recompte principal.

Per detalls mes fins, consulta sempre [`DESIGN.md`](DESIGN.md).

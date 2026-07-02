# Defensa TFG

## Català

Presentació Beamer per a la defensa del Treball de Final de Grau
**Models causals estructurals i resultats potencials**.

El document principal és [`presentacio.tex`](presentacio.tex), construït amb la
classe personalitzada [`bestbeamer.cls`](bestbeamer.cls). La guia canònica del
sistema visual és [`DESIGN.md`](DESIGN.md).

### Fitxers principals

- [`presentacio.tex`](presentacio.tex): presentació de la defensa.
- [`bestbeamer.cls`](bestbeamer.cls): classe Beamer, tema Antibes adaptat,
  paleta Air Force blue, entorns numerats i macros visuals.
- [`res/bibl.bib`](res/bibl.bib): bibliografia carregada amb `biblatex`.
- [`res/rainfall.svg`](res/rainfall.svg): gràfic SVG inclòs amb `\includesvg`.
- [`guilloche.pdf`](guilloche.pdf): patró de fons de portada i transicions.
- [`matematiquesinformatica-pos-rgb.png`](matematiquesinformatica-pos-rgb.png):
  logo institucional de la portada.
- [`LICENSE.md`](LICENSE.md): llicència d'ús del projecte.

### Compilació

La comanda canònica és:

```bash
latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -outdir=build presentacio.tex
```

La inclusió SVG requereix `-shell-escape` i Inkscape disponible a:

```text
/opt/homebrew/bin/inkscape
```

Per revisar errors o avisos rellevants:

```bash
rg -n "Overfull|Undefined control sequence|LaTeX Warning:.*undefined|Fatal|Error" build/presentacio.log
```

### Disseny

Abans de fer canvis visuals o estructurals, llegeix [`DESIGN.md`](DESIGN.md).
La classe controla el sistema visual; `presentacio.tex` hauria de compondre
contingut i usar els àlies semàntics de color i entorn.

### Llicència

Aquesta presentació i la documentació del projecte es distribueixen sota
Creative Commons Reconeixement-NoComercial-SenseObraDerivada 4.0 Internacional
(CC BY-NC-ND 4.0). La mateixa variant queda declarada a `bestbeamer.cls` amb
`doclicense`.

## English

Beamer presentation for the Bachelor's Thesis defence
**Structural causal models and potential outcomes**.

The main document is [`presentacio.tex`](presentacio.tex), built with the custom
class [`bestbeamer.cls`](bestbeamer.cls). The canonical visual design guide is
[`DESIGN.md`](DESIGN.md).

### Main Files

- [`presentacio.tex`](presentacio.tex): defence presentation.
- [`bestbeamer.cls`](bestbeamer.cls): Beamer class, adapted Antibes theme,
  Air Force blue palette, numbered environments, and visual macros.
- [`res/bibl.bib`](res/bibl.bib): bibliography loaded with `biblatex`.
- [`res/rainfall.svg`](res/rainfall.svg): SVG chart included with `\includesvg`.
- [`guilloche.pdf`](guilloche.pdf): background pattern for the title slide and
  transition slides.
- [`matematiquesinformatica-pos-rgb.png`](matematiquesinformatica-pos-rgb.png):
  institutional logo for the title slide.
- [`LICENSE.md`](LICENSE.md): project usage license.

### Compilation

The canonical command is:

```bash
latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -outdir=build presentacio.tex
```

SVG inclusion requires `-shell-escape` and Inkscape available at:

```text
/opt/homebrew/bin/inkscape
```

To check relevant errors or warnings:

```bash
rg -n "Overfull|Undefined control sequence|LaTeX Warning:.*undefined|Fatal|Error" build/presentacio.log
```

### Design

Before making visual or structural changes, read [`DESIGN.md`](DESIGN.md). The
class controls the visual system; `presentacio.tex` should compose content and
use the semantic aliases for colors and environments.

### License

This presentation and the project documentation are distributed under Creative
Commons Attribution-NonCommercial-NoDerivatives 4.0 International
(CC BY-NC-ND 4.0). The same variant is declared in `bestbeamer.cls` with
`doclicense`.

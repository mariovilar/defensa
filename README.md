# Defensa TFG

Presentacio Beamer per a la defensa del Treball de Final de Grau
**Models causals estructurals i resultats potencials**.

El document principal es [`presentacio.tex`](presentacio.tex), construit amb la
classe custom [`bestbeamer.cls`](bestbeamer.cls). La guia canonica del sistema
visual es [`DESIGN.md`](DESIGN.md).

## Fitxers principals

- [`presentacio.tex`](presentacio.tex): presentacio de la defensa.
- [`bestbeamer.cls`](bestbeamer.cls): classe Beamer, tema Antibes adaptat,
  paleta Air Force blue, entorns numerats i macros visuals.
- [`res/bibl.bib`](res/bibl.bib): bibliografia carregada amb `biblatex`.
- [`res/rainfall.svg`](res/rainfall.svg): grafic SVG inclos amb `\includesvg`.
- [`guilloche.pdf`](guilloche.pdf): patro de fons de portada i transicions.
- [`matematiquesinformatica-pos-rgb.png`](matematiquesinformatica-pos-rgb.png):
  logo institucional de la portada.
- [`LICENSE.md`](LICENSE.md): llicencia d'us del projecte.

## Compilacio

La comanda canonica es:

```bash
latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -outdir=build presentacio.tex
```

La inclusio SVG requereix `-shell-escape` i Inkscape disponible a:

```text
/opt/homebrew/bin/inkscape
```

Per revisar errors o avisos rellevants:

```bash
rg -n "Overfull|Undefined control sequence|LaTeX Warning:.*undefined|Fatal|Error" build/presentacio.log
```

## Disseny

Abans de fer canvis visuals o estructurals, llegeix [`DESIGN.md`](DESIGN.md).
La classe controla el sistema visual; `presentacio.tex` hauria de compondre
contingut i usar els alias semantics de color i entorn.

## Llicencia

Aquesta presentacio i la documentacio del projecte es distribueixen sota
Creative Commons Reconeixement-NoComercial-SenseObraDerivada 4.0 Internacional
(CC BY-NC-ND 4.0). La mateixa variant queda declarada a `bestbeamer.cls` amb
`doclicense`.

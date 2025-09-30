## Latex Setup 

- Must install required dependency - https://www.tug.org/mactex/ . Once install done , open “Tex Live” , it will then update/install `latexmk`
- Install - https://github.com/WGUNDERWOOD/tex-fmt

 ```
cargo install tex-fmt
```

- Must add the the texbin to PATH & restart VSCode and computer - `export PATH="/Library/TeX/texbin:$PATH"` to `.zshrc` .. For me, restarting vscode alone did not work. But restarting laptop worked

## Vscode 

- Install Latex Workshop plugin for VsCode - https://github.com/James-Yu/LaTeX-Workshop
- Update Config - 

```
       "latex-workshop.latex.tools": [
        {
            "name": "latexmk",
            "command": "/Library/TeX/texbin/latexmk",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "-pdf",
                "-lualatex",
                "-outdir=%OUTDIR%",
                "%DOC%"
            ]
        },
        {
            "name": "lualatex",
            "command": "/Library/TeX/texbin/lualatex", // <--- THE NEW COMMAND
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "-output-directory=%OUTDIR%",
                "%DOC%"
            ]
        },
        {
            "name": "bibtex",
            "command": "/Library/TeX/texbin/bibtex",
            "args": [
                "%DOCFILE%"
            ]
        },
        {
            "name": "makeindex",
            "command": "/Library/TeX/texbin/makeindex",
            "args": [
                "%DOCFILE%.idx"
            ]
        }
    ],
    "latex-workshop.latex.recipes": [
        {
        "name": "latexmk 🔃",
        "tools": ["latexmk"]
        },
        {
            "name": "LuaLaTeX ⚙️",
            "tools": ["lualatex"]
        },
        {
            // A recipe for documents with a bibliography (like your existing pdflatex one)
            "name": "LuaLaTeX ➞ bibtex ➞ LuaLaTeX × 2",
            "tools": ["lualatex", "bibtex", "lualatex", "lualatex"]
        }
    ],
    "latex-workshop.latex.outDir": "%DIR%",
    "latex-workshop.view.pdf.viewer": "tab",    
    "latex-workshop.latex.autoBuild.run": "onSave",
    "latex-workshop.latex.autoBuild.cleanAndRetry.enabled": true,
    "latex-workshop.formatting.latex": "tex-fmt",
    "latex-workshop.formatting.tex-fmt.args": ["--wraplen", "100"]

```

- Open the *.tex file in Vscode.
- You can now build and preview the doc
- **Auto format** - Select tex, right click -> "Format document With" -> LateX workshop

## Diagrams
- For diagrams, combine it with https://marketplace.visualstudio.com/items?itemName=pomdtr.excalidraw-editor , to draw your diagrams in excallidraw , locally.
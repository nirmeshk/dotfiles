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

# LAtex with remote linux setup

LuaLaTeX Setup on Amazon Linux 2

## Option 1: Docker (Recommended for Linux)

Uses TeX Live 2025 via Docker — no system package conflicts.

### Prerequisites
```bash
docker --version  # Ensure Docker is installed
```

### Setup

1. Pull the TeX Live image:
```bash
docker pull texlive/texlive
```

2. Create wrapper script at `~/bin/lualatex-docker`:
```bash
#!/bin/bash
# Wrapper for lualatex via Docker
# Usage: lualatex-docker [--workspace=DIR] [lualatex args...] file.tex

WORKSPACE=""
ARGS=()

for arg in "$@"; do
    if [[ "$arg" == --workspace=* ]]; then
        WORKSPACE="${arg#--workspace=}"
    else
        ARGS+=("$arg")
    fi
done

TEXFILE="${ARGS[-1]}"
LATEXARGS=("${ARGS[@]:0:${#ARGS[@]}-1}")

if [[ -n "$WORKSPACE" && -d "$WORKSPACE" ]]; then
    TEXFILE=$(realpath "$TEXFILE")
    RELPATH="${TEXFILE#$WORKSPACE/}"
    TEXDIR=$(dirname "$TEXFILE")
    docker run --rm -v "$WORKSPACE:/workdir" -w "/workdir/$(dirname "$RELPATH")" texlive/texlive lualatex "${LATEXARGS[@]}" "$(basename "$TEXFILE")"
    chown $(id -u):$(id -g) "$TEXDIR"/*.pdf "$TEXDIR"/*.log "$TEXDIR"/*.aux "$TEXDIR"/*.synctex.gz "$TEXDIR"/*.out "$TEXDIR"/*.toc 2>/dev/null
else
    TEXFILE=$(realpath "$TEXFILE")
    TEXDIR=$(dirname "$TEXFILE")
    MOUNTDIR=$(dirname "$(dirname "$TEXDIR")")
    RELDIR=${TEXDIR#$MOUNTDIR/}
    docker run --rm -v "$MOUNTDIR:/workdir" -w "/workdir/$RELDIR" texlive/texlive lualatex "${LATEXARGS[@]}" "$(basename "$TEXFILE")"
    chown $(id -u):$(id -g) "$TEXDIR"/*.pdf "$TEXDIR"/*.log "$TEXDIR"/*.aux "$TEXDIR"/*.synctex.gz "$TEXDIR"/*.out "$TEXDIR"/*.toc 2>/dev/null
fi
```

3. Make executable:
```bash
chmod +x ~/bin/lualatex-docker
```

4. Configure VS Code LaTeX Workshop:

   For VS Code Remote SSH, edit the **remote machine settings**:
   - Open VS Code connected to remote
   - Press `Ctrl+Shift+P` → "Preferences: Open Remote Settings (JSON)"
   - Or directly edit: `~/.vscode-server/data/Machine/settings.json`

   Add:
```json
{
  "latex-workshop.latex.tools": [
    {
      "name": "lualatex",
      "command": "/home/YOUR_USER/bin/lualatex-docker",
      "args": ["--workspace=%WORKSPACE_FOLDER%", "-synctex=1", "-interaction=nonstopmode", "-file-line-error", "%DOC%"]
    }
  ],
  "latex-workshop.latex.recipes": [
    {"name": "LuaLaTeX", "tools": ["lualatex"]}
  ]
}
```

Note: `docker.enabled` doesn't work with VS Code Remote SSH — the wrapper script is required.

## Date
2026-01-21



# Diagrams
- For diagrams, combine it with https://marketplace.visualstudio.com/items?itemName=pomdtr.excalidraw-editor , to draw your diagrams in excallidraw , locally.
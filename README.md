My Setup - 

- Atuin for command line history - https://atuin.sh/
- Oh My Zshs - https://ohmyz.sh/ for instantly fixing the shell
- fzf - fuzzy file finder 
- ghostly or fish for terminal 
- fd (https://github.com/sharkdp/fd) for finding files in current directory
- Ripgrep - https://github.com/BurntSushi/ripgrep as alternate to grep
- Vscode for CPP coding
- IntelliJ for Java coding 
- lazyvim / neovim





## Utils / Shortcuts

Launch a default zellij session

```
zm() {
    if [ -z "$ZELLIJ" ]; then
        # Check for existing 'main' session
        if zellij list-sessions | grep -q "main"; then
            # 'main' session exists, attach to it
            zellij attach main
        else
            # No 'main' session, create a new one
            zellij --session main
        fi
    else
        echo "Already in a zellij session"
    fi
}
```

## Git 

```
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'     --abbrev-commit"
```

## 
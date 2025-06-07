#!/usr/bin/env zsh
# ==============================
# 🚀 Optimized .zshrc template
# Template by Koutian Wu (GitHub: ktwu01)
# This file is designed to be a starting point for your zsh configuration.
# It includes essential settings, aliases, and functions to enhance your zsh experience.
# Feel free to customize it further to suit your needs.
# Place this file in your $HOME directory.
# ==============================

# ---------------------- USER VARIABLES ----------------------
# Define your repository base (where you keep all your GitHub projects)
export REPO_BASE=${REPO_BASE:-"$HOME/path/to/your/GitHubRepos"}

# Define where your zshrc backup repo lives
export ZSHRC_REPO=${ZSHRC_REPO:-"$REPO_BASE/zshrc"}

# ---------------------- EDITOR & DOCS ----------------------
# Adjust these to your local setup
# VS Code CLI (on macOS)
alias code="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
# Your documents directory
export DOCS=${DOCS:-"$HOME/Documents"}

# Shortcut to jump to your GitHub projects
alias gh="cd \"\$REPO_BASE\""

# ---------------------- AUTO-BACKUP FUNCTION ----------------------
function sync_zshrc() {
    # Copy current .zshrc into your backup repo
    cp ~/.zshrc "$ZSHRC_REPO/.zshrc"
    cd "$ZSHRC_REPO" || return

    # Pull latest, then commit & push if there are changes
    git pull origin main
    if git status --porcelain | grep -q .; then
        git add . && \
        git commit -m "chore: update zshrc" && \
        git push
        echo "✔ zshrc pushed"
    else
        echo "✔ no changes"
    fi

    # Return and reload
    cd - >/dev/null || return
    source ~/.zshrc
}
alias sourcezsh='sync_zshrc'

# ---------------------- HISTORY SETTINGS ----------------------
unset HISTFILE
HISTSIZE=5000
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ---------------------- BASIC ALIASES ----------------------
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Colorize output if supported
if command -v dircolors >/dev/null; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Quick edit
alias editzsh='code ~/.zshrc'

# Alert on long-running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -E '\''s/^[[:space:]]*[0-9]+[[:space:]]*//;s/[;&|][[:space:]]*alert$//'\'')"'

# Python defaults
alias python=python3
alias pip=pip3

# Optionally add any additional PATH adjustments:
# export PATH="$HOME/.local/bin:$PATH"

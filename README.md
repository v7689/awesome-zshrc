# zshrc Configuration

This repository contains my personal Zsh configuration files to synchronize settings across multiple machines (e.g. MacBook).

1. do not use zshhistory. instead, save only a copy to ~/Documents/GitHubRepos/zshrc/, every time use sourcezsh. and the commit msg is always set to "update". if there is no new zsh content then it will no commit.

2. once use use sourcezsh, commit and push it to githb. that is, embed the "commit and push it to githb" cmd in zsh itself. 


## What's Included

- VS Code terminal integration
- Enhanced command history settings
- Directory navigation shortcuts
- Git workflow aliases
- Color settings for terminal output
- Local customization support

## Installation
Note: it is suggested to be installed at ~/Documents/GitHubRepos/

1. Clone this repository:
   ```bash
   mkdir -p ~/Documents/GitHubRepos/
   cd ~/Documents/GitHubRepos/
   git clone https://github.com/your/username/zshrc.git
   ```

2. Create a symbolic link to the .zshrc file:
   ```bash
   touch ~/.zshrc
   
   ln -sf ~/Documents/GitHubRepos/zshrc/.zshrc ~/.zshrc
   ```

3. Restart your terminal or run:
   ```bash
   source ~/.zshrc
   ```

4.Run this cmd for sync with GitHub:
   ```bash
   sourcezsh
   ```

### 📝 What to customize
    
1. **`ZSHRC_REPO`** → the path to your private `zshrc` backup repo.
    
2. **`alias code`** → adjust if VS Code CLI is installed elsewhere (or change to `code` if already in PATH).
    
3. **`DOCS`** → point to your Documents folder or drop if unused.
    
With this in place, anyone can clone your `zshrc` repo, symlink `~/.zshrc` to this template, and enjoy automated backups via `sourcezsh`.

<!-- ## Customization

For machine-specific settings, create a `.zshrc.local` file in your home directory. This file will be automatically sourced if it exists.
 -->

## Features

- **VS Code Integration**: Use `code .` to open the current directory in VS Code
- **Navigation**: Use `..`, `...` for faster directory traversal
- **Git Shortcuts**: Use aliases like `gs` for git status, `gp` for git push
- **Directory Shortcuts**: Quick access to commonly used directories

## Usage Notes
After installation, you'll need to restart your terminal or run `source ~/.zshrc` to apply the changes.

If you make changes to the repository version, remember to push your changes to keep all your machines in sync.
# ==========================
# History Settings
# ==========================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory

# ==========================
# Path Variables
# ==========================
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/snap/bin:$PATH"

# ==========================
# Aliases & Tools
# ==========================
# Config git repo alias
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Project Jumper
alias pj='cd $(find ~/Projects -mindepth 1 -maxdepth 2 -type d | fzf) && nvim .'

# Zoxide
eval "$(zoxide init zsh)"

# eza (Modern ls)
alias ls="eza --icons=always --color=always"
alias ll="eza -la --icons=always --color=always --group-directories-first"
alias tree="eza --tree --icons=always"

# bat (Modern cat)
alias cat="bat --style=plain"

# direnv
eval "$(direnv hook zsh)"

# ==========================
# Plugins
# ==========================
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ==========================
# Prompt (Must be at the bottom)
# ==========================
eval "$(starship init zsh)"

# ==========================
# WezTerm Directory Tracking
# ==========================
function chpwd() {
  printf "\033]7;file://%s%s\033\\" "${HOSTNAME}" "${PWD}"
}
chpwd

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PATH
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin/:$PATH"

# Theme setup
source ~/zsh_plugins/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

setopt interactivecomments
# Plugin setup
source ~/zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# 
source ~/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Command history
HISTSIZE=500
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space

# Essentials
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias fucking="sudo"
alias please ="sudo"

# Other
alias home="cd ~"
alias codingdir="cd ~/Coding/"
alias zrc="nvim ~/.zshrc"
alias alcf="nvim ~/.config/alacritty/alacritty.toml"

# Nvim
alias nv="nvim ."
export SUDO_EDITOR="nvim"
alias "sudoedit"='function _sudoedit(){sudo -e "$1";};_sudoedit'

# Hyprland
alias nvimdir="nvim ~/.config/nvim/lua/bsw/"

# Sync notes folder
alias syncfolder="rclone sync ~/Syncfolder GoogleDrive:Syncfolder \
  --filter-from ~/.config/rclone/filters.txt --progress"

[ -f "/home/beispielsweise/.ghcup/env" ] && . "/home/beispielsweise/.ghcup/env" # ghcup-env

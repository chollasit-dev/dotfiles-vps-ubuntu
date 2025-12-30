setopt extendedglob
setopt LIST_TYPES

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 15 # frequency: 15 days

ZSH_THEME=robbyrussell

# Prevent pasting URLs and other text is messed up
DISABLE_MAGIC_FUNCTIONS="true"

# Makes repository status check for large repos faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

# See `man strftime`
HIST_STAMPS="yyyy-mm-dd"

plugins=(
  "alias-finder"
  "catimg"
  "colored-man-pages"
  "dircycle"
  "dirpersist"
  "emoji"
  "emoji-clock"
  "fancy-ctrl-z"
  "fzf"
  "git-commit"
  "gitignore"
  "globalias"
  "history"
  "safe-paste"
  "shell-proxy"
  "sudo"
  "systemadmin"
  "systemd"
  "urltools"
  "zsh-interactive-cd"
  "zsh-navigation-tools"
)

export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH" # May needed if migrate from Bash

export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"

export EDITOR='nvim'

init_carapace() {
  export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
  zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
  source <(carapace _carapace)
  zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
}
init_carapace

[ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

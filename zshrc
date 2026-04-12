# Theme
source ~/.zsh/themes/agnoster.zsh-theme

# ZSH as shell
export SHELL=/bin/zsh

# Setup History
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Set Variables
## Syntax highlighting for man pages.
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="Nord"

# Change ZSH Options
## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Create Aliases
alias list="ls -lAFhG --color"
alias lstree="lsd --tree -I node_modules"
alias mnm="makenmove"
alias mns="movenshow"
alias v="nvim"
alias v.="nvim ."
alias t="tmux"
alias pbcopy="t loadb -"
alias pbpaste="t saveb -"
alias fcd="fancyCD"

# Customize Prompt(s)
setopt PROMPT_SUBST
RPROMPT='%*'

# Functions
function makenmove() {
  mkdir -p "$@" && cd "$_"
}

function movenshow() {
  cd "$@" && list
}

function ghclone() {
  gh repo list -L 100 | fzf --preview 'gh repo view {1}' | awk '{print $1}' | xargs gh repo clone
}

function gitcommithistory() {
  git log --format=format:%H | fzf --preview 'git show {1}' | awk '{print $1}' | xargs git show
}

function fancyCD() {
  selectedDir=$(ls -1ad */ | fzf)

  if [[ $selectedDir ]]
  then
    cd $PWD/$selectedDir
  fi
}

# Ripgrep Config
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# True Color
export COLORTERM=truecolor

# Go
export GOPATH=$HOME/go

# Local Bin
export LOCAL_BIN=$HOME/bin

# Local Bin 2
export LOCAL_BIN_2=$HOME/.local/bin

export PATH=$PATH:$LOCAL_BIN:/usr/local/go/bin:$GOPATH/bin:$LOCAL_BIN/lua-language-server/bin:$LOCAL_BIN_2

alias luamake=/home/ty/bin/lua-language-server/3rd/luamake/luamake

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Auto switch node version with NVM when .nvmrc file found
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
# Auto switch node version with NVM when .nvmrc file found

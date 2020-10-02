export ZSH="/Users/lukashorak/.oh-my-zsh"
ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(
  z
  git
  thefuck
  osx
  zsh-autosuggestions
  zsh-syntax-highlighting
  yarn
  docker
  docker-compose
  dotenv
)

[ -f "$HOME/.powerlevel9k_theme" ] && source "$HOME/.powerlevel9k_theme"
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='micro'
fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# source aliases from aliases dotfile
[ -f .aliases ] && source .aliases

# export LOCALIP=$(myip);

# THEME CONFIG
# Show OS info when opening a new terminal
# neofetch


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export GOPATH=/Users/lukashorak/go
export PATH=$GOPATH/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

figlet "PuPa MBP"

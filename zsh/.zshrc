# ln -s ~/Dropbox/dotFiles/tmux/.tmux.conf .tmux.conf
------------------------------------------------------------------

If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

Path to your oh-my-zsh installation.
#  export ZSH=/home/mor/.oh-my-zsh
 export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker go golang pip python postgres redis-cli ssh-agent tmux vagrant virtualenv vim-interaction zsh-syntax-highlighting vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
setopt menucomplete
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*' menu select
zmodload zsh/complist

# Use vim keybindings
bindkey -v

bindkey '^n' expand-or-complete
bindkey '^@' expand-or-complete
bindkey -M vicmd v edit-command-line

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}


local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} $(virtualenv_info) %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
export GOPATH=$HOME/GOPATH
echo GOPATH = $GOPATH

export PATH=$GOPATH/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
echo PATH   = $PATH

# export GOROOT=/usr/local/go
echo GOROOT = $GOROOT

export HISTFILE=~/.zsh_history
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

alias ack='ack --ignore-dir=venv --ignore-dir=build --ignore-dir=dist'

alias anaconda_qtconsole='cd ~/Downloads/; /home/mor/anaconda2/bin/jupyter qtconsole --JupyterWidget.include_other_output=True --style=monokai'
alias anaconda_web='cd ~/Downloads/; /home/mor/anaconda2/bin/jupyter notebook --no-browser'

export WORK_PATH=/home/$USER/SBER
export CDPATH=$GOPATH/src/github.com/CodeTeam:$WORK_PATH:~/Dropbox/
export ADCOMBO_CFG_NAME=development

alias gopathhere='export "GOPATH=$PWD"'

# alias vpnwork='sudo openvpn --config ~/Dropbox/ADCOMBO/openvpn_config/adcombo-razdva.ovpn.bin --redirect-gateway def1'
# alias vpnwork='sudo openvpn --config ~/Dropbox/ADCOMBO/openvpn_config/adcombo-razdva.ovpn.bin'
#
alias vpnwork='sudo openvpn --config ~/Dropbox/ADCOMBO/openvpn_config/adcombo-razdva-routetocf.ovpn.bin'
# alias vpnhomejira='sudo openvpn --config ~/Dropbox/ADCOMBO/openvpn_config/adcombo-razdva-defgw.ovpn.bin'

[ -f ~/Dropbox/dotFiles/zsh/zshrc_local.zsh ] && source ~/Dropbox/dotFiles/zsh/zshrc_local.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="/home/mor/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
source $HOME/.zshenv

# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
# source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /Users/mavostrykh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

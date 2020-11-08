# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/zenithal/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	#zsh-autosuggestions
	zsh-ipip
)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias chrome="google-chrome-stable"
alias please="sudo"
alias grepc="grep --color=always"
alias hg="history | grep"
alias pg="ps aux | grep"
alias bc="bc -ql"
alias R="R -q"
alias mutt="mutt -R"

export EDITOR=vim
export MAIL=/home/zenithal/M
export GPG_TTY=$(tty)
export TERM=screen-256color
export GOPATH=$HOME/G

# NPM related
export NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ] && [[ "$SSH_CONNECTION" == "" ]]; then
    unset SSH_AGENT_PID
    export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

if [ -z "$TMUX" ]; then
    if [[ "$SSH_CONNECTION" != "" ]]; then 
        if [[ "x$(echo $SSH_CONNECTION|cut -d' ' -f1)" == "x2001:470:fceb:2::1" ]]; then
            tmux attach -t nadir || tmux new -s nadir
        elif [[ "x$(echo $SSH_CONNECTION|cut -d' ' -f1)" == "x2001:470:fceb:11::1" ]]; then
            tmux attach -t sun || tmux new -s sun
        else
            true
        fi
    else
        tmux attach -t default || tmux new -s default
    fi
fi

alias shutdown="echo You are in Zenith! Are you sure to shutdown?"

#bindkey -v 

# fzf-history-widget-accept() {
#  fzf-history-widget
#  zle accept-line
#}
#zle    -N    fzf-history-widget-accept
#bindkey '^X^R' fzf-history-widget-accept

# ssh() {
#     if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
#         tmux rename-window "$(echo $* | cut -d . -f 1)"
#         command ssh "$@"
#         tmux set-window-option automatic-rename "on" 1>/dev/null
#     else
#         command ssh "$@"
#     fi
# }

precmd() {
    export LANG=`locale -a | grep utf8 | shuf | head -1`
}



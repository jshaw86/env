# window titles that dont work
#if [[ "$TERM" == "screen" ]]; then 
#	PROMPT="${PROMPT}%{^[kzsh^[\\%}"
#fi

setopt AUTO_CD 
setopt CORRECT
setopt noautomenu
setopt nolistambiguous
# allows better searching, 
# "ls *.txt~foo.txt" excludes foo.txt
# ls *(x) searchs for files that are +x
# ls ^foo.txt excludes foo.txt (maybe?)
setopt EXTENDEDGLOB
# push directories visited automatically onto stack
# http://prashblog.com/2008/07/07/zsh-for-productivity/
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups 

export LSCOLORS='gxfxcxdxbxgggdabagacad'
export CLICOLOR='true'
export EDITOR='nvim'
export WORKON_HOME=~/virtual-environments
export JAVA_HOME=`/usr/libexec/java_home -v 13`
export GRADLE_HOME=~/gradle
export NVM_DIR="$HOME/.nvm"

export ANSIBLE_HOST_KEY_CHECKING=false

export TERM='screen-256color-bce'
export GOPATH=~/Development/gopath
export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/Users/$USER/perl5";
export PERL_MB_OPT="--install_base /Users/$USER/perl5";
export PERL_MM_OPT="INSTALL_BASE=/Users/$USER/perl5";
export PERL5LIB="/Users/$USER/perl5/lib/perl5:$PERL5LIB";
export HISTFILE=~/.history
export HISTSIZE=1000
export SAVEHIST=1000
export NODE_VERSION=12

source ~/.zshenv

# {{{ Aliases 
alias -s php=nvim
alias -s css=nvim
alias -s js=nvim
alias -s cpp=nvim
alias -s gs=nvim
alias -s gsc=nvim

alias grep='egrep'
alias ll='ls -l'
alias la='ls -a'
alias vi='nvim'
alias vim='nvim'
alias tmux="TERM=screen-256color-bce tmux"
# }}}

# share history across terminals
setopt INC_APPEND_HISTORY SHARE_HISTORY

# allow ctrl+R to search my history
bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# These options are supposed to make autocomplete better
# take from http://prashblog.com/files/.zshrc
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort access
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' '+m:{a-z}={A-Z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:::::' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 2
zstyle ':completion:*' completer _complete _prefix
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:predict:*' completer _complete # Completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST # Expand partial paths
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes' # Include non-hidden directories in globbed file completions
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~' # Separate matches into groups
zstyle ':completion:*:matches' group 'yes' # Describe each match group.
zstyle ':completion:*:descriptions' format "%B----  %d%b" # Messages/warnings format
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
zstyle ':completion:*:warnings' format '%B---- no match (%d%u%b)' # Describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

PERL_MB_OPT="--install_base \"/Users/$USER/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/$USER/perl5"; export PERL_MM_OPT;

function aws_env() {
    if [[ $1 == 'prod' ]] ; then
        echo "Using prod keys... "
        export AWS_ACCESS_KEY_ID=$PROD_AWS_ACCESS_KEY_ID
        export AWS_SECRET_ACCESS_KEY=$PROD_AWS_SECRET_ACCESS_KEY 
        return
    fi

    if [[ $1 == 'test' ]] ; then
        echo "Using engineering test keys... "
        export AWS_ACCESS_KEY_ID=$TEST_AWS_ACCESS_KEY_ID
        export AWS_SECRET_ACCESS_KEY=$TEST_AWS_SECRET_ACCESS_KEY
        return
    fi

    echo "Using dev keys... "
    export AWS_ACCESS_KEY_ID=$DEV_AWS_ACCESS_KEY_ID
    export AWS_SECRET_ACCESS_KEY=$DEV_AWS_SECRET_ACCESS_KEY
}

function kconfig() {
    if [ -z "${1}" ]; then
	ls -la ~/.kube/*.yaml
    else
	if [ -f ~/.kube/$1.yaml ]; then
	    export KUBECONFIG=~/.kube/$1.yaml
	else
	    echo "file ~/.kube/$1.yaml does not exist"
	fi
    fi

}

function kuse() {
    environment=$1

    export KUBECONFIG='';

    if [[ $environment == 'prod' ]] ; then
        context=$PROD_K8S
    fi

    if [[ $environment == 'qa' ]] ; then
        context=$QA_K8S
    fi

    if [[ $environment == 'devel' ]] ; then
        context=$DEVEL_K8S
    fi

    if [[ $environment == 'minikube' || $environment == 'docker-desktop' ]] ; then
        context=$environment
    fi

     echo "Using context... $context"
     kubectl config use-context $context 

}

# cd to a file should take you to the dir that contains the file
# courtesy of Artur Penttinen <artur@xxxxxxxxxxx>
function cd () {
  if [[ -f $1 ]]; then
    builtin cd $1:h
  else
    builtin cd $1
  fi
}

function get_pwd() {
    echo "${PWD/$HOME/~}"
}

function k() {
    current_env=$(kubectl config current-context)
    all_args=$*;
    if read -q "?run kubectl ${all_args} against ${current_env} (y/n) ?"; then
        aws-okta --mfa-provider OKTA --mfa-factor-type push exec prod-eng -- env kubectl $*
        return
    fi
    echo "aborted.. kubectl ${all_args}"
}

function h() {
    current_env=$(kubectl config current-context)
    all_args=$*;
    if read -q "?run helm ${all_args} against ${current_env} (y/n) ?"; then
        aws-okta --mfa-provider OKTA --mfa-factor-type push exec prod-eng -- env helm $*
        return
    fi
    echo "aborted.. helm ${all_args}"
}

function java8() {
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
}

function extract_csv() {
    FILE=$1
    POSITION=$2
    cat $FILE | awk "{ split(\$0, a, \",\"); print a[$POSITION]; }"
}

function replace_with_nothing() {
    FILE=$1
    CHAR_TO_REPLACE_WITH_NOTHING=$2
    sed "s/\\$CHAR_TO_REPLACE_WITH_NOTHING//g" $FILE 


}

function format_file_for_in_query() {
    FILE=$1
    echo -n "'"
    sed ":a;N;\$!ba;s/(\n|\r)/','/g" $FILE 
    echo -n "'"
}

function format_file_for_kibana_OR_list() {
    for FILE in $(echo $*)
    do
         sed ":a;N;\$!ba;s/\n/ OR /g" $FILE > "OR-$FILE"
    done
}

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

nvm use $NODE_VERSION > /dev/null

# added by travis gem
[ -f /Users/$USER/.travis/travis.sh ] && source /Users/$USER/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f "/Users/$USER/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "/Users/$USER/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "/Users/$USER/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "/Users/$USER/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

# Kubernetes Status
autoload -U colors; colors
[ -f /Users/$USER/.zsh/zsh-kubectl-prompt/kubectl.zsh ] && source /Users/$USER/.zsh/zsh-kubectl-prompt/kubectl.zsh

# Git Status
[ -f /Users/$USER/.zsh/zsh-kubectl-prompt/kubectl.zsh ] && source /Users/$USER/.zsh/zsh-git-prompt/zshrc.sh

# Load the super duper completion stuff
autoload -U compinit
compinit
autoload -U promptinit
promptinit

ulimit -n 1024

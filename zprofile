#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>

#
# Avail settings
#
export UMBRELLA_PATH="${HOME}/git/avail/umbrella"

#
# Saltside settings
#
export SALTSIDE_SOURCE_DIR="${HOME}/work"
export WORKSTATION_VAGRANTFILE=$SALTSIDE_SOURCE_DIR/docker-workstation/Vagrantfile
export PROJECT_PATH=$SALTSIDE_SOURCE_DIR
export SANDBOX_EMAIL="sebastian@saltside.se"

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Android
#
export ANDROID_HOME=/usr/local/opt/android-sdk

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
  export LANGUAGE='en_US.utf-8'
  export LC_ALL='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  ~/.rbenv/{bin,shims}
  /usr/local/{bin,sbin}
  ${SALTSIDE_SOURCE_DIR}/docker-workstation/vagrant-workstation/bin
  ~/bin
  ~/go/bin
  /usr/local/go/bin
  /usr/local/opt/go/libexec/bin
  ./node_modules/.bin
  ./../node_modules/.bin
  ~/work/platform-utilities/instance-ips
  ~/git/avail/tools/pys3
  $path
)

# Alias
alias grep='grep --color'
alias ls='ls -G'
alias ssh="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias scp="scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias tmux="tmux -2"
alias wrk="workstation"
alias s="sandbox"
alias sd="sandbox dev"
alias se="sandbox exec"
alias sL="sandbox logs -f"
alias sLE="export SANDBOX_NAME=buynow && export AWS_DEFAULT_REGION=eu-west-1 && sandbox logs -f"
alias sm="sandbox market"
alias smE="export SANDBOX_NAME=buynow && export AWS_DEFAULT_REGION=eu-west-1 && sandbox market"
alias sr="sandbox reset"
alias srE="export SANDBOX_NAME=buynow && export AWS_DEFAULT_REGION=eu-west-1 && sandbox reset"
alias ss="sandbox sync"
alias sU="sandbox update"
alias sUE="export SANDBOX_NAME=buynow && export AWS_DEFAULT_REGION=eu-west-1 && sandbox update"
alias cist="watch -n10 hub ci-status"
source ${HOME}/.dotfiles/gitaliases

# Go
export GOPATH="${HOME}/go"

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

# nvm settings
#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

# Load the secrets
source ${HOME}/.profile-secrets

if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

if [[ "$-" == *i* ]] ; then
  export IS_INTERACTIVE=true
else
  export IS_INTERACTIVE=false
fi

if [[ -z $SSH_CONNECTION ]]; then
  export IS_REMOTE=false
else
  export IS_REMOTE=true
fi

# Colors ----------------------------------------------------------
export TERM=xterm-256color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1 

if [ "$OS" = "linux" ] ; then
  alias ls='ls --color=auto' # For linux, etc
  # ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
  export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'  #LS_COLORS is not supported by the default ls command in OS-X
else
  alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
fi


# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\033[0m' # No Color
export COLOR_WHITE='\033[1;37m'
export COLOR_BLACK='\033[0;30m'
export COLOR_BLUE='\033[0;34m'
export COLOR_LIGHT_BLUE='\033[1;34m'
export COLOR_GREEN='\033[0;32m'
export COLOR_LIGHT_GREEN='\033[1;32m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_CYAN='\033[1;36m'
export COLOR_RED='\033[0;31m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_LIGHT_PURPLE='\033[1;35m'
export COLOR_BROWN='\033[0;33m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_GRAY='\033[1;30m'
export COLOR_LIGHT_GRAY='\033[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # lists all the colors



# History ----------------------------------------------------------
export HISTCONTROL=ignoredups
#export HISTCONTROL=erasedups
export HISTFILESIZE=3000
export HISTIGNORE="ls:cd:[bf]g:exit:..:...:ll:lla"
alias h=history
alias hack="h | ack -i"
hf(){ 
  grep "$@" ~/.bash_history
}



if [ $IS_INTERACTIVE = 'true' ] ; then # Interactive shell only

  # Input stuff -------------------------------------------------------
  bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
  bind "set show-all-if-ambiguous On" # show list automatically, without double tab
  bind "set bell-style none" # no bell

  # Use vi command mode
  bind "set editing-mode vi"
  set -o vi
  bind -m vi-command -r 'v'

  shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns



  # Completion -------------------------------------------------------

  # Turn on advanced bash completion if the file exists 
  # Get it here: http://www.caliban.org/bash/index.shtml#completion) or 
  # on OSX: brew install bash-completion
  if [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
  fi
  if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
  fi
  if [ -f ~/etc/bash_completion ]; then
    . ~/etc/bash_completion
  fi

  # git completion
  if [ $OS == 'darwin' ]; then
      if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
          . `brew --prefix`/etc/bash_completion.d/git-completion.bash
      fi
      if [ -f `brew --prefix`/Library/Contributions/brew_bash_completion.sh ]; then
          . `brew --prefix`/Library/Contributions/brew_bash_completion.sh
      fi
  fi
  
  # brew completion
  # Add completion to source and .
  complete -F _command source 
  complete -F _command .



  # Prompts ----------------------------------------------------------
  #git_dirty_flag() {
    #git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "⚡"}'
  #}

#  prompt_func() {
#      # Get Virtual Env
#      if [[ $VIRTUAL_ENV != "" ]]; then
#      # Strip out the path and just leave the env name
#         VENV="\[${COLOR_RED}\](${VIRTUAL_ENV##*/})"
#      else
#      # In case you don't have one activated
#         VENV=''
#      fi
#
#      previous_return_value=$?;
#      if [ $IS_REMOTE = 'true' ] ; then
#        prompt="${VENV}\[\033]0;${USER} ${PWD}\007\]\[${COLOR_PURPLE}\]\w\[${COLOR_GRAY}\]$(__git_ps1)\[${COLOR_NC}\] "
#      else
#        prompt="${VENV}\[\033]0;${USER} ${PWD}\007\]\[${COLOR_GREEN}\]\w\[${COLOR_GRAY}\]$(__git_ps1)\[${COLOR_NC}\] "
#      fi
#
#      if test $previous_return_value -eq 0
#      then
#          PS1="${prompt}> "
#      else
#          PS1="${prompt}\[${COLOR_RED}\]> \[${COLOR_NC}\]"
#      fi
#  }
#  PROMPT_COMMAND=prompt_func

  # export PS1="\[${COLOR_GREEN}\]\w\[${COLOR_NC}\] > "  # Primary prompt with only a path
  # export PS1="\[${COLOR_RED}\]\w > \[${COLOR_NC}\]"  # Primary prompt with only a path, for root, need condition to use this for root
  # export PS1="\[${COLOR_GRAY}\]\u@\h \[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with user, host, and path 
  # This runs before the prompt and sets the title of the xterm* window.  If you set the title in the prompt
  # weird wrapping errors occur on some systems, so this method is superior
  #export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/} ${USER}@${HOSTNAME%%.*}"; echo -ne "\007"'  # user@host path

#  export PS2='> '    # Secondary prompt
#  export PS3='#? '   # Prompt 3
#  export PS4='+'     # Prompt 4
#
#  function xtitle {  # change the title of your xterm* window
#    unset PROMPT_COMMAND
#    echo -ne "\033]0;$1\007" 
#  }

fi



# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd .. ; cd ..'
alias sshs='ssh -p 1209 -Y fes788@shamu.coe.utsa.edu'
alias sshst='ssh -Y jtfoster@login4.stampede.tacc.utexas.edu'
alias ip='ipython'
alias ipq='ipython qtconsole --colors=linux'
alias ipn='ipython notebook'
alias python='ipython'
alias ipsandia='ssh -L localhost:8888:localhost:8888 jtfoste@srngate.sandia.gov'
alias cdcv="cd ~/Documents/LaTeX/CV"
alias cdbib="cd ~/Documents/LaTeX/include"
cl() { cd $1; ls -la; } 

# I got the following from, and mod'd it: http://www.macosxhints.com/article.php?story=20020716005123797
#    The following aliases (save & show) are for saving frequently used directories
#    You can save a directory using an abbreviation of your choosing. Eg. save ms
#    You can subsequently move to one of the saved directories by using cd with
#    the abbreviation you chose. Eg. cd ms  (Note that no '$' is necessary.)
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
  touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
  command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; 
}  #"
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file 
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility



# Editors ----------------------------------------------------------
export EDITOR='vim'  #Command line
export GIT_EDITOR='vim'
alias mvim='/Applications/MacVim.app/Contents/MacOS/vim -g'

if [ "$OS" = "darwin" ] ; then
  alias v=mvim
  alias vc=vim
  alias vi=vim
  alias vt='mvim --remote-tab'
else
  alias v=vim
  alias vi=vim
  alias mvim=gvim
fi



# Security ---------------------------------------------------------

# Folder shared by a group
# chmod g+s directory 
#find /foo -type f -print | xargs chmod g+rw,o-rwx,u+rw
#find /foo -type d -print | xargs chmod g+rwxs,o-rwx,u+rwx

# this might work just the same (not tested)
# chmod -R g+rwXs,o-rwx,u+rwX /foo



# Sluething----------------------------------------------------
findportuser() {
    lsof -i :"$1"
}

track_traffic(){
  # install ngrep with sudo port install ngrep
  sudo ngrep -W byline -qld en0 "$1" 
}

# Other aliases ----------------------------------------------------
alias ll='ls -hl'
alias la='ls -a'
alias lla='ls -lah'

# Search
if type -P ack &>/dev/null ; then # Use ack for grepping and find if ack is available
  g(){
    ack "$*" --color-match=green --color-filename=blue --smart-case
  }
  gw(){
    ack "$*" --color-match=green --color-filename=blue --word-regexp --smart-case
  }
  f(){
    ack -i -g ".*$*[^\/]*$" | highlight blue ".*/" green "$*[^/]"
  }
else
  g(){
    grep -Ri $1 *
  }
  f(){
    find . -iname "$1"
  }
fi

# Misc
alias reloadbash='source ~/.bash_profile'

alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias m='more'
alias top='top -o cpu' # os x

alias df='df -h' # Show disk usage

if [ "$OS" = "linux" ] ; then
  alias processes_all='ps -AFH'
  alias systail='tail -f /var/log/syslog'
else
  alias processes_all='ps -Afjv'
  alias systail='tail -f /var/log/system.log'
fi

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

alias untar="tar xvzf"


alias cp_folder="cp -Rpv" #copies folder and all sub files and folders, preserving security and dates

alias mirror_website="wget -m -x -p --convert-links --no-host-directories --no-cache -erobots=off"

killhard() {
    kill -9 "$1"
}


alias sshh="ssh -Y john@johnandlisa.homeip.net"
alias showall="defaults write com.apple.finder AppleShowAllFiles TRUE"
alias shownone="defaults write com.apple.finder AppleShowAllFiles FALSE"
alias tarPeridigm="tar cjvf Peridigm.tar.bz2 --exclude=./.svn* --exclude=./build --exclude=./*/.svn* Peridigm"

# Bring in the other files ----------------------------------------------------
#if [ $IS_INTERACTIVE = 'true' ] ; then
  #source ~/.bashrc_help

  #source ~/cl/bin/mq/mq.sh # MySQL tools
  #source ~/cl/bin/rr/rr.sh # Rails tools
  #source ~/cl/bin/gt/gt.sh # Git tools
  #source ~/cl/bin/sv/sv.sh # SVN tools
#fi

if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi



# Test ------------------------------------------------------------------------ 

#if [ "$OS" = "linux" ] ; then
#elif
#else
#fi
alias julia="/Applications/Julia-1.4.app/Contents/Resources/julia/bin/julia"
alias cubit="/Applications/Cubit-13.0/cubit.command -nojournal -nographics -batch"
alias mkpdf="latexmk -pvc -pdf"
alias mkps="latexmk -pvc -pdfps -view=pdf"
alias mkcl="latexmk -CA"
alias blog="cd $HOME/projects/blog"
alias post="cd $HOME/projects/blog/content/posts"
alias cdl="cd $HOME/Documents/LaTeX"
#alias inkscape="/Applications/Inkscape.app/Contents/Resources/bin/inkscape -D -z"

# added by travis gem
[ -f /Users/fes788/.travis/travis.sh ] && source /Users/fes788/.travis/travis.sh

# added by travis gem
[ -f /Users/john/.travis/travis.sh ] && source /Users/john/.travis/travis.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

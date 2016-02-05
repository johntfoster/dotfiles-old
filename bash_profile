# See following for more information: https://github.com/johntfoster/dotfiles 

# Identify OS and Machine -----------------------------------------
export OS=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"
# Note, default OS is assumed to be OSX

# add your bin folder to the path, if you have it.  It's a good place to add all your scripts
if [ -d ~/bin ]; then
	export PATH=~/bin:$PATH  
fi

# OS Specific Environment ------------------------------------------------------------
if [ "$OS" == "darwin" ] ; then
  export DOCKER_HOST=tcp://127.0.0.1:2375
  export PATH=$HOME/bin:$PATH
  export PATH=/usr/local/bin:/usr/local/sbin:$PATH  
  export PATH=/usr/local/screen/bin:$PATH  
  export PATH=/usr/texbin:$PATH
  export BYOBU_PREFIX=$(brew --prefix)
  #export MODULEPATH=/usr/local/modules/Modules/3.2.10/modulefiles
  source /usr/local/bin/virtualenvwrapper.sh
  source /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
  source $(brew --prefix nvm)/nvm.sh
  #
  export HOMEBREW_GITHUB_API_TOKEN=4a856b15b6245d9b7b996e39eb547d583167b0c0
  export PATH=$HOME/.cabal/bin:$PATH
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
  #module() { eval `$MODULEPATH/../bin/modulecmd bash $*`; }
  #export DYLD_LIBRARY_PATH=/usr/local/trilinos/lib:$DYLD_LIBRARY_PATH
  export PATH=/Applications/MATLAB_R2015a.app/bin:$PATH
  export PATH=$HOME/miniconda3/bin:$PATH
fi
#
if [ "$OS" == "linux" ] ; then
  source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
fi

# Machine Specific Environments ------------------------------------
if [ "$(hostname)" == "shamu.coe.utsa.edu" ]; then
    export MODULEPATH=/share/apps/Modules/3.2.6/modulefiles
    module() { eval `$MODULEPATH/../bin/modulecmd bash $*`; }
    module load python
    module load git
    module load tmux
    export PATH=$HOME/projects/vim/bin:$PATH
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
  #
fi


# Load in .bashrc -------------------------------------------------
source ~/.bashrc

# Hello Messsage --------------------------------------------------
echo -e "Kernel Information: " `uname -smr`
echo -e "`bash --version`"
echo -ne "Uptime: "; uptime
echo -ne "Server time is: "; date


# Notes: ----------------------------------------------------------
# When you start an interactive shell (log in, open terminal or iTerm in OS X, 
# or create a new tab in iTerm) the following files are read and run, in this order:
#     profile
#     bashrc
#     .bash_profile
#     .bashrc (only because this file is run (sourced) in .bash_profile)
#
# When an interactive shell, that is not a login shell, is started 
# (when you run "bash" from inside a shell, or when you start a shell in 
# xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed, 
# in this order:
#     bashrc
#     .bashrc


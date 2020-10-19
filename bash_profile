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

# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Applications/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Applications/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Applications/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Applications/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/Users/john/Desktop/assignment7/./micromamba";
export MAMBA_ROOT_PREFIX="/Users/john/micromamba";
__mamba_setup="$('/Users/john/Desktop/assignment7/./micromamba' shell hook --shell bash --prefix '/Users/john/micromamba' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/Users/john/micromamba/etc/profile.d/mamba.sh" ]; then
        . "/Users/john/micromamba/etc/profile.d/mamba.sh"
    else
        export PATH="/Users/john/micromamba/bin:$PATH"
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

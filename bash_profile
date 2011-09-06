# See following for more information: http://www.infinitered.com/blog/?p=10

# Identify OS and Machine -----------------------------------------
export OS=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"
# Note, default OS is assumed to be OSX


# Machine Specific Environment ------------------------------------
if [ "$(hostname)" == "lagrange.local" ]; then
    export PYTHONPATH="/usr/local/vtk/lib/python2.7/site-packages/"
fi
if [ "$(hostname)" == "shamu.coe.utsa.edu" ]; then
    export PATH=~/projects/python2.7/bin:$PATH  
    export PATH=~/projects/perl5.14.1/bin:$PATH  
    export PATH=~/projects/ruby1.9.2/bin:$PATH  
    export MODULEPATH=/share/apps/Modules/3.2.6/modulefiles
fi

# Path ------------------------------------------------------------
if [ "$OS" = "darwin" ] ; then
  export PATH=/usr/local/bin:$PATH  
  export PATH=/opt/local/bin:/opt/local/sbin:$PATH  # OS-X Specific, with MacPorts and MySQL installed
  export PATH="/usr/texbin:$PATH"
fi

#if [ "$OS" = "linux" ] ; then
#fi

if [ -d ~/bin ]; then
	export PATH=~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
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

source ~/.tacklebox/tacklebox.fish

set tacklebox_path ~/.tackle
set tacklebox_modules virtualfish virtualhooks z
set tacklebox_plugins extract pip python up brew vundle
set tacklebox_theme entropy
source ~/.tacklebox/tacklebox.fish
source ~/.tackle/functions/conda.fish

set fish_function_path $fish_function_path "/Users/john/miniconda3/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-setup

set PATH /usr/local/texlive/2015/bin/x86_64-darwin $PATH
set PATH $HOME/miniconda3/bin $PATH
set -x MATLAB_EXECUTABLE /Applications/MATLAB_R2015a.app/bin/matlab
set -x EDITOR vim

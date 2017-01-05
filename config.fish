source ~/.tacklebox/tacklebox.fish

set tacklebox_path ~/.tackle
set tacklebox_modules virtualfish virtualhooks z
set tacklebox_plugins extract pip python up brew vundle
set tacklebox_theme entropy
source ~/.tacklebox/tacklebox.fish
source ~/.tackle/functions/conda.fish

set fish_function_path $fish_function_path "/usr/local/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-setup

set PATH /usr/local/bin $PATH
set PATH /usr/local/texlive/2016/bin/x86_64-darwin $PATH
set -x MATLAB_EXECUTABLE /Applications/MATLAB_R2015b.app/bin/matlab
set -x EDITOR vim
#set -x DOCKER_HOST tcp://127.0.0.1:2375


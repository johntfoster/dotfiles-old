source ~/.tacklebox/tacklebox.fish

set tacklebox_path ~/.tackle
set tacklebox_modules virtualfish virtualhooks z
set tacklebox_plugins extract grc pip python up brew vundle
set tacklebox_theme entropy
source ~/.tacklebox/tacklebox.fish

set fish_function_path $fish_function_path "/usr/local/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-setup

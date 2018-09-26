fish_vi_key_bindings
if status is-interactive 
    and not set -q TMUX
        exec tmux
end

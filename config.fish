fish_vi_key_bindings
if status is-interactive 
    and not set -q TMUX
        exec tmux
end
set -g theme_color_scheme zenburn

set -x BAZEAN_POSTGRES_USERNAME student01
set -x BAZEAN_POSTGRES_PASSWORD Iphi8koh
set -x GOOGLE_API_KEY 'AIzaSyAHHKRhnkIgNNV8JqZEi5XKo_-vFhsHoVI'
set -x EDITOR 'nvim'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/john/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


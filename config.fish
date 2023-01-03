fish_vi_key_bindings
set -g theme_color_scheme zenburn

set -x BAZEAN_POSTGRES_USERNAME student01
set -x BAZEAN_POSTGRES_PASSWORD Iphi8koh
set -x GOOGLE_API_KEY 'AIzaSyAHHKRhnkIgNNV8JqZEi5XKo_-vFhsHoVI'
set -x EDITOR 'nvim'
set -x NVIM_LISTEN_ADDRESS '/tmp/nvimsocket'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/john/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

if status is-interactive 
    and not set -q TMUX
        exec tmux
end

# Set default input/output
#pactl set-default-source alsa_input.usb-Blue_Microphones_Yeti_Stereo_Microphone_LT_19120208352462900017_111000-00.analog-stereo
#pactl set-default-sink alsa_output.pci-0000_00_1f.3.hdmi-stereo

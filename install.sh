#!/bin/bash

create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")

    rm -rf ~/.bashrc
    mkdir -p $HOME/.config/fish
    ln -s $script_dir/bash_profile ~/.bash_profile
    ln -s $script_dir/bashrc ~/.bashrc
    ln -s $script_dir/tmux.conf ~/.tmux.conf
    ln -s $script_dir/config.fish ~/.config/fish/config.fish
}

create_symlinks

sudo apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && sudo apt-get -y install --no-install-recommends fish tmux

echo "Initializing conda for fish."
conda init fish
$CONDA_DIR/bin/pip install powerline-status

echo "Installing fonts."
FONT_DIR="$HOME/.fonts"
git clone https://github.com/powerline/fonts.git $FONT_DIR --depth=1
cd $FONT_DIR
./install.sh

#Install OMF
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
echo "omf install bobthefish" | fish
echo "omf theme bobthefish" | fish

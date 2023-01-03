#!/bin/bash

create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")

    ln -s $script_dir/bash_profile ~/.bash_profile
    ln -s $script_dir/bashrc ~/.bashrc
    ln -s $script_dir/tmux.conf ~/.tmux.conf
    ln -s $script_dir/config.fish ~/.config/fish/config.fish
    ln -s $script_dir/office/mbsyncrc ~/.mbsyncrc
    ln -s $script_dir/office/mutt/mime.types ~/.mime.types
    ln -s $script_dir/office/msmtprc ~/.msmtprc
    ln -s $script_dir/office/mutt/muttrc ~/.muttrc
}

create_symlinks

echo "Initializing conda for fish."
conda init fish
conda install mamba -c conda-forge -y
$CONDA_DIR/bin/pip install powerline-status
export PYTHON_BASE_VERSION=`$CONDA_DIR/bin/python --version | grep -oe 3.[0-9.]`

echo "Installing fonts."
FONT_DIR="$HOME/.fonts"
git clone https://github.com/powerline/fonts.git $FONT_DIR --depth=1
cd $FONT_DIR
./install.sh

#Install OMF
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
echo "omf install bobthefish" | fish
echo "omf theme bobthefish" | fish

fish 

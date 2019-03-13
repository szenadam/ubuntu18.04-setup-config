#!/bin/bash

apt-get install build-essential curl vim tree git tmux


# Install VS Code
wget https://update.code.visualstudio.com/latest/linux-deb-x64/stable -O vscode_stable.deb
dpkg -i vscode_stable.deb
rm -f vscode_stable.deb
# Configure settings for VS Code
mkdir -p "$HOME/.config/Code/User"
cat << EOF > $HOME/.config/Code/User/settings.json
{
    "window.zoomLevel": 0.8
}
EOF


# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

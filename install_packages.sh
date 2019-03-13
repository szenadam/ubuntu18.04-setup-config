#!/bin/bash

# Update/Upgrade
apt-get update
apt-get upgrade

# General packages
apt-get install -y \
    build-essential curl vim \
    tree git tmux gnome-tweak-tool \
    apt-transport-https ca-certificates software-properties-common
echo 'set -g default-terminal "screen-256color"' >> $HOME/-tmux.conf

# VS Code
wget https://update.code.visualstudio.com/latest/linux-deb-x64/stable -O vscode_stable.deb
dpkg -i vscode_stable.deb
rm -f vscode_stable.deb

# VS Code extensions
code --install-extension dbaeumer.vscode-eslint
code --install-extension EditorConfig.EditorConfig
code --install-extension esbenp.prettier-vscode
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.csharp
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension PeterJausovec.vscode-docker
code --install-extension PKief.material-icon-theme


# Configure settings for VS Code
mkdir -p "$HOME/.config/Code/User"
cat << EOF > $HOME/.config/Code/User/settings.json
{
    "window.zoomLevel": 0.8,
    "workbench.iconTheme": "material-icon-theme"
}
EOF

cat << EOF > $HOME/.config/Code/User/keybindings.json
[
    {
        "key": "ctrl+t",
        "command": "workbench.action.terminal.focus"
    },
    {
        "key": "ctrl+t",
        "command": "-workbench.action.showAllSymbols"
    },
    {
        "key": "ctrl+shift+numpad_add",
        "command": "git.stageAll"
    }
]
EOF


# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

# Spotify
snap install spotify

# Nodejs
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt install nodejs

# NPM packages
npm i -g eslint

# Docker
apt update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update
apt-cache policy docker-ce
apt install docker-ce
usermod -aG docker ${USER}
curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Bash aliases
cat <<< EOF >>> $HOME/.bashrc
alias gs="git status"
alias gs="git status"
#!/bin/bash

# Update/Upgrade
apt-get update
apt-get upgrade

# General packages
apt-get install build-essential curl vim tree git tmux

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
    }
]
EOF


# Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

# Spotify
snap install spotify
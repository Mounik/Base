#!/bin/bash

# Mise à jour des paquets et installation de Nala
echo "Mise à jour des paquets et installation de Nala..."
sudo apt update && sudo apt install -y nala

# Installation de Git
echo "Installation de Git..."
sudo nala install -y git

# Installation de Visual Studio Code
echo "Installation de Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo nala install -y code

# Installation des extensions Visual Studio Code
extensions=(
    "ms-python.python"
    "aaron-bond.better-comments"
    "dracula-theme.theme-dracula"
    "usernamehw.errorlens"
    "ms-ceintl.vscode-language-pack-fr"
    "github.copilot"
    "oderwat.indent-rainbow"
    "ms-python.isort"
    "yzhang.markdown-all-in-one"
    "esbenp.prettier-vscode"
    "kevinrose.vsc-python-indent"
    "mechatroner.rainbow-csv"
    "foxundermoon.shell-format"
    "emmanuelbeziat.vscode-great-icons"
    "redhat.vscode-yaml"
)
for extension in "${extensions[@]}"; do
    if ! code --list-extensions | grep -q $extension; then
        code --install-extension $extension
    fi
done

# Installation et configuration d'Ansible
echo "Installation et configuration d'Ansible..."
sudo nala install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo nala install -y ansible

# Configuration de Git
echo "Configuration de Git..."
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@example.com"

# Clonage et installation du thème Dracula pour le terminal GNOME
echo "Clonage et installation du thème Dracula pour le terminal GNOME..."
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh
cd ..
rm -rf gnome-terminal

# Installation de Docker
echo "Installation de Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker

echo "Installation terminée. Veuillez redémarrer votre ordinateur pour appliquer les changements."
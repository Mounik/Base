#!/bin/bash

# Mettre à jour la liste des paquets et installer nala
sudo apt update
sudo apt install -y nala

# Utiliser nala pour installer git, ansible et visual studio code
sudo nala install -y git ansible

# Ajouter le dépôt de Visual Studio Code et installer le paquet
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo nala update
sudo nala install -y code

# Fonction pour vérifier si une extension est installée
is_extension_installed() {
    code --list-extensions | grep -q "$1"
}

# Liste des extensions à installer
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

# Installer les extensions si elles ne sont pas déjà installées
for extension in "${extensions[@]}"; do
    if is_extension_installed "$extension"; then
        echo "L'extension $extension est déjà installée."
    else
        echo "Installation de l'extension $extension..."
        code --install-extension "$extension"
    fi
done

echo "Installation terminée avec succès."
# Script d'installation

Ce script `install.sh` automatise l'installation et la configuration de plusieurs outils et extensions sur une machine Ubuntu.

## Contenu du script

1. **Mise à jour des paquets et installation de Nala**
2. **Installation de Git**
3. **Installation de Visual Studio Code**
4. **Installation des extensions Visual Studio Code**
5. **Installation et configuration d'Ansible**
6. **Configuration de Git**
7. **Clonage et installation du thème Dracula pour le terminal GNOME**
8. **Installation de Docker**

## Prérequis

- Ubuntu 20.04 ou supérieur
- Accès sudo

## Utilisation

1. Clonez ce dépôt ou téléchargez le fichier `install.sh`.
2. Rendez le script exécutable :
    ```sh
    chmod +x install.sh
    ```
3. Exécutez le script :
    ```sh
    ./install.sh
    ```

## Détails des étapes

### Mise à jour des paquets et installation de Nala

Le script commence par mettre à jour la liste des paquets et installer Nala, un gestionnaire de paquets alternatif pour APT.

### Installation de Git

Ensuite, il installe Git en utilisant Nala.

### Installation de Visual Studio Code

Le script ajoute le dépôt de Visual Studio Code, met à jour la liste des paquets et installe Visual Studio Code.

### Installation des extensions Visual Studio Code

Le script vérifie si chaque extension de la liste est déjà installée. Si ce n'est pas le cas, il installe l'extension.

### Installation et configuration d'Ansible

Le script ajoute le PPA d'Ansible, met à jour la liste des paquets et installe Ansible.

### Configuration de Git

Le script configure le nom d'utilisateur et l'email global pour Git.

### Clonage et installation du thème Dracula pour le terminal GNOME

Le script clone le dépôt du thème Dracula pour le terminal GNOME, exécute le script d'installation et supprime le dépôt cloné.

### Installation de Docker

Le script télécharge et exécute le script d'installation de Docker, puis ajoute l'utilisateur au groupe Docker.

## Auteurs

- Mounik

## Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.
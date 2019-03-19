#!/bin/bash

# set -euxo pipefail

export PATH=$PATH:$HOME/.meteor

# cd /calendar-app

echo " "
echo " Vérif existence répertoire home du user"
echo " "
echo " Qui suis-je ? $(whoami)"
echo " Où suis-je ? $(pwd)"
ls -all .
echo " Ma maison est : [$HOME]"
ls -all $HOME
echo " "



meteor --version

meteor reset

meteor run

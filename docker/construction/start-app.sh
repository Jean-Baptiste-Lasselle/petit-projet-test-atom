#!/bin/bash

# set -euxo pipefail

echo " "
echo " Vérif existence répertoire home du user"
echo " "
echo " Qui suis-je ? $(whoami)"
echo " Où suis-je ? $(pwd)"
echo " Ma maison est : [$HOME]"
ls -all $HOME
echo " "



meteor --version

meteor run

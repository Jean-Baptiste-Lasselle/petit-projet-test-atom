#!/bin/bash

set -euxo pipefail

RUN echo " "
RUN echo " Vérif existence répertoire home du user"
RUN echo " "
RUN echo " Qui suis-je ? $(whoami)"
RUN echo " Ma maison est : [$HOME]"
RUN ls -all $HOME
RUN echo " "

meteor --version

meteor run

FROM centos:7

MAINTAINER Jean-Baptiste Lasselle
LABEL maintainer="jean.baptiste.lasselle@gmail.com"

# Pour CentOS le groupe "sudo"  n'existe pas, mais c'est le groupe "wheel" qui existe, et qu'il faut utiliser
ARG SUODERS_SYSTEM_GROUP=wheel
ENV SUODERS_SYSTEM_GROUP=wheel

ARG PEGASUS_USER_NAME=jbl-devops
ENV PEGASUS_USER_NAME=$PEGASUS_USER_NAME

ARG PEGASUS_USER_PWD=marguerite
ENV PEGASUS_USER_PWD=$PEGASUS_USER_PWD



ARG URI_REPO_GIT_APPLICATION_TESTEE=https://github.com/icharlie/mCalendar


RUN echo "# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #"
RUN echo "# + Création de l'utilisateur Linux Pegasus           $PEGASUS_USER_NAME           + #"
RUN echo "# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #"

# quietly add a user without password
RUN useradd --shell /bin/sh --home-dir /home/$PEGASUS_USER_NAME_USER_NAME $PEGASUS_USER_NAME

# set password
RUN echo "$PEGASUS_USER_NAME:$PEGASUS_USER_PWD" | chpasswd
# Et on fait de l'utilisateur $PEGASUS_USER_NAME_USER_NAME, un administrateur (aura le droit d'utiliser sudo?...).


# Il existe aussi la possibilité de créer un groupe, et de définir ce groupe comme un groupe administrateur dans /etc/sudoers

RUN usermod -aG $SUODERS_SYSTEM_GROUP $PEGASUS_USER_NAME
# Pour Debian / Ubuntu le groupe "wheel"  n'existe pas, mais c'est le groupe "sudo" qui existe, et qu'il faut utiliser
# RUN usermod -aG sudo $PEGASUS_USER_NAME_USER_NAME

USER $PEGASUS_USER_NAME

RUN echo " "
RUN echo " Vérif existence répertoire home du user"
RUN echo " "
RUN echo " Qui suis-je ? $(whoami)"
RUN echo " Ma maison est : [$HOME]"
RUN ls -all $HOME
RUN echo " "


# installation de meteor 
RUN curl https://install.meteor.com/ | sh
RUN meteor --version


# code application
RUN mkdir /calendar-app
WORKDIR /calendar-app
RUN git clone $URI_REPO_GIT_APPLICATION_TESTEE

CMD ["meteor", "run"]

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


RUN yum update -y && yum install -y git


RUN echo "# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #"
RUN echo "# + Création de l'utilisateur Linux Pegasus           $PEGASUS_USER_NAME           + #"
RUN echo "# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #"

# quietly add a user without password
RUN useradd --shell /bin/sh --home-dir /home/$PEGASUS_USER_NAME $PEGASUS_USER_NAME

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

USER root

# maison application
RUN mkdir /calendar-app

# doit appartenir au user $PEGASUS_USER_NAME
RUN chown -R $PEGASUS_USER_NAME:$SUODERS_SYSTEM_GROUP /calendar-app

USER $PEGASUS_USER_NAME

RUN echo "# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #"
# RUN echo "# + Installation du Meteor Framework, version [$VERSION_METEOR_FRAMEWORK] + #"
RUN echo "# + Installation du Meteor Framework                             + #"
RUN echo "# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #"

# curl https://install.meteor.com/ | sh
RUN sh -c "$(curl -sSL https://install.meteor.com/)"
# On doit maintenant faire en sorte que les users aient tous dans leur profil, l'ajout dans PATH, de
# la valeur du chemin de l'exécutable meteor :  PATH=$PATH:~/opt/bin dans le PATH

RUN echo " Verif exsitence : [\$HOME/.meteor]"
RUN ls -all $HOME
RUN ls -all $HOME/.meteor
RUN echo " "

USER root
RUN echo "export PATH=\$PATH:\$HOME/.meteor" >> /etc/profile

# Je prends la liberté de créer dès maintenant le répertoire
# RUN mkdir -p /home/$PEGASUS_USER_NAME/.meteor
# RUN chown -R $PEGASUS_USER_NAME:$SUODERS_SYSTEM_GROUP /home/$PEGASUS_USER_NAME/.meteor



USER $PEGASUS_USER_NAME

WORKDIR /calendar-app

RUN git clone $URI_REPO_GIT_APPLICATION_TESTEE


RUN meteor --version
RUN echo " "
RUN echo " Vérif existence répertoire home du user"
RUN echo " "
RUN echo " Qui suis-je ? $(whoami)"
RUN echo " Ma maison est : [$HOME]"
RUN ls -all $HOME
RUN echo " "

EXPOSE 3000

CMD ["meteor", "run"]

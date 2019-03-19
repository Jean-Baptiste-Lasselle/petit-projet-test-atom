FROM centos:7


ARG URI_REPO_GIT_APPLICATION_TESTEE=https://github.com/icharlie/mCalendar
# installation de meteor 
RUN curl https://install.meteor.com/ | sh
RUN meteor --version


# code application
RUN mkdir /calendar-app
WORKDIR /calendar-app
RUN git clone $URI_REPO_GIT_APPLICATION_TESTEE

CMD ["meteor", "run"]

FROM ubuntu:16.04

MAINTAINER colin.lin@prophetstor.com

ARG sencha_ver=6.6.0.13

RUN mkdir -p /home/git_home

WORKDIR /home/git_home

RUN apt-get update && apt-get install -y \
   wget unzip default-jre python python-pip git sudo vim curl

RUN curl -sSL https://get.docker.com/ | sh && apt-get update -y && apt-get upgrade -y && apt-get install -y docker.io

RUN wget http://cdn.sencha.com/cmd/$sencha_ver/no-jre/SenchaCmd-$sencha_ver-linux-amd64.sh.zip -O senchacmd.zip && unzip senchacmd.zip && rm senchacmd.zip && chmod +x SenchaCmd-$sencha_ver-linux-amd64.sh
RUN ./SenchaCmd-$sencha_ver-linux-amd64.sh -q -dir /opt/Sencha/Cmd/$sencha_ver -Dall=true
RUN rm SenchaCmd-$sencha_ver-linux-amd64.sh && chmod +x /opt/Sencha/Cmd/$sencha_ver/sencha

RUN pip2 install --upgrade pip && pip2 install multiprocessing requests urllib3 pywinrm croniter servicemanager tzlocal paramiko Flask-RESTful Flask Flask-HTTPAuth

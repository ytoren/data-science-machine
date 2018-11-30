FROM ubuntu:latest
LABEL maintainer="ytoren@gmail.com"
LABEL version="1.0"

ARG NB_USER="nbuser"
ARG NB_UID="1000"
ARG NB_GID="100"

USER root


## Base setup
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get -y install git wget bzip2 ca-certificates sudo locales fonts-liberation
RUN apt-get -y autoremove  && apt-get -y clean && apt-get -y autoclean

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

ENV SHELL=/bin/bash \
    NB_USER=$NB_USER \
    NB_UID=$NB_UID \
    NB_GID=$NB_GID \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV HOME=/home/$NB_USER

RUN groupadd wheel -g 11 && \
    echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su && \
    useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    chmod g+w /etc/passwd && \
    chown $NB_USER:$NB_GID $HOME

USER $NB_UID
RUN mkdir /home/$NB_USER/work

## Python
USER root
RUN apt-get -y install python3-pip
RUN pip3 install -U pip

## Jupyter
USER root
RUN pip3 install jupyter jupyter_contrib_nbextensions jupyter_nbextensions_configurator

USER $NB_UID
RUN jupyter-contrib nbextension install --user
RUN jupyter nbextensions_configurator enable --user
## Should show OK
RUN jupyter nbextension enable varInspector/main
RUN jupyter nbextension enable spellchecker/main
RUN jupyter nbextension enable toc2/main

## Packges
USER root
RUN pip3 install numpy pandas scipy scikit-learn matplotlib feather-format sqlalchemy psycopg2-binary

## Finally
USER root
EXPOSE 8888
WORKDIR $HOME
# avoid accidental container runs as root
USER $NB_UID
CMD ["/usr/local/bin/jupyter-notebook", "--no-browser","--NotebookApp.token=''","--NotebookApp.password=''", "--ip=0.0.0.0"]

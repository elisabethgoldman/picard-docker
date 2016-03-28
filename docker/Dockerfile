FROM quay.io/jeremiahsavage/cdis_base

ENV picard_docker 0.1

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --force-yes \
    openjdk-8-jre-headless \
    r-base \
    unzip \
    wget

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER ubuntu

ENV HOME /home/ubuntu

RUN mkdir ${HOME}/tools

WORKDIR ${HOME}/tools/

RUN wget https://github.com/broadinstitute/picard/releases/download/2.1.1/picard-tools-2.1.1.zip \
    && git clone https://github.com/broadinstitute/picard.git \
    &&  mv ${HOME}/tools/picard/src ${HOME}/ \
    && unzip picard-tools-2.1.1.zip \
    && mv picard-tools-2.1.1 picard-tools \
    && rm *.zip

WORKDIR ${HOME}

RUN pip install --user virtualenvwrapper \
    && /bin/bash -c "source ${HOME}/.local/bin/virtualenvwrapper.sh \
    && mkvirtualenv --python=/usr/bin/python3 p3 \
    && pip install ipython pandas sqlalchemy \
    && echo source ${HOME}/.local/bin/virtualenvwrapper.sh >> ${HOME}/.bashrc \
    && echo source ${HOME}/.virtualenvs/p3/bin/activate >> ${HOME}/.bashrc"

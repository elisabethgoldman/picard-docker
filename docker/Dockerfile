FROM ubuntu:15.10

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

USER root

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get dist-upgrade -y --force-yes

RUN apt-get update && apt-get install -y --force-yes \
    gcc \
    gfortran \
    git \
    openjdk-8-jre-headless \
    python-pip \
    python-virtualenv \
    python3-dev \
    r-base \
    software-properties-common \
    time \
    unzip \
    wget \
    zlib1g-dev

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN adduser --disabled-password --gecos '' ubuntu && adduser ubuntu sudo && echo "ubuntu	ALL=(ALL)	NOPASSWD:ALL" >> /etc/sudoers.d/ubuntu

USER ubuntu

ENV HOME /home/ubuntu

RUN mkdir ${HOME}/tools

WORKDIR ${HOME}/tools/

RUN wget https://github.com/broadinstitute/picard/releases/download/2.0.1/picard-tools-2.0.1.zip \
    && git clone https://github.com/broadinstitute/picard.git \
    &&  mv ${HOME}/tools/picard/src ${HOME}/ \
    && unzip picard-tools-2.0.1.zip \
    && mv picard-tools-2.0.1 picard-tools \
    && rm *.zip

WORKDIR ${HOME}

RUN pip install --user virtualenvwrapper \
    && /bin/bash -c "source ${HOME}/.local/bin/virtualenvwrapper.sh \
    && mkvirtualenv --python=/usr/bin/python3 p3 \
    && pip install ipython pandas sqlalchemy \
    && echo source ${HOME}/.local/bin/virtualenvwrapper.sh >> ${HOME}/.bashrc \
    && echo source ${HOME}/.virtualenvs/p3/bin/activate >> ${HOME}/.bashrc"

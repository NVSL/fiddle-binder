FROM jupyter/scipy-notebook:lab-3.2.5
### create user with a home directory
#ARG NB_USER
#ARG NB_UID
#ENV USER ${NB_USER}
#ENV HOME /home/${NB_USER}

#WORKDIR /tmp
USER root
RUN env
RUN apt-get update --fix-missing; apt-get update
RUN apt-get install -y gcc make g++ gdb build-essential libboost-dev graphviz curl && apt-get clean -y #gcc-8 g++-8 libhdf5-dev uuid-runtime  openssh-client time  default-jdk
RUN curl -L https://github.com/radareorg/radare2/releases/download/5.3.1/radare2-dev_5.3.1_amd64.deb -o /tmp/radare2-dev_5.3.1_amd64.deb
RUN curl -L https://github.com/radareorg/radare2/releases/download/5.3.1/radare2_5.3.1_amd64.deb -o /tmp/radare2_5.3.1_amd64.deb
RUN apt install /tmp/radare2_5.3.1_amd64.deb  /tmp/radare2-dev_5.3.1_amd64.deb

RUN pip install wheel			   
RUN sudo git clone https://github.com/NVSL/fiddle.git && cd fiddle; pip install .
ENV LD_LIBRARY_PATH  /opt/conda/lib/python3.9/site-packages/fiddle/resources/libfiddle
#RUN adduser --disabled-password \
#    --gecos "Default user" \
#    --uid ${NB_UID} \
#    ${NB_USER}
#WORKDIR ${HOME}

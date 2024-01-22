FROM ubuntu:18.04
RUN apt-get update 
RUN apt-get -y install build-essential


RUN apt-get -y install python3
RUN apt-get -y install clang
RUN apt-get -y install autoconf
RUN apt-get -y install bison
RUN apt-get -y install re2c
RUN apt-get -y install pkg-config
RUN apt-get -y install libicu-dev
RUN apt-get -y install automake
RUN apt-get -y install libtool
#RUN python3 /artifact/run.py

RUN mkdir /artifact
COPY run.py /artifact
COPY juliet /artifact/juliet
COPY linuxflaw /artifact/linuxflaw
COPY magma /artifact/magma
COPY LLVM-GiantSan /artifact/LLVM-GiantSan
COPY activeGiantSan.sh /artifact/
COPY LLVM-ASan /artifact/LLVM-ASan
COPY activeASan.sh /artifact/

FROM arm32v7/debian:stretch-slim

RUN wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-armv7l.sh
RUN /bin/bash Miniconda3-latest-Linux-armv7l.sh

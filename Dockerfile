FROM arm32v7/debian:stretch-slim

ENV LANG C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:/bin:$PATH

RUN apt-get update && \
    apt-get install -y wget bzip2 ca-certificates curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q -O ~/miniconda.sh http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-armv7l.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \ 
    /opt/conda/bin/conda list && \
    /opt/conda/bin/conda install conda-build && \
    /opt/conda/bin/conda clean -tipsy 
    
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-armhf /usr/bin/tini
RUN chmod +x /usr/bin/tini

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]

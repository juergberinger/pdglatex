# Dockerfile for PDG LaTeX image

FROM centos:7
LABEL maintainer="Juerg Beringer <juerg.beringer@gmail.com>"

RUN yum -y install make && \
    yum -y install subversion && \
    yum -y install perl-Digest-MD5 && \
    yum clean all

WORKDIR /tmp/install-tl
COPY install-tl-unx.tar.gz pdglatex.profile ./
RUN tar -xzvf install-tl-unx.tar.gz --strip-components=1 && \
    ./install-tl -profile pdglatex.profile

# Run-time environment
ENV PATH /usr/local/texlive/2018/bin/x86_64-linux/:$PATH

# Normally will override this with -v ${PWD}:${PWD} -w ${PWD}
VOLUME /home
WORKDIR /home

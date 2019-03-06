# Dockerfile for PDG LaTeX image

FROM centos:7
LABEL maintainer="Juerg Beringer <juerg.beringer@gmail.com>"

RUN yum -y install make && \
    yum -y install subversion && \
    yum -y install perl-Digest-MD5 && \
    yum clean all

# TeXLive installation
WORKDIR /tmp/install-tl
COPY install-tl-unx.tar.gz pdglatex.profile ./
RUN tar -xzvf install-tl-unx.tar.gz --strip-components=1 && \
    ./install-tl -profile pdglatex.profile

# Cleanup
WORKDIR /tmp
RUN rm -rf /tmp/install-tl

# Run-time environment
ENV PATH /usr/local/texlive/2018/bin/x86_64-linux/:$PATH
ENV MANPATH=/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH
ENV INFOPATH=/usr/local/texlive/2018/texmf-dist/doc/info:$INFOPATH

# Normally will override this with -v ${PWD}:${PWD} -w ${PWD}
VOLUME /home
WORKDIR /home

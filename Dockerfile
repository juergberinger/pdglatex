# Dockerfile for PDG LaTeX image

FROM centos:7
LABEL maintainer="Juerg Beringer <jberinger@lbl.gov>"

RUN yum -y install make && \
    yum -y install subversion && \
    yum -y install perl-Digest-MD5 && \
    yum clean all

WORKDIR /tmp/install-tl
COPY install-tl-unx.tar.gz .
RUN tar -xzvf install-tl-unx.tar.gz --strip-components=1

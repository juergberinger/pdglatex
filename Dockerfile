# Dockerfile for PDG LaTeX image

FROM centos:7
LABEL maintainer="Juerg Beringer <jberinger@lbl.gov>"

RUN yum -y install make subversion


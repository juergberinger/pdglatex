#!/bin/bash

if [ "$1" != "" ]; then
    docker run --rm -it -u `id -u`:`id -g` -v ${PWD}:${PWD} -w ${PWD} juergberinger/pdglatex make $*
else
    docker run --rm -it -u `id -u`:`id -g` -v ${PWD}:${PWD} -w ${PWD} juergberinger/pdglatex make
fi

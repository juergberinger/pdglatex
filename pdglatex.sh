#!/bin/sh

docker run --rm -it -u `id -u`:`id -g` -v ${PWD}:${PWD} -w ${PWD} pdglatex
